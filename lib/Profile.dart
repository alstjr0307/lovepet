
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
      appBar:AppBar(
        actions: [

          _edit(context)
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: Column(
          children: [
            _MainPhoto(),

            Name('또박이'),
            Property(18, '시츄', ['산책 좋아함','귀여움'
            ]),
            _edit(context),
          ],

        )
    );
  }
}
Widget _MainPhoto() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0,100,0,10),
    child: Center(
        child: CircleAvatar(
          radius: 100,
          child: Image.asset('ss', scale: 10,),
        )
    ),
  );
}
Widget _edit(context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/setProfile');
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit,size: 15,color: Colors.grey,),
            Text(
              '편집',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),

      ),
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
Widget Property(int Age, String type,List properties) {
  return Center(
    child: Container(
      child: Column(
        children: [
          Text(type, style: TextStyle(fontFamily: 'Nanum', fontWeight:FontWeight.w700,fontSize: 15),),
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