import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
class SetProfile extends StatefulWidget {
  const SetProfile({Key? key}) : super(key: key);

  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  TextEditingController inputName = TextEditingController();
  TextEditingController inputYear = TextEditingController();
  TextEditingController inputType = TextEditingController();
  List<TextEditingController> _controllers = [];
  List<TextField> _fields = [];
  late PickedFile _imageFile;
  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile as PickedFile;
    });
  }// 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
  final ImagePicker _picker = ImagePicker();
  TextField inputField(int num) {
    return TextField(
      controller: inputName,
      decoration: InputDecoration(
        labelText: '이름',
        hintText: '펫 이름을 입력해주세요!',
        labelStyle: TextStyle(color: Colors.redAccent),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

  String gender = 'M';

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _addTile() {
    return ListTile(
      title: Icon(Icons.add),
      onTap: () {
        final controller = TextEditingController();
        final field = TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "성격${_controllers.length + 1}",
          ),
        );

        setState(() {
          _controllers.add(controller);
          _fields.add(field);
        });
      },
    );
  }

  Widget _listView() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _fields.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            child: _fields[index],
          );
        },
      ),
    );
  }
  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage:AssetImage("static/Image/profile.jpg", ),


          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  // 클릭시 모달 팝업을 띄워준다.
                  showModalBottomSheet(context: context, builder: ((builder) => bottomSheet()));
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 40,
                ),
              )
          )
        ],
      ),
    );
  }

  // 카메라 아이콘 클릭시 띄울 모달 팝업
  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          children: <Widget>[
            Text(
              '애완동물 사진을 업로드하세요!',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera, size: 50,),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: Text('촬', style: TextStyle(fontSize: 20),),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.photo_library, size: 50,),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text('갤러리', style: TextStyle(fontSize: 20),),
                )
              ],
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InputField());
  }

  Widget InputField() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Text('펫 명함 수정', style: TextStyle(fontFamily:'NanumSquare',fontWeight: FontWeight.w800,fontSize: 30),),
              ),
            ),
            imageProfile(),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: TextField(
                controller: inputName,
                decoration: InputDecoration(
                  labelText: '이름',
                  hintText: '펫 이름을 입력해주세요!',
                  labelStyle: TextStyle(color: Colors.redAccent),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: TextField(
                controller: inputYear,
                decoration: InputDecoration(
                  labelText: '태어난 해',
                  hintText: '펫이 태어난 연도를 입력해주세요!',
                  labelStyle: TextStyle(color: Colors.redAccent),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: TextField(
                controller: inputType,
                decoration: InputDecoration(
                  labelText: '견종',
                  hintText: '펫의 종을 입력해주세요!',
                  labelStyle: TextStyle(color: Colors.redAccent),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: DropdownButtonFormField<String?>(
                decoration: InputDecoration(
                  labelText: '성별',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.redAccent),
                ),
                onChanged: (String? newValue) {
                  print(newValue);
                  gender = newValue!;
                },
                items: ['M', 'F'].map<DropdownMenuItem<String?>>((String? i) {
                  return DropdownMenuItem<String?>(
                    value: i,
                    child: Text({'M': '수컷', 'F': '암컷'}[i] ?? '선택'),
                  );
                }).toList(),
              ),
            ),
            _listView(),
            _addTile(),
          ],
        ),
      ),
    );
  }
}
