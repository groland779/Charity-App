import 'package:flutter/material.dart';

import '../NavBar.dart';
import 'Campaigns/Education/education_campaign1.dart';
import 'Campaigns/Education/education_campaign2.dart';

void main() => runApp(Education());

class Education extends StatelessWidget {
  static final String title = 'Education';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(title: 'Education'),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  get alignment => null;

  @override
  Widget build(BuildContext context) => Scaffold(
          drawer: NavBar(),
          appBar: AppBar(
          title: Text(widget.title,style: TextStyle(color: Color(0xffffffff)),),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF0A5699)
        ),
        body: 
        ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildcampaign1(),
            SizedBox(   //Use of SizedBox
                height: 25,
              ),
            buildcampaign2(),
            SizedBox(   //Use of SizedBox
                height: 25,
              ),
          ],
        ),
      );


  Widget buildcampaign1() => Card(
        shadowColor: Colors.black,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/campaign/sphorrticover.jpg?format=webp&w=800&dpr=1.0',
                  ),
                  child: InkWell(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Campaign1())
                  
                );
              },
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child:  
              Text(
                    'Gift a language, donate a dictionary',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
              ),
              Padding(
              padding: EdgeInsets.all(1).copyWith(bottom: 0),
              child:  
              Text(
                    '\n      64%                 181            165            1880       \nCompleted     Days Left     Donors     Products' ,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
              ),  
              Padding(
              padding: EdgeInsets.all(1).copyWith(bottom: 0),
              child:  
              Text(
                    '\nBy Sphoorti Foundation' ,
                      style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
              ),  
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text('Know More'),
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Campaign1())
                  
                );
              },
                ),
              ],
            )
          ],
        ),
      );


 Widget buildcampaign2() => Card(
       shadowColor: Colors.black,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/campaign/Sankalpcoverpic.jpeg?format=webp&w=800&dpr=1.0',
                  ),
                  child: InkWell(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Campaign2())
                );
              },
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child:  
              Text(
                    'Support Education for Underprivileged through community schools',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
              ),
              Padding(
              padding: EdgeInsets.all(1).copyWith(bottom: 5),
              child:  
              Text(
                    '\n        19%                17             143             3017\nCompleted     Days Left     Donors      Products     ' ,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      
                    ),
                  ),
              ), 
             Padding(
              padding: EdgeInsets.all(1).copyWith(bottom: 0),
              child:  
              Text(
                    '\nBy Sankalp Ek Prayas' ,
                      style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
              ),   
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text('Know More'),
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Campaign2())
                  
                );
              },
                ),
              ],
            )
          ],
        ),
      );

 
}