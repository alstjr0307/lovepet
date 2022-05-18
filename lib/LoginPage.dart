import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Home.dart';
import 'kakaologin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isKakaoTalkInstalled = false;


  _issueAccessToken(String authCode) async {
    try {
      print('sex');
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print(token);
      TokenManagerProvider.instance.manager.setToken(token);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginResult(),
          ));
    } catch (e) {
      print('sex');
      print(e.toString());
    }
  }
  _initKakaoTalkInstalled() async {

    final installed = await isKakaoTalkInstalled();
    setState(() {
      print(installed);
      _isKakaoTalkInstalled = installed;
    });
  }
  _loginWithKakao() async {
    try {
      OAuthToken token =await UserApi.instance.loginWithKakaoAccount();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginResult(),
          ));
    } catch (e) {print(e);}
  }

  _loginWithTalk() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginResult(),
          ));
    } catch (e) {print(e);}
  }

  var _available= false;
  @override
  void initState() {
    super.initState();
    String kakaoAppKey = "8b23a6ba425962d67f6ceda74101017d";
    _initKakaoTalkInstalled();
  }
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
                  onPressed: () async {

                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                      return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text(
                                '이용약관 동의',
                                style: TextStyle(
                                    color: Colors.black),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '이용약관에 동의하셔야 로그인 및 회원가입이 가능합니다',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.green.shade50),
                                      ),
                                      child: Text('이용약관 보러가기'),
                                      onPressed: () {
                                        launch(
                                          'http://13.209.92.180/agreement',
                                        );
                                        _available = true;
                                        setState(() {});
                                      }),
                                ],
                              ),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('동의 안함')),
                                FlatButton(
                                  onPressed: _available
                                      ? () async {
                                    print('ss');
                                    if (_isKakaoTalkInstalled)
                                      _loginWithTalk();
                                    else
                                      _loginWithKakao();
                                  }
                                      : null,
                                  child: Text(
                                      '동의', style: TextStyle()),
                                ),
                              ],
                            );
                          });
                    },
                    );
                  },
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
