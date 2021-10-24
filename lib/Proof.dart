
import 'dart:convert';
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:pura/terms.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'confirm.dart';
import 'login.dart';


class Proof extends StatefulWidget {
  Proof({Key? key}) : super(key: key);

  @override
  _ProofState createState() => _ProofState();
}

class _ProofState extends State<Proof> {
    
final photos = <File>[];
String? _adressproof;
String? _idproof;
String? _photo;
String? _adress;
String? _id;

  void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    photos.add(file);
                    
                    Navigator.pop(context);
                    setState(() {
                      final bytes = file.readAsBytesSync(); 
                       _adressproof = base64Encode(bytes);
                    });
                    print(_adressproof);
                   // base64Encode(photos.files.first.bytes);
                  },
                )));
  }
  void openCamera1() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    photos.add(file);
                    
                    Navigator.pop(context);
                    setState(() {
                      final bytes = file.readAsBytesSync(); 
                       _idproof = base64Encode(bytes);
                    });
                    print(_idproof);
                   // base64Encode(photos.files.first.bytes);
                  },
                )));
  }
  void openCamera2() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    photos.add(file);
                    
                    Navigator.pop(context);
                    setState(() {
                      final bytes = file.readAsBytesSync(); 
                       _photo = base64Encode(bytes);
                    });
                    print(_photo);
                   // base64Encode(photos.files.first.bytes);
                  },
                )));
  }

  
  
  var _status = '';

  _register()async{
     final perfs = await SharedPreferences.getInstance();
     perfs.setString('addressproof', _adressproof.toString());
     perfs.setString('idproof', _idproof.toString());
     perfs.setString('photo', _photo.toString());
     perfs.setString('adressid', _adress.toString());
     perfs.setString('idid', _id.toString());

     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Confirm()));

   
    
  }
  final List<Map<String, dynamic>> _items = [
  {
    'value': 'Aadhaar Card',
    'label': 'Aadhaar Card',
    'icon': Icon(Icons.panorama_vertical_select),
  },
  {
    'value': 'Driving Licence',
    'label': 'Driving Licence',
    'icon': Icon(Icons.fiber_manual_record),
    'textStyle': TextStyle(color: Colors.teal),
  },
  {
    'value': 'Voter ID',
    'label': 'Voter ID',
    'enable': true,
    'icon': Icon(Icons.grade),
  },
];
final List<Map<String, dynamic>> _items1 = [
  {
    'value': 'Aadhaar Card',
    'label': 'Aadhaar Card',
    'icon': Icon(Icons.panorama_vertical_select),
  },
  {
    'value': 'Driving Licence',
    'label': 'Driving Licence',
    'icon': Icon(Icons.fiber_manual_record),
    'textStyle': TextStyle(color: Colors.teal),
  },
  {
    'value': 'Voter ID',
    'label': 'Voter ID',
    'enable': true,
    'icon': Icon(Icons.grade),
  }, 
  {
    'value': 'Pan Card',
    'label': 'Pan Card',
    'icon': Icon(Icons.pan_tool),
    'textStyle': TextStyle(color: Colors.teal),
  },
];
  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
      backgroundColor: Colors.teal[800],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children:[ 
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ 
                    Image.asset('assets/logo/logo.png',height:100),
                    
                    Text('PURA',style: TextStyle(color: Colors.white, fontSize:60,fontWeight: FontWeight.w700),),
                    ])),
              
              Padding(padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('-------- Upload Documents --------',style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    Text(_status,style:TextStyle(color:Colors.white)),
                    SizedBox(height: 20,),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: SelectFormField(
                              type: SelectFormFieldType.dropdown, // or can be dialog
                              initialValue: 'circle',
                              //icon: Icon(Icons.format_shapes),
                              labelText: 'Select Adress Proof',
                              items: _items,
                              onChanged: (val) => {
                                _adress = val
                              },
                              onSaved: (val) => {
                                 _adress = val
                              },
                            ),
                      ),
                    ),
                        SizedBox(height: 20,),
                      
                     RaisedButton(
                       color: Colors.white,  
                              
                       onPressed: openCamera,
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.camera_alt,color:Colors.teal),
                             Text('Upload Adress Proof',style: TextStyle(color:Colors.teal),)
                           ],
                         ),
                       ),
                     ),
                     SizedBox(height: 20,),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: SelectFormField(
                              type: SelectFormFieldType.dropdown, // or can be dialog
                              initialValue: 'circle',
                              //icon: Icon(Icons.format_shapes),
                              labelText: 'Select ID proof',
                              items: _items1,
                              onChanged: (val) => {
                                _id = val
                              },
                              onSaved: (val) => {
                                _id = val
                              },
                            ),
                      ),
                    ),
                        SizedBox(height: 20,),
                      
                     RaisedButton(
                       color: Colors.white,  
                              
                       onPressed: openCamera1,
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.camera_alt,color:Colors.teal),
                             Text('Upload ID Proof',style: TextStyle(color:Colors.teal),)
                           ],
                         ),
                       ),
                     ),
                     SizedBox(height: 20,),
                      
                     RaisedButton(
                       color: Colors.white,  
                              
                       onPressed: openCamera2,
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.camera_alt,color:Colors.teal),
                             Text('Take a Selfie',style: TextStyle(color:Colors.teal),)
                           ],
                         ),
                       ),
                     ),
                     SizedBox(height: 20,),
                    
                    FlatButton(
                      onPressed: (){
                        _register();
                      }, 
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Next',style: TextStyle(fontSize: 20,color: Colors.teal),),
                            SizedBox(width: 20,),
                            Icon(Icons.skip_next,color: Colors.teal,)
                          ],
                        ),
                      ),
                      color: Colors.white,
                      minWidth: 400,),
                      SizedBox(height: 20,),
                      
        
                  ],
                ))
              ]),
        ),
      ),
    );
  }
}