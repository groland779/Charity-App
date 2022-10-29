import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'app_constants.dart';
import 'left_bar.dart';
import 'right_bar.dart';
import 'login.dart';


void main() {
  runApp(MaterialApp(
    home: Signin(),
    debugShowCheckedModeBanner: false,
  ));
}

class Signin extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Signin> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  late String email,password;

  addData(){

    Map<String, dynamic> demodata = {"Email": emailController.text, "Password": passwordController.text,
    };
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("Users");
    collectionReference.add(demodata);
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alert!'),
            content: Text('Kindly Input the Details'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
            elevation: 24.0,
            shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          );
        });}

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainHexColor,
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                LeftBar(
                  barWidth: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                LeftBar(barWidth: 70),
                SizedBox(
                  height: 20,
                ),
                LeftBar(
                  barWidth: 40,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: 'Mclaren',
                          color: Color(0xFF0A5699),
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    )


                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35)
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: accentHexColor,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: accentHexColor)
                        )
                    ),

                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35)
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: accentHexColor,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: accentHexColor)
                        )
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                ),


                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: accentHexColor,
                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      child: Text('Sign Up'),
                      onPressed: (){
                        addData();
                        password = passwordController.text;
                        email = emailController.text;
                        if (email != '' || password != '') {
                          auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) =>
                                    HomeScreen()));
                          });
                        }
                        else
                        {
                          _displayDialog(context);
                        }
                      },
                    )),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Row(


                      children: <Widget>[

                        Text('Already have an account?',
                          style: TextStyle(fontSize: 15,color: Color(0xFF0A5699), ),
                        ),
                        FlatButton(
                          textColor: Color(0xFF0A5699),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login())
                            );
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                Container(
                    child: Column(
                        children:<Widget>[

                          SizedBox(
                            height: 20,
                          ),
                          RightBar(barWidth: 70),
                          SizedBox(
                            height: 20,
                          ),
                          RightBar(barWidth: 70),

                        ])
                ),

              ],
            )));
  }
}