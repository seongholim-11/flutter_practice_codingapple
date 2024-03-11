import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['김영숙2', '홍길동', '피자집'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context: 부모위젯의 정보를 담고있는 변수
            showDialog(context: context, builder: (context) {
              return Dialog(child: Text('안녕'));
            });
          },
        ),
        appBar: AppBar(title: Text('App'),),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(name[index]),
              );
            })
    );
  }
}
