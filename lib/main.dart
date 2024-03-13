import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var people = [
    {'name': '김영숙', 'like': 0, 'phone': '010-2222-2222'},
    {'name': '홍길동', 'like': 0, 'phone': '010-3333-3333'},
    {'name': '피자집', 'like': 0, 'phone': '010-4444-4444'}
  ];
  var num = 0;
  List<Contact> name = [];

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      //print(contacts[0].givenName);
      // var newPerson = Contact();
      // newPerson.givenName = '민수';
      // newPerson.familyName = '김';
      // ContactsService.addContact(newPerson);

      setState(() {
        name = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    // getPermission();
  }

  listAdd(n) {
    var newPerson = Contact();
    newPerson.givenName = n;
    ContactsService.addContact(newPerson);
  }

  numUp(index) {
    setState(() {
      // people[index]['like']를 int 타입으로 형변환하고, null일 경우 0을 기본값으로 사용합니다.
      var currentLikes = people[index]['like'] as int? ?? 0;
      people[index]['like'] = currentLikes + 1;
    });
  }

  delete(index) {
    setState(() {
      people.removeAt(index);
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
                  return Dialog(child: Dialog2(listAdd: listAdd));
                });
          },
          child: Text('버튼'),
        ),
        appBar: AppBar(
          title: Text(num.toString()),
          actions: [
            IconButton(
                onPressed: () {
                  getPermission();
                },
                icon: Icon(Icons.contacts))
          ],
        ),
        body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(people[index]['like'].toString()),
                    Text(name[index].givenName ?? '이름이 없음'),
                    // Text(people[index]['phone'].toString()),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      numUp(index);
                    },
                    child: Text('좋아요')),
                TextButton(
                    onPressed: () {
                      delete(index);
                    },
                    child: Text('삭제')),
              ],
            );
          },
        ));
  }
}

class Dialog2 extends StatelessWidget {
  Dialog2({super.key, this.listAdd});

  final listAdd;

  final text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: text,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      text.text.isEmpty ? null : listAdd(text.text);
                      Navigator.of(context).pop();
                    },
                    child: Text('완료')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소'))
              ],
            )
          ],
        ));
  }
}
