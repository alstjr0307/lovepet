import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String _name;
  late String _gender;
  late int _age;
  late List _dog_properties;
  var type = '시츄';
  Future<void> _getFuture() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _name = prefs.getString('dogname')!;
      _age = prefs.getInt('age')!;
      _dog_properties = prefs.getStringList('properties')!;
    });
  }

  var dog_name;
  var dog_age;
  var dog_properties;

  @override
  void initState() {
    super.initState();
    final sharedPreferences = SharedPreferences.getInstance();
    _getFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/setProfile');
          }, icon: Icon(Icons.edit,color: Colors.grey,)),
        ],

      ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            _MainPhoto(),
            Name('쵸코'),
            Property(18,'남', '시츄',['산책 좋아함', '귀여움'
            ])
          ],

        )
    );
  }
}

Widget _MainPhoto() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
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
        child: Text(name, style: TextStyle(
            fontFamily: 'Nanum', fontWeight: FontWeight.w800, fontSize: 30),),
      ),
    ),
  );
}

Widget Property(int Age, String gender, String type,List properties) {
  return Center(
    child: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(type, style: TextStyle(
                fontFamily: 'Nanum',
                fontWeight: FontWeight.w700,
                fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (gender == '남')
                  Icon(Icons.male),
                if(gender =='여')
                  Icon(Icons.female),
                Text(gender.toString(), style: TextStyle(
                    fontFamily: 'Nanum',
                    fontWeight: FontWeight.w700,
                    fontSize: 15),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('나이' + Age.toString(), style: TextStyle(
                fontFamily: 'Nanum',
                fontWeight: FontWeight.w700,
                fontSize: 15),),
          ),
          for (String property in properties)
            Text('- ' + property, style: TextStyle(fontFamily: 'Nanum',
                fontWeight: FontWeight.w700,
                fontSize: 15),),


        ],
      ),
    ),
  );
}