import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 변수 = 평생 안 바뀌는 것들은 변수에 받아도 상관없음. 아니면 성능 상 문제가 있을 수 있음.
var a = SizedBox(
  child: Text('안녕'),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar:AppBar(),
            // 스크롤바 생김
            // 스크롤 위침 감지
            // 메모리 절약
            body: ListView(
              children: [
                Text('안녕'),
                Text('안녕'),
                Text('안녕'),
                Text('안녕'),
                Text('안녕'),
                Text('안녕'),
                Text('안녕')
              ],
            ),
        )
    );
  }
}

// 커스텀위젯 단점
// state 관리 힘듦.

// 재사용 많은 ui
// 큰 위젯

// extends: 복사 오른쪽 -> 왼쪽
class ShopItem extends StatelessWidget {
  // 어떤 파라미터를 넣을 수 있는지 정의
  const ShopItem({super.key});
  // 내가 만든 것들을 적용해주세요
  @override
  // 다트에서는 작명() 가 함수 정의 문법임.
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Text('안녕'),
    );
  }
}
