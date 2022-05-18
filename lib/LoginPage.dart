import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.arrow_back))),
                      Center(
                        child: Container(
                          child: Text(
                            '환영합니다',
                            style: TextStyle(
                                fontFamily: 'NanumSquare',
                                fontWeight: FontWeight.w800,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: Container(
                    height: 1.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              child: Center(
                child: Container(
                    child: Text(
                  '러브펫 이용을 위해 카카오 계정으로 회원가입 해주세요',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nanum',
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 100),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  onPressed: () {},
                  color: Colors.yellow,
                  child: Text(
                    '카카오 로그인',
                    style: TextStyle(
                      fontFamily: 'Nanum',
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text('ss'),),
          ],
        ),
      ),
    );
  }
}
