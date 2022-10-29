import 'package:flutter/material.dart';

import '../NavBar.dart';
import 'Campaigns/Physically Disabled/disabled_campaign1.dart';
import 'Campaigns/Physically Disabled/disabled_campaign2.dart';
import 'Campaigns/Physically Disabled/disabled_campaign3.dart';

void main() => runApp(Physically_Disabled());

class Physically_Disabled extends StatelessWidget {
  static final String title = 'Physically Disabled';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(title: 'Physically Disabled'),
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
                    'https://dkprodimages.gumlet.io/campaign/cover/Help-Intellectually-Disabled.jpg?format=webp&w=800&dpr=1.0',
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
                    'Intellectually Disabled Members Of Adhar Can Have A Happy And Safe Life With Your Help',
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
                    '\n       69%                20             1950           6887\nCompleted     Days Left     Donors     Products ' ,
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
                    '\nBy Adhar' ,
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
                    'https://dkprodimages.gumlet.io/campaign/cover/Help-Helpers-of-Handicapped.jpg?format=webp&w=800&dpr=1.0',
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
                    'Join Helpers Of The Handicapped To Give Hundreds Of People With Disabilities A Dignified Life',
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
                    '\n      22%                 16              474           1199\nCompleted     Days Left     Donors     Products ' ,
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
                    '\nBy Helpers Of The Handicapped' ,
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
                    'https://dkprodimages.gumlet.io/campaign/AJcover.jpg?format=webp&w=800&dpr=1.0',
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
                    'Help Asha Jyoti Welfare Society Feed Differently-Abled Children In This Crisis',
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
                    '\n         21%                  9               87           525\n Completed     Days Left     Donors   Products ' ,
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
                    '\nBy Asha Jyothi' ,
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