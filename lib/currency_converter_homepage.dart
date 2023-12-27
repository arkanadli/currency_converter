import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// :: statefull widget accomodire apps to rebuild the widget, if thereis some set.state Called
class CurrencyConverterHomepage extends StatefulWidget {
  const CurrencyConverterHomepage({super.key});

  //:: we rewrite the generic state into some specific <class> so that it knows well where it refer
  @override
  State<CurrencyConverterHomepage> createState() =>
      _CurrencyConverterHomepageState();
}

// :: we create some state class that only this file can access
class _CurrencyConverterHomepageState extends State<CurrencyConverterHomepage> {
  //:: we initiate all variable that expensive if we initiate in build function
  double result = 0;
  TextEditingController textEditingController = TextEditingController(); 
  void convertCurrency() {
    double userInput = textEditingController.text != ''
        ? double.parse(textEditingController.text)
        : 0;
    result = userInput * 15535.95;
    // :: this will tell the widget that this need to be rebuild, only rebuild needed widgets
    // :: its only can in statefull widgets
    setState(() {});

    if (kDebugMode) {
      print(userInput);
      print(result);
    }
  }

  // :: this function will called when we want to discard the widget,(going to another page)
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  //:: the build must be light process, because its really need to be loaded as fast as possible!
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      // create a smaller scale of materialApp
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 8, 26, 59),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 150),
              child: Text(
                "Rp. ${result != 0 ? result.toStringAsFixed(2) : "0"}",
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Masukkan jumlah USD",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: convertCurrency,
                style: ElevatedButton.styleFrom(
                  elevation: 14,
                  // padding: MaterialStatePropertyAll(EdgeInsets.all(14)),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                child: const Text('Konversi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
