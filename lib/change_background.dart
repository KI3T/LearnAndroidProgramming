import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyAppChangeBackground extends StatelessWidget {
  const MyAppChangeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giới Thiệu Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ChangeBackgroundHomePage(title: 'Thay đổi màu phong nền'),
    );
  }
}

class ChangeBackgroundHomePage extends StatefulWidget {
  const ChangeBackgroundHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ChangeBackgroundHomePageState createState() => _ChangeBackgroundHomePageState();
}

class _ChangeBackgroundHomePageState extends State<ChangeBackgroundHomePage> {
  Color _backgroundColor = Colors.white;
  final List<Color> _colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];

  void changeBackgroundColor() {
    setState(() {
      int nextColorIndex = (_colorList.indexOf(_backgroundColor) + 1) % _colorList.length;
      _backgroundColor = _colorList[nextColorIndex];
    });
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color selectedColor = _backgroundColor;

        return AlertDialog(
          title: Text('Chọn màu nền'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                selectedColor = color;
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _backgroundColor = selectedColor;
                });
                Navigator.of(context).pop();
              },
              child: Text('Chấp nhận'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            alignment: Alignment.center,
            width: 390,
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            changeBackgroundColor();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'Màu ngẫu nhiên',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            _showColorPicker(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'Chọn màu',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
