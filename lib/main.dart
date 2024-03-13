import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var like = [0, 0, 0];
  var name = ['김영숙', '홍길동', '피자집'];

  up(index) {
    setState(() {
      like[index]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      child: Container(
                        height: 500,
                        padding: EdgeInsets.all(30),
                        child:
                          Column(
                            children: [
                              TextField(),
                              Row(
                                children: [
                                  TextButton(onPressed: () {},
                                      child: Text('완료')),
                                  TextButton(onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                      child: Text('취소'))
                                ],
                              )
                            ],
                          )
                      )
                  );
                }
            );
          },
          child: Text('버튼'),
        ),
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: like.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(like[index].toString()),
                    Text(name[index]),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      up(index);
                    },
                    child: Text('좋아요')),
              ],
            );
          },
        ));
  }
}
