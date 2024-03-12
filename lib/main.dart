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
  var a = 1;
  var total = 3;
  var name = ['김영숙2', '홍길동', '피자집'];
  var like = [0, 0, 0];

  addOne() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context: 부모위젯의 정보를 담고있는 변수
            showDialog(
                context: context,
                builder: (context) {
                  return DialogUI(state: name, addOne: addOne);
                });
          },
        ),
        appBar: AppBar(
          title: Text(total.toString()),
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(name[index]),
              );
            }));
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.state, this.addOne}) : super(key: key);

  final state;
  final addOne;
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text('up'),
        onPressed: () {
          addOne();
        },
      ),
    );
  }
}
