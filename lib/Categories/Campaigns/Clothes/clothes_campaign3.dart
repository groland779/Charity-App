import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';


void main() => runApp(Campaign3());

class Campaign3 extends StatelessWidget {
  static final String title = 'Ajiliyaa starts a unique fashion \ncampaign to donate clothes';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(title: title),
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
  @override

  TextEditingController quantity1 = TextEditingController();

  addData() async {
    final _auth = FirebaseAuth.instance;
    dynamic user;
    String userEmail;
    user = await _auth.currentUser!;
    userEmail = user.email;
    Map<String, dynamic> demodata = {
      "Email": userEmail,
      "Product1" : "Warm Clothes",
      "Quantity1" : quantity1.text,
      "Product2" : "",
      "Quantity2": "",
      "Product3" : "",
      "Quantity3": "",
      "Product4" : "",
      "Quantity4": "",
      "Campaign": "Ajiliyaa starts a unique fashion campaign to donate clothes", "NGO" : " Ajiliyaa Lifestyles",
    };
    CollectionReference collectionReference =FirebaseFirestore.instance.collection("Donations");
    collectionReference.add(demodata);
  }
  Widget build(BuildContext context) => Scaffold(
        drawer: NavBar(),
          appBar: AppBar(
          title: Text(widget.title,style: TextStyle(color: Color(0xffffffff)),),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF0A5699)
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildImageCard(),
            SizedBox( //Use of SizedBox
              height: 17,
              ),
            buildColoredCard(),
            SizedBox( //Use of SizedBox
              height: 20,
              ),
            aboutCard(),
            SizedBox( //Use of SizedBox
              height: 17,
              ),
            productCard(),
            SizedBox( //Use of SizedBox
              height: 18,
              ),
            donate(),
            SizedBox( //Use of SizedBox
              height: 18,
            ),
          ],
        ),
      );


    Widget buildImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                "https://retropoplifestyle.com/wp-content/uploads/2021/02/Lakeland-Donations-Clothes-Toys-Furniture.jpg"
              ),
              child: InkWell(
                onTap: () {},
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );


  Widget buildColoredCard() => Card(
        shadowColor: Colors.white,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new CircularPercentIndicator(
                  radius: 90.0,
                  lineWidth: 5.0,
                  percent: 0.04,
                  center: new Text("4%"),
                  progressColor: Colors.green,
                ),
              Text(
                '\n      4%                              38 \nCompleted                Days left\n\n     66                              145\n Donors                      Products',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );


  Widget productCard() => Card(
        shadowColor: Colors.white,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'http://www.vedanshfoundation.com/wp-content/uploads/2017/12/donation-box-910x607.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Donate clothes(in good condition) to the underprivileged',
                style: TextStyle(fontSize: 16),
              ),
            ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: NumberInputWithIncrementDecrement(
                  controller: quantity1,
                  min: 0,
                  max: 10,
                ),
              ),

            ],
          ),
        ),
      );

  Widget donate() => Card(
    child: FlatButton(
      textColor: Colors.white,
      color: Color(0xFF0A5699 ),
      child: Text(
        'Donate',
        style: TextStyle(fontSize: 15, ),
      ),
      onPressed: () {
        addData();
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Confirm_Donation())
        );
        //signup screen
      },
    ),
  );


  Widget aboutCard() => Card(
        shadowColor: Colors.white,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                'About the Project \n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


              Text(
                'Ajiliyaa- This Uttarayan, a top boutique in Surat, launched a unique initiative ‘Dor – Stitched Together,’ to donate clothes to the poor and needy people. ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Text(
                '\n\nAjiliyaa is one of the best boutiques in Surat. As part of their CSR activity, Ajiliyaa started a unique fashion campaign to bring a little sunshine in others lives. They put in a lot of efforts to bring together. The people of Surat and join their initiative of clothes donation. \n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://retropoplifestyle.com/wp-content/uploads/2021/02/16-11.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

             Text('\n'),

              Text(
                'Under this social work campaign, Team Ajiliyaa is asking the people of Surat to donate their clothes which are in good condition but they didn’t wear or use anymore. Once they collected all the clothes, they were properly ironed, reassembled and neatly packed. Team Ajiliyaa plans to distribute these clothes to the underprivileged and needy section of the society. The thought of seeing the smiling faces of poor kids made Team Ajiliyaa feel emotional. \n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Text(
                '\n\nFounder and creative Director of Ajiliyaa, Ajita Italiya has initiated this movement to bring about a revolution in the fashion world by raising awareness in the society to donate clothes to the needy people. Says Ajita, ‘ Small steps eventually happen to make big differences. And there is no better gift than providing clothes to the underprivileged.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


            Text(
              '\n\nTogether with the help of the people of Surat, we are trying to make that difference in the poor section of the society.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      );


}

