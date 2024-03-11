import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
    return MaterialApp(
        home: Scaffold(
            appBar:AppBar( title: Text('App'),),
            body: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(name[index]),
                    trailing: TextButton(child: Text('123'),),
                  );
                })
        )
    );
  }
}
