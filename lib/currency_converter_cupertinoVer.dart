import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CupertinoVersion extends StatefulWidget {
  const CupertinoVersion({super.key});

  @override
  State<CupertinoVersion> createState() => CupertinoVersionState();
}

class CupertinoVersionState extends State<CupertinoVersion> {
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

  @override
  Widget build(BuildContext context) {
    print('rebuild');

    return CupertinoPageScaffold(
      // create a smaller scale of materialApp
      navigationBar: const CupertinoNavigationBar(
        leading: Text('Currency Converter'),
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromARGB(255, 8, 26, 59),
      ),
      backgroundColor: CupertinoColors.systemGrey3,
      child: Center(
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
              child: CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                placeholder: "Masukkan jumlah USD",
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: CupertinoButton(
                onPressed: convertCurrency,
                color: CupertinoColors.black,
                child: const Text('Konversi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
