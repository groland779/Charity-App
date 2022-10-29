import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';


void main() => runApp(Campaign1());

class Campaign1 extends StatelessWidget {
  static final String title = 'Donate warm clothes to \nthe poor';

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
      "Campaign": "Donate warm clothes to the poor", "NGO" : "SaifIndia",
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
                "http://www.saifindia.in/upload/image-full/636789246920000000.jpg"
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
                  percent: 0.23,
                  center: new Text("23%"),
                  progressColor: Colors.green,
                ),
              Text(
                '\n      23%                           19 \nCompleted                Days left\n\n     466                            1178\n  Donors                     Products',
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
                'Donate warm clothes to poor people as they suffer much in winters',
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
                'For most of us, winter is the time for comfort, for good food and warmth. But once think about those lesser fortunate people, who have no shelter, no blanket, no shoes and no warm clothes. Hundreds of people die of shivery cold every year due to the lack of woollen clothes. Those people are helpless because of poverty',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Text(
                '\n\nThis winter think of those poor people who have hardly even full-sized thin clothing to cover their bodies in wide open\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Text(
                'Social Activities in Indian Framework’s motive behind this share and care campaign is to bring our whole community together to help poor people. Donate blankets, warm clothes (sweater, shawls, muffler, socks, woollen caps, scarves, inner wear etc., new or old in good conditions) of all age groups, dry ration (packed biscuits, rice, flour, sugar, powdered milk, pulses, tea etc.), common medicines, dignity kits (sanitary napkins, soap, toothbrushes, towels), even your old shoes to the underprivileged people living in open on the streets and night shelters with support of our volunteers, corporate and individual donors.\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


            Text(
              '\n\nPoor and needy people can benefit from your old jackets, scarves, shawls, socks, even shoes etc. This will save thousands of valuable lives and help them survive the harshness of nature as poor people suffer much in the winters.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Text(
                '\n\nLet’s defeat harsh winter together!\n\nContribute Now!',
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

