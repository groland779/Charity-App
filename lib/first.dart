import 'package:flutter/material.dart';
import 'signin.dart';
import 'home.dart';

class Login extends StatelessWidget {
  get margin => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(5, 20, 10, 0),
            child: ListView(children: <Widget>[
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(top: 40.0, left: 122.0),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://res.cloudinary.com/dw4sh4ci7/image/upload/v1626444982/logo_n5vywo.jpg"))),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35.0),
                  child: Text(
                    'Charity',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'McLaren'),
                  ),
                )
              ]),
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://res.cloudinary.com/dw4sh4ci7/image/upload/v1626447173/welcome_zyqvvp.jpg"))),
              ),
              Container(
                  margin:
                      const EdgeInsets.only(bottom: 10.0, left: 30, right: 30),
                  child: Text(
                    '"No one has ever become poor by giving"',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 50.0, right: 50, top: 20),
                width: 10,
                height: 60,
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.indigo.shade900,
                        Colors.blue.shade900,
                        Colors.blue
                      ]),
                ),
                child: MaterialButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: StadiumBorder(),
                  child: Text(
                    "Let's get started!",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
              )
            ])));
  }
}
