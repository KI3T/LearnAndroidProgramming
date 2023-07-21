import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      home: MyAppPrimality(),
    ),
  );
}

class MyAppPrimality extends StatelessWidget {
  const MyAppPrimality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiểm tra số nguyên tố',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const PrimalityHomePage(),
    );
  }
}

class PrimalityHomePage extends StatefulWidget {
  const PrimalityHomePage({Key? key}) : super(key: key);

  @override
  _PrimalityHomePageState createState() => _PrimalityHomePageState();
}

class _PrimalityHomePageState extends State<PrimalityHomePage> {
  TextEditingController _numberControllerN = TextEditingController();
  String _result = "Kết quả kiểm tra...";

  void checkNumber() {
    int numberN = int.tryParse(_numberControllerN.text) ?? 0;
    int dem = 0;

    if (numberN < 2) {
      _result = "Số bạn nhập không phải là số nguyên tố!";
    } else {
      for (int i = 2; i <= numberN / 2; i++) {
        if (numberN % i == 0) {
          dem++;
          break;
        }
      }
      if (dem == 0) {
        _result = "Số bạn nhập chính là số nguyên tố!";
      } else {
        _result = "Số bạn nhập không phải là số nguyên tố!";
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kiểm tra số nguyên tố',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImageField(),
              buildTextFiled(),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "$_result",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            checkNumber();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'Kiểm tra',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget buildTextFiled() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
          child: TextFormField(
            controller: _numberControllerN,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nhập số cần kiểm tra...',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageField() {
    return Column(
      children: [
        Image.network(
          'https://kienthuctonghop.vn/wp-content/uploads/2021/09/so-nguyen-to-la-gi-1.jpg',
          width: 250,
        ),
      ],
    );
  }
}
