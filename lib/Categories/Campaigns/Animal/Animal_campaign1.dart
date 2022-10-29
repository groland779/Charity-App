import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';



void main() => runApp(Campaign1());

class Campaign1 extends StatelessWidget {
  static final String title = 'Help To Give Abandoned & Injured \n Dogs A Healthy Life';

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
  TextEditingController quantity4 = TextEditingController();


  addData() async {
    final _auth = FirebaseAuth.instance;
    dynamic user;
    String userEmail;
    user = await _auth.currentUser!;
    userEmail = user.email;
    Map<String, dynamic> demodata = {"Email": userEmail, "Product1" : "Dog Food", "Quantity1" : quantity1.text,
      "Product2" : "Dog Chew Sticks", "Quantity2" : quantity2.text,"Product3" : "Proviboost Syrup", "Quantity3" : quantity3.text,
      "Product4" : "Rice", "Quantity4" : quantity4.text, "Campaign": "Help To Give Abandoned & Injured Dogs A Healthy Life", "NGO" : "Sarvoham Welfare Trust",
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
            productCard4(),
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
                "https://dkprodimages.gumlet.io/campaign/cover/Support-Haris.jpg?format=webp&w=800&dpr=1.3"
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
                  percent: 0.61,
                  center: new Text("61%"),
                  progressColor: Colors.green,
                ),
              Text(
                '\n       61%                           9 \nCompleted                Days left\n\n     2458                          5266\n   Donors               Products Raised',
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
                    'https://dkprodimages.gumlet.io/catalogue/Sarvoham24062021_DogFoodKit.jpg?format=webp&w=360&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Dog food',
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
                    'https://dkprodimages.gumlet.io/catalogue/Sarvoham24062021_ChewStick.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Dog chew sticks',
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
                    'https://dkprodimages.gumlet.io/catalogue/Sarvoham24062021_ProviBoost.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Proviboost syrup',
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

  Widget productCard4() => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/catalogue/Rice_MANL.jpg?format=webp&w=128&dpr=1.3',
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
                controller: quantity4,
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
                'When you call Haris Ali, you are sure to hear some happy barks. His organisation, Sarvoham, is home to over 200 dogs. Sarvoham is a 24/7 rescue dedicated to caring for animals in Bangalore, India.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Text(
                '\n\nEstablished in April 2017 by Haris Ali at the age of 23, its mission is to "Rescue, Shelter, Protect & Rehome". Currently, the dogs in the home are either abandoned, physically challenged, lost or too old to survive by themselves.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  // fontStyle: FontStyle.italic,
                ),
              ),

              Text(
                '\nThey rescue animals from accidents & injury, cruelty & neglect, abandoned animals & offer them shelter.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Sarvoham24062021_Body1.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

             Text('\n'),

            Text(
              '\nHow they’re helping voiceless animals\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '\nStray dogs and cats are often left to fend for themselves. They usually rely on marketplaces, butcher shops, restaurants, and eateries for their daily meals. If they are lucky, they come across animal lovers who do their best to feed them regularly. But the pandemic has made the situation worse. ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Text(
                '\nSo many stray animals have had no access to clean drinking water and food. Apart from rescuing the animals in need, Sarvoham has been working day and night to feed these strays as well.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Sarvoham24062021_Body2.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            Text(
              '\nHaris and his team take utmost care of the dogs. If need be, they hand-feed these sick animals. Haris is a cyber security analyst, who does a full time job. And everything that he earns, he spends it on Sarvoham.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


            Text(
              '\n\n“But in the pandemic, I have run into huge debts. I have borrowed from everyone I knew and even then it is not enough. I don’t want to stop helping the animals. They don’t have anyone else but us. However, without immediate help, it will become very difficult. Please come forward and help these voiceless animals,” - Haris pleads. ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),


            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Sarvoham24062021_Body4.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            Text(
              '\nYour donation matters ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '\n\nSarvoham is in need of dog food and medicines to look after its 200+ dogs. It is getting impossible for Haris to look after them, he needs your help urgently.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '\n\n“I have grown up around animals. I have always had pets and I love taking care of them. This is something I never want to stop doing. And I don’t want money to come in between all of this. These animals need us.” ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),

              Text(
                '\nLet us join hands and help Sarvoham provide dog food and medicines to the animals in need.',
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

