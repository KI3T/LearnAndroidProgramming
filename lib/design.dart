import 'package:flutter/material.dart';

class MyAppDesign extends StatelessWidget {
  const MyAppDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trang chủ thử nghiệm của tôi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const DesignHomePage(title: 'Trang chủ thử nghiệm Flutter'),
    );
  }
}

class DesignHomePage extends StatelessWidget {
  const DesignHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ thử nghiệm của tôi'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Họ và tên: Lê Tuấn Kiệt',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Text(
                'MSSV: 0850080079',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Text(
                'Màn hình chính',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 20),
              buildRowLayout(),
              SizedBox(height: 20),
              Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/bfc8defed4ac2d549f0d.png',
                width: 120,
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Nút đã được bấm!')),
                  );
                },
                child: Text('Nhấn vào!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.orange,
        height: 100,
        width: 100,
      ),
    ],
  );
}
