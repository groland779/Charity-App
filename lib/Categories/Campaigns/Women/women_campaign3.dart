import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';

void main() => runApp(Campaign3());

class Campaign3 extends StatelessWidget {
  static final String title = 'Donate Sanitary Napkins to \nUnderprevileged girls';

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

  TextEditingController quantityController = TextEditingController();
  addData() async {
    final _auth = FirebaseAuth.instance;
    dynamic user;
    String userEmail;
    user = await _auth.currentUser!;
    userEmail = user.email;
    Map<String, dynamic> demodata = {
      "Email": userEmail,
      "Product" : "Sanitary Pads",
      "Quantity1": quantityController.text,
      "Product2" : "",
      "Quantity2": "",
      "Product3" : "",
      "Quantity3": "",
      "Product4" : "",
      "Quantity4": "",
      "Campaign": "Donate Sanitary Napkins to Underprevileged girls", "NGO" : "Daan Utsav",
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
                "https://dkprodimages.gumlet.io/campaign/SanitaryNapkin_DU2020.jpg?format=webp&w=800&dpr=1.3"
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
                  percent: 0.51,
                  center: new Text("51%"),
                  progressColor: Colors.green,
                ),
              Text(
                '\n      51%                            26 \nCompleted                Days left\n\n   756                            2524\nDonors               Products Raised',
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
                    'https://dkprodimages.gumlet.io/catalogue/TOI_Sanitary.jpg?format=webp&w=360&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Sanitary Pads',
                style: TextStyle(fontSize: 16),
              ),
            ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: NumberInputWithIncrementDecrement(
                  controller: quantityController,
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
                'India, the worlds largest democracy. The world’s second-most populous country. It’s a developing country with many tags and has gone ahead in various categories but is behind in hygiene especially women hygiene. On an ordinary day, an adolescent girl might think twice to go out and purchase a sanitary napkin. With the COVID-19 restrictions in place, that is even more difficult now.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/HP_DU_Body1.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

             Text('\n'),

              Text(
                '\n\nMore than 23 million adolescent girls drop out of school annually due to lack of proper menstrual hygiene management facilities, which include the availability of sanitary napkins and logical awareness of menstruation.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

            Text(
              '\n\nAggravating the situation, the nationwide lockdown led to a severe scarcity of sanitary napkins as many factories had to shut down. India’s home to more than 190 million families in which the parents are daily wage labourers. They earn a meagre income and live in deplorable conditions. Women in such families were the worst hit in this situation.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/HP_DU_Body3.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/HP_DU_Body2.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),


            Text(
              'Not being able to access sanitary napkins affected the hygienic conditions of these women, making them vulnerable to various diseases and menstrual infections. The issues could be anywhere from cervical cancer, Reproductive Tract Infections, Hepatitis B infection, various types of yeast infections to Urinary Tract Infections. \n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

            Text(
              'The National Family Health Survey estimates that of the 336 million menstruating women in India about 215 million (roughly 58 per cent) women don’t have access to sanitary napkins.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  // fontStyle: FontStyle.italic,
                ),
              ),

            Text(
              '\n\nMany mothers are themselves unaware of what practices could be considered as menstrual hygiene management. They cannot educate their daughters. Schools had never been very helpful either as those in rural areas refrain from discussing menstrual hygiene. \n\n\nAmidst this condition, millions of women don’t have access to proper sanitation facilities. We urge you to find it in your heart to donate a sanitary napkin. These sanitary napkins will be distributed among the poorest of the poor marginalized communities.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/HP_DU_Body5.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            Text(
              'This Daan Utsav, let’s change a girl’s life. Donate a sanitary napkin, donate a dream for her.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      );


}

