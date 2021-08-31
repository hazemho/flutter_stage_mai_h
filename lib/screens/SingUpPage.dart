import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyship/services/global_method.dart';
import 'package:easyship/tabs/Sender/Profile_S.dart';
import 'package:easyship/widgets/Sender/Navigation_S.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  final Color Theme;

  const SignUpPage({Key key, this.Theme}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  Color _stepper_color1 = Colors.grey;
  Color _stepper_color2 = Colors.grey;

  bool agree = false;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  File _image;
  List<File> _pickedIamages = [];
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {
          _pickedIamages.add(File(pickedFile.path));
        });
      } else {
        print('No image selected.');
      }
    });
  }

  String _dropdownValuee = "Country";

  TextEditingController _FirstName = new TextEditingController();
  TextEditingController _LastName = new TextEditingController();
  TextEditingController _UserName = new TextEditingController();
  TextEditingController _Email = new TextEditingController();
  TextEditingController _Password = new TextEditingController();
  TextEditingController _dropdownValue = new TextEditingController();
  TextEditingController _PhoneNumber = new TextEditingController();

  // firebase connect

  bool _isLoading = false;
  String _errMessage = "";
  String url;

  /////////////////////////////////////
  GlobalMethods _globalMethods = GlobalMethods();

  final _formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _signupAccount() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
      try {
        if (_image == null) {
          _globalMethods.authErrorHandle('Please pick an image', context);
        } else {
          setState(() {
            _isLoading = true;
          });

          final ref = FirebaseStorage.instance
              .ref()
              .child('usersImages')
              .child(_FirstName.text + '.jpg');
          await ref.putFile(_image);
          url = await ref.getDownloadURL();
          await auth.createUserWithEmailAndPassword(
              email: _Email.text.trim(), password: _Password.text.trim());
          final User user = auth.currentUser;
          final _uid = user.uid;

          await FirebaseFirestore.instance.collection('users').doc(_uid).set({
            'id': _uid,
            'First name': _FirstName.text,
            'Last name': _LastName.text,
            'User name': _UserName.text,
            'email': _Email.text,
            'Phone Number': _PhoneNumber.text,
            'Country': _dropdownValue.text,
            'imageUrl': url,
            'createdAt': Timestamp.now(),
          });

          //MaterialPageRoute(builder: (context) => Navigation_S()),
          Navigator.canPop(context) ? Navigator.pop(context) : null;
        }
      } catch (error) {
        _globalMethods.authErrorHandle(error.message, context);
        print('error occurred ${error.message}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.Theme,
        // automaticallyImplyLeading: false,
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Theme(
                  data: ThemeData(
                      primaryColor: widget.Theme,
                      colorScheme: ColorScheme.light(primary: widget.Theme)),
                  child: Stepper(
                    type: stepperType,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                    controlsBuilder: (BuildContext context,
                        {VoidCallback onStepContinue,
                        VoidCallback onStepCancel}) {
                      return stepperType == StepperType.vertical
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: agree
                                            ? widget.Theme
                                            : Colors.grey[350]),
                                    onPressed: agree ? onStepContinue : null,
                                    child: Text('NEXT'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.redAccent[200]),
                                  onPressed: onStepCancel,
                                  child: Text('CANCEL'),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: agree
                                          ? widget.Theme
                                          : Colors.grey[350]),
                                  onPressed: agree ? onStepContinue : null,
                                  child: Text('NEXT'),
                                ),
                                SizedBox(width: 10.0),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.redAccent[200]),
                                  onPressed: onStepCancel,
                                  child: Text('CANCEL'),
                                ),
                              ],
                            );
                    },
                    steps: <Step>[
                      Step(
                        subtitle: Icon(
                          Icons.person,
                          size: 20,
                          color: _stepper_color1,
                        ),
                        title: Text('Account'),
                        content: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                key: ValueKey('FirestName'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'name cannot be null';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                controller: _FirstName,
                                decoration:
                                    InputDecoration(labelText: 'First Name'),
                              ),
                              TextFormField(
                                key: ValueKey('LastName'),
                                keyboardType: TextInputType.name,
                                controller: _LastName,
                                decoration:
                                    InputDecoration(labelText: 'Last Name'),
                              ),
                              TextFormField(
                                key: ValueKey('UserName'),
                                keyboardType: TextInputType.name,
                                controller: _UserName,
                                decoration:
                                    InputDecoration(labelText: 'Username'),
                              ),
                              TextFormField(
                                key: ValueKey('Email'),
                                keyboardType: TextInputType.emailAddress,
                                controller: _Email,
                                decoration: InputDecoration(labelText: 'E-mail'),
                              ),
                              TextFormField(
                                key: ValueKey('PhoneNumber'),
                                keyboardType: TextInputType.phone,
                                controller: _PhoneNumber,
                                decoration:
                                    InputDecoration(labelText: 'Phone Number'),
                              ),
                              DropdownButton<String>(
                                underline: Divider(
                                  color: Colors.white,
                                ),
                                isExpanded: true,
                                hint: TextFormField(
                                  decoration:
                                      InputDecoration(labelText: _dropdownValuee),
                                ),
                                items: <String>['France', 'Tunis']
                                    .map((String country) {
                                  return DropdownMenuItem<String>(
                                    value: country,
                                    child: Text(country),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _dropdownValue.text = newValue;
                                  });
                                  _dropdownValuee = newValue;
                                },
                              ),
                              TextFormField(
                                key: ValueKey('Password1'),
                                obscureText: _obscureText1,
                                keyboardType: TextInputType.visiblePassword,
                                controller: _Password,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText1 = !_obscureText1;
                                      });
                                    },
                                    child: Icon(_obscureText1
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                ),
                              ),
                              TextFormField(
                                key: ValueKey('Password2'),
                                obscureText: _obscureText2,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText2 = !_obscureText2;
                                        });
                                      },
                                      child: Icon(_obscureText2
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    labelText: 'Confirm password'),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: agree,
                                    onChanged: (value) {
                                      setState(() {
                                        agree = value;
                                      });
                                    },
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 30.0, bottom: 30.0),
                                    width: 200.0,
                                    child: Text(
                                      'I have read and accept terms and conditions.',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep == 0
                            ? StepState.editing
                            : StepState.complete,
                      ),
                      Step(
                        subtitle: Icon(
                          Icons.camera_alt_rounded,
                          size: 20,
                          color: _stepper_color2,
                        ),
                        title: Text('Photo'),
                        content: Column(
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                margin:
                                    EdgeInsets.only(top: 20.0, bottom: 25.0),
                                width: 200.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: _image != null
                                          ? FileImage(_image)
                                          : AssetImage(
                                              'assets/images/avatar.png'),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext bc) {
                                      return Container(
                                        child: new Wrap(
                                          children: <Widget>[
                                            new ListTile(
                                                leading: new Icon(Icons.camera),
                                                title: new Text('Camera'),
                                                onTap: () {
                                                  getImage(ImageSource.camera);
                                                  Navigator.pop(context);
                                                }),
                                            new ListTile(
                                              leading: new Icon(Icons.image),
                                              title: new Text('Gallery'),
                                              onTap: () {
                                                getImage(ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                            ),
                            _isLoading
                                ? Container(
                                    child: Column(
                                    children: [
                                      Text("This may take a few seconds"),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      CircularProgressIndicator(
                                        backgroundColor: widget.Theme,
                                      ),
                                    ],
                                  ))
                                : Text("Add a photo"),
                            SizedBox(
                              height: 20.0,
                            )
                          ],
                        ),
                        isActive: _currentStep >= 1,
                        state: _currentStep == 1
                            ? StepState.editing
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.Theme,
        child: Icon(Icons.crop_rotate),
        onPressed: switchStepsType,
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep == 1 ? _signupAccount() : null;

    _currentStep < 1 ? setState(() => _currentStep += 1) : null;

//coloring icons
    switch (_currentStep) {
      case 0:
        setState(() {
          _stepper_color1 = Colors.grey;
          _stepper_color2 = Colors.grey;
        });
        break;
      case 1:
        setState(() {
          _stepper_color1 = Colors.green;
          _stepper_color2 = Colors.grey;
        });
        break;
    }
  }

  cancel() {
    _currentStep == 0
        ? Navigator.pop(context)
        : setState(() => _currentStep -= 1);
// coloring icons
    switch (_currentStep) {
      case 0:
        setState(() {
          _stepper_color1 = Colors.grey;
          _stepper_color2 = Colors.grey;
        });
        break;
      case 1:
        setState(() {
          _stepper_color1 = Colors.green;
          _stepper_color2 = Colors.grey;
        });
        break;
    }
    // _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
