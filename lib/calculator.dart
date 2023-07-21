import 'package:flutter/material.dart';

class MyAppCalculator extends StatelessWidget {
  const MyAppCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giới Thiệu Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Máy tính'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _aController;
  late TextEditingController _bController;
  String _result = '';

  @override
  void initState() {
    super.initState();
    _aController = TextEditingController();
    _bController = TextEditingController();
  }

  @override
  void dispose() {
    _aController.dispose();
    _bController.dispose();
    super.dispose();
  }

  void _onAdd() {
    int a = int.tryParse(_aController.text) ?? 0;
    int b = int.tryParse(_bController.text) ?? 0;
    int sum = a + b;
    setState(() {
      _result = 'Kết quả: $sum';
    });
  }

  void _onSubtract() {
    int a = int.tryParse(_aController.text) ?? 0;
    int b = int.tryParse(_bController.text) ?? 0;
    int difference = a - b;
    setState(() {
      _result = 'Kết quả: $difference';
    });
  }

  void _onMultiply() {
    int a = int.tryParse(_aController.text) ?? 0;
    int b = int.tryParse(_bController.text) ?? 0;
    int product = a * b;
    setState(() {
      _result = 'Kết quả: $product';
    });
  }

  void _onDivide() {
    int a = int.tryParse(_aController.text) ?? 0;
    int b = int.tryParse(_bController.text) ?? 1;
    double quotient = a / b;
    setState(() {
      _result = 'Kết quả: ${quotient.toInt()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lê Tuấn Kiệt',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _aController,
              decoration: InputDecoration(labelText: 'Nhập số a'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bController,
              decoration: InputDecoration(labelText: 'Nhập số b'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _onAdd,
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: _onSubtract,
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: _onMultiply,
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: _onDivide,
                  child: Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
