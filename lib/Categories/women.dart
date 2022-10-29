import 'package:flutter/material.dart';

import '../NavBar.dart';
import 'Campaigns/Women/women_campaign1.dart';
import 'Campaigns/Women/women_campaign2.dart';
import 'Campaigns/Women/women_campaign3.dart';

void main() => runApp(Women());

class Women extends StatelessWidget {
  static final String title = 'Women';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(title: 'Women'),
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
            // buildcampaign4(),
            // SizedBox(   //Use of SizedBox
            //     height: 25,
            //   ),
            // buildcampaign5(),
            // SizedBox(   //Use of SizedBox
            //     height: 25,
            //   ),
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
                    'https://dkprodimages.gumlet.io/campaign/cover/Help-women-hygiene.jpg?format=webp&w=360&dpr=1.0',
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
                    'Help needy women to maintain their menstrual hygiene',
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

                '\n         7%                 38                31             181   \nCompleted     Days Left     Donors     Products ' ,
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
                    '\nBy Yug Foundation' ,
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
                    'https://dkprodimages.gumlet.io/campaign/cover/Help-Needy-Women.jpg?format=webp&w=360&dpr=1.0',
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
                    'Stree Mukti Sanghatana Can Help 4000+ Women Waste Pickers Survive This Crisis With Your Support',
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
                    '\n          8%                10             182             446 \nCompleted     Days Left     Donors     Products' ,
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
                    '\nBy Stree Mukti' ,
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
                    'https://dkprodimages.gumlet.io/campaign/SanitaryNapkin_DU2020.jpg?format=webp&w=800&dpr=1.0',
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
                    'Periods do not show any discrimination between rich and poor,But Sanitary Napkins do',
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
                    '\n      51%                  26              756           2542 \nCompleted     Days Left     Donors    Products ' ,
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
                    '\nBy Daan Utsav' ,
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