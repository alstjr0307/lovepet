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
          Name('시츄'),
          Property(18, ['산책 좋아함','귀여움'
          ])
        ],

      )
    );
  }
}
Widget _MainPhoto() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0,100,0,50),
    child: Center(
      child: CircleAvatar(
        radius: 100,
        child: Image.asset('ss', scale: 10,),
      )
    ),
  );
}
Widget Name(String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Container(
           child: Text(name, style: TextStyle(fontFamily: 'Nanum', fontWeight:FontWeight.w800,fontSize: 30),),
      ),
    ),
  );
}
Widget Property(int Age, List properties) {
  return Center(
    child: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('나이' + Age.toString(), style: TextStyle(fontFamily: 'Nanum', fontWeight:FontWeight.w700,fontSize: 15),),
          ),
          for (String property in properties)
            Text('- '+ property, style: TextStyle(fontFamily: 'Nanum', fontWeight:FontWeight.w700,fontSize: 15),),



        ],
      ),
    ),
  );
}