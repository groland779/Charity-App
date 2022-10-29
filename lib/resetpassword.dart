import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'app_constants.dart';
import 'left_bar.dart';
import 'right_bar.dart';



void main() {
  runApp(MaterialApp(
    home: ResetScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ResetScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;


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
                    height: 70,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: accentHexColor,
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)
                        ),
                        child: Text('Reset Password'),
                        onPressed: (){
                          auth.sendPasswordResetEmail(email: _email);
                          Navigator.of(context).pop();
                        }


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