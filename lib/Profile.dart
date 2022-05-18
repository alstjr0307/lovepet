import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _MainPhoto(),
          Name('시츄')
        ],

      )
    );
  }
}
Widget _MainPhoto() {
  return Center(
    child: CircleAvatar(

      child: Image.asset('ss'),
    )
  );
}
Widget Name(String name) {
  return Center(
    child: Container(
         child: Text(name, style: TextStyle(fontFamily: 'Nanum', fontWeight:FontWeight.w800),),
    ),
  );
}
