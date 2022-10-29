import 'package:flutter/material.dart';
import 'Categories/Animals.dart';
import 'Categories/Clothes.dart';
import 'Categories/Education.dart';
import 'Categories/Hunger.dart';
import 'Categories/physically_disabled.dart';
import 'Categories/women.dart';
import 'NavBar.dart';


void main() => runApp(
  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Categories())
);

class Categories extends StatelessWidget{
  late
  List<String> events =[
    "Women",
    "Education",
    "Animals",
    "Food",
    "Physically Disabled",
    "Clothes"

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            title: Text('Categories',style: TextStyle(color: Color(0xffffffff)),),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF0A5699)
        ),
        body: Container(child: Container(
      margin: const EdgeInsets.only(top: 3.0),
      child: GridView(
       physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0),
        children:events.map((title){
          return GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(10.0),
              child: getCardByTitle(title)


          ),
            onTap: () {
              if(title=="Women")
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Women())
                );
              }
              else if(title=="Education")
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Education())
                );
              }
              else if(title=="Physically Disabled")
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Physically_Disabled())
                );
              }
              else if(title=="Clothes")
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Clothes())
                );
              }
              else if(title=="Food")
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hunger())
                );
              }
              else if(title=="Animals")
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Animals())
                );
              }
              },
          );
        }).toList(),
      ),
    ),));
  }


 Column getCardByTitle(String title){

  String img ="";
  if(title =="Women")
    img="assets/women.jpg";
  else if(title =="Education")
    img="assets/edu.jpg";
  else if(title =="Animals")
    img="assets/animal.jpg";
  else if(title =="Food")
    img="assets/hunger.jpg";
  else if(title =="Clothes")
    img="assets/clothes.jpg";
  else if(title =="Physically Disabled")
    img="assets/physiHand.jpg";


  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Center(
        child: Container(
          child: new Stack(
            children: <Widget>[
              new Image.asset(
                img,
                width:80.0,
                height:80.0,
              )
            ]
          )
        )
      ),Text(
        title,
        style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      )
    ]
  );

 }
}