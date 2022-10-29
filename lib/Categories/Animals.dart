import 'package:flutter/material.dart';
import '/NavBar.dart';
import 'Campaigns/Animal/Animal_campaign1.dart';
import 'Campaigns/Animal/Animal_campaign2.dart';
import 'Campaigns/Animal/Animal_campaign3.dart';
void main() => runApp(Animals());

class Animals extends StatelessWidget {
  static final String title = 'Animals';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(title: 'Animals'),
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
                    "https://dkprodimages.gumlet.io/campaign/cover/Support-Haris.jpg?format=webp&w=800&dpr=1.3",
                  ),
                  child: InkWell(
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Campaign1())
                  
                );
              }
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
                    'Haris Needs Your Help To Give 200+ Abandoned & Injured Dogs A Healthy Life',
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
                    '\n      61%                   9             2458           5266 \nCompleted     Days Left     Donors     Products' ,
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
                    '\nBy Sarvoham Welfare Trust' ,
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
            )
          ],
        )
      ] 
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
                    'https://dkprodimages.gumlet.io/campaign/AMTM2503_Cover.jpg?format=webp&w=800&dpr=1.0',
                  ),
                  child: InkWell(
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Campagin2())
                  
                );
              }
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
                    'Help us feed Stray Animals post Covid-19',
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
                    '\n      62%                 18             5705          41482 \nCompleted     Days Left     Donors     Products' ,
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
                    '\nBy Animals Matter to Me Mumbai' ,
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
                    MaterialPageRoute(builder: (context) => Campagin2())
                  
                );
              },
            )
          ],
        )
      ] 
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
                    'https://dkprodimages.gumlet.io/campaign/cover/Feed-Cats.jpg?format=webp&w=800&dpr=1.0',
                  ),
                  child: InkWell(
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Campaign3())
                  
                );
              }
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
                    'Hundreds Of Helpless Cats Are Starving Due To The Crisis, Help CARE Feed Them Today.',
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
                    '\n      46%                  2               533        \nCompleted     Days Left     Donors     ' ,
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
                    '\nBy Charlies Animal Rescue Center' ,
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
              }
                ),
              ],
            )
          ],
        ),
      );
}