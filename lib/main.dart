import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: 300,
          height: 100,
          child: Row(
            children: [
              Image.asset(
                'assets/camera.png',
                width: 100,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('123'),
                    Text('성동구 행당동'),
                    Text('210,000'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // 아이콘과 텍스트 오른쪽 정렬
                      children: [
                        Icon(Icons.favorite),
                        Text('4'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
