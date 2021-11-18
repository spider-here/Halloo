import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../Home/Home.dart';

class ProfileRegisteration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileRegState();
  }

}

class ProfileRegState extends State{

  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  FirebaseStorage storage = FirebaseStorage.instance;
  late File image;
  String imgUrl="";
  bool _showLoading = false;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneNoController = new TextEditingController();
  TextEditingController _bioController = new TextEditingController();
  String _code = "+92";
  String uid=Uuid().v1();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
            child: Stack(
              children: [
                Align(
                    alignment: FractionalOffset.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Complete Profile", style: TextStyle(fontSize: 25.0),),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor
                          ),
                          height: MediaQuery.of(context).size.height / 8,
                          child: Stack(children: [
                            Align(
                                alignment: FractionalOffset.center,
                                child: Icon(Icons.person, color: Colors.white, size: MediaQuery.of(context).size.height / 8,),
                            ),
                            Align(
                              alignment: FractionalOffset.center,
                              child: InkWell(onTap: (){pickImage();}, child: Icon(Icons.photo_camera, size: MediaQuery.of(context).size.height / 14,
                                color: Colors.black38,),)
                            )

                          ],)
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: TextField(
                              style: TextStyle(fontSize: 16.0),
                              controller: _nameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  contentPadding: EdgeInsets.all(5.0)),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: TextField(
                              style: TextStyle(fontSize: 16.0),
                              controller: _emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  contentPadding: EdgeInsets.all(5.0)),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Row(children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width/3,
                                child: CountryCodePicker(
                                  onChanged: (change){_code=change.dialCode.toString();},
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: 'PK',
                                  favorite: ['+92','PK'],
                                  alignLeft: true,
                                ),
                              ),
                              SizedBox(width:MediaQuery.of(context).size.width/2,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _phoneNoController,
                                    style: TextStyle(fontSize: 16.0),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone Number",
                                        contentPadding: EdgeInsets.all(5.0)),
                                  ))],)
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: TextField(
                              style: TextStyle(fontSize: 16.0),
                              controller: _bioController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Bio",
                                  contentPadding: EdgeInsets.all(6.0)),
                            )
                        ),
                      ],
                    )),
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.height / 16,
                      child: ElevatedButton(
                          onPressed: (){registerProfile();Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=>Home()));},
                          child: Text("CONTINUE")),
                    )),
                Align(
                  alignment: FractionalOffset.center,
                  child: _showLoading?CircularProgressIndicator(color: Theme.of(context).primaryColor,)
                :SizedBox(width:0.0, height:0.0))
              ],
            ),
          ))
    ));
  }

  registerProfile(){
    dbRef=dbRef.child("UserProfiles");
    dbRef.child(uid).child("id").set(uid);
    dbRef.child(uid).child("profilePictureURL").set(imgUrl);
    dbRef.child(uid).child("name").set(_nameController.text);
    dbRef.child(uid).child("email").set(_emailController.text);
    dbRef.child(uid).child("phone_no").set(_code+_phoneNoController.text);
    dbRef.child(uid).child("bio").set(_bioController.text);
  }

  pickImage() async{
    try{
      PickedFile? pickimage = (await ImagePicker.platform.pickImage(source: ImageSource.gallery));
      uploadImage(File(pickimage!.path));
    }
    on PlatformException catch (e){

    }
  }

  uploadImage(File pickedFile) async {
    setState(() {
      _showLoading = true;
    });
    Reference stoRef = storage.ref().child("ProfilePictures/$uid");
    UploadTask uploadTask = stoRef.putFile(pickedFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() =>setState(() {
      _showLoading = false;
    }));
    imgUrl = taskSnapshot.ref.getDownloadURL().toString();
  }

}