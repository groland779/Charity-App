import 'package:flutter/material.dart';

import '../NavBar.dart';
import 'Campaigns/Clothes/clothes_campaign1.dart';
import 'Campaigns/Clothes/clothes_campaign2.dart';
import 'Campaigns/Clothes/clothes_campaign3.dart';


void main() => runApp(Clothes());

class Clothes extends StatelessWidget {
  static final String title = 'Clothes';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(title: 'Clothes'),
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
            buildcampaign3(),
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
                    'http://www.saifindia.in/upload/image-full/636789246920000000.jpg',
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
                    'Donate warm clothes to poor people as they suffer much in winters',
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
                    '\n        23%               19              466           1178  \nCompleted     Days Left     Donors     Products' ,
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
                    '\nBy SaifIndia' ,
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
                    'http://www.vedanshfoundation.com/wp-content/uploads/2017/12/donation-box-910x607.jpg',
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
                    'Donate old clothes for needy and poor people',
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
                    '\n      58%                  9                357           750\nCompleted     Days Left     Donors     Products' ,
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
                    '\nBy Vedansh Foundation' ,
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

 Widget buildcampaign3() => Card(
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
                    'https://retropoplifestyle.com/wp-content/uploads/2021/02/Lakeland-Donations-Clothes-Toys-Furniture.jpg',
                  ),
                  child: InkWell(
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Campaign3())
                  
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
                    'Ajiliyaa starts a unique fashion campaign to donate clothes',
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
                    '\n       4%                  38                 66             145\nCompleted     Days Left     Donors     Products' ,
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
                    '\nBy Ajiliyaa Lifestyles' ,
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
                    MaterialPageRoute(builder: (context) => Campaign3())
                  
                );
              },
                ),
              ],
            )
          ],
        ),
      );
}