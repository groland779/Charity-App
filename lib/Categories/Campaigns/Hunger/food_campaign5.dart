import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';


void main() => runApp(Campaign5());

class Campaign5 extends StatelessWidget {
  static final String title = 'YUG Foundation Food \n Donation Drive';

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
  TextEditingController quantity2 = TextEditingController();
  TextEditingController quantity3 = TextEditingController();


  addData() async {
    final _auth = FirebaseAuth.instance;
    dynamic user;
    String userEmail;
    user = await _auth.currentUser!;
    userEmail = user.email;
    Map<String, dynamic> demodata = {
      "Email": userEmail,
      "Product1": "Rice",
      "Quantity1": quantity1.text,
      "Product2": "Toor Daal",
      "Quantity2": quantity2.text,
      "Product3": "Cooking Oil",
      "Quantity3": quantity3.text,
      "Product4" : "",
      "Quantity4": "",
      "Campaign": "YUG Foundation Food \n Donation Drive",
      "NGO": "Yug Foundation",
    };
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("Donations");
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
            productCard1(),
            SizedBox( //Use of SizedBox
              height: 18,
              ),
            productCard2(),
            SizedBox( //Use of SizedBox
              height: 18,
              ),
            productCard3(),
            SizedBox( //Use of SizedBox
              height: 18,
              ),
            donate(),
            SizedBox( //Use of SizedBox
              height: 18,
            ),
            aboutCard(),
            SizedBox( //Use of SizedBox
              height: 17,
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
                "https://dkprodimages.gumlet.io/campaign/cover/Help-Yug-Foundation.jpg?format=webp&w=800&dpr=1.3"
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
                '\n       4%                            38 \nCompleted                Days left \n\n     28                                 45  \n  Donors                  Products Raised',
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


  Widget productCard1() => Card(
        shadowColor: Colors.white,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
                'Products \n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),

            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/catalogue/Cognitive_Rice.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Rice',
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

  Widget productCard2() => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/catalogue/Cognitive_ToorDal.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Toor Dal',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: NumberInputWithIncrementDecrement(
                controller: quantity2,
                min: 0,
                max: 10,
              ),
            ),
          ],
        ),
      );

  Widget productCard3() => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/catalogue/Betehchange.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Cooking Oil',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: NumberInputWithIncrementDecrement(
                controller: quantity3,
                min: 0,
                max: 10,
              ),
            ),
          ],
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
                'Hunger Has No Species; Every Living Being In The Universe Needs Food To Stay Alive.\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),

              Text(
                'The problem of hunger is majorly faced by the underprivileged ones leaving every third child stunted, with under developed minds and bodies in comparison to their age.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Yug%20Foundation-9.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

             Text('\n'),

            Text(
              '\nThe problem of hunger is majorly faced by the underprivileged ones leaving every third child stunted, with under developed minds and bodies in comparison to their age. \nWe all notice pale and weak children begging on the street and the sole reason for this that thay do not get their basic necessity such as food.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Yug%20Foundation-7.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),


              Text(
                '\nWe have adopted 170 families to whom we supply ration every month. These underprivileged families our all hand to mouth. They are daily wage earners. They have a lot of problem sustaining their livelihood. Providing them with these food grains helps ease their problem of spending on basic ration every month.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


              Text(
                'YUG Foundation Pune has started a food donation drive under which they will be distributing food to orphanages and old age homes all over Pune. We aspire to make Pune a HUNGER FREE CITY.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      );


}

