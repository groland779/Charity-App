import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';


void main() => runApp(Campaign1());

class Campaign1 extends StatelessWidget {
  static final String title = 'Help Intellectually Disabled \nMembers Of Adhar Have A Happy Life ';

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
    Map<String, dynamic> demodata = {
      "Email": userEmail,
      "Product1": "Hygiene Products",
      "Quantity1": quantity1.text,
      "Product2": "Groceries",
      "Quantity2": quantity2.text,
      "Product3": "Ghee",
      "Quantity3": quantity3.text,
      "Product4": "Tea/Coffee Powder",
      "Quantity4": quantity4.text,
      "Campaign": "Help Intellectually Disabled Members Of Adhar Have A Happy Life",
      "NGO": "Adhar",
    };
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("Donations");
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
              height: 17,
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
                "https://dkprodimages.gumlet.io/campaign/cover/Help-Intellectually-Disabled.jpg?format=webp&w=800&dpr=1.3"
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
                  percent: 0.69,
                  center: new Text("69%"),
                  progressColor: Colors.green,
                ),
              Text(
                '\n       69%                          20 \nCompleted                Days left\n\n  1950                             6887\nDonors                 Products Raised',
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
                    'https://dkprodimages.gumlet.io/catalogue/Adhar02072021_HygienKit.jpg?format=webp&w=360&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Hygiene Products\n Products such as Detergent, Soap, Toothpaste, Floor Cleaners, Hair oil etc.',
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
                    'https://moneyconnexion.com/wp-content/uploads/2018/04/indian_grocery_stores.png',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Groceries \nResources such as Rice, Lentils, Oil, Flour, Sugar etc.',
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
                    'https://dkprodimages.gumlet.io/catalogue/Ghee13072021.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Ghee',
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
                    'https://dkprodimages.gumlet.io/catalogue/Adhar02072021_TeaPowder.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Tea/Cofee Powder.',
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
                '“Our children are different, we understand. But that doesn’t mean that they deserve any less love and affection. It is heartbreaking to see people mocking them or disrespecting them. But what is more worrisome for all of us parents is the fear of who will take care of our children after we are no more…,”\n- a member of Adhar and a parent to an intellectually disabled person. ',
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
                    'https://dkprodimages.gumlet.io/Adhar_Body1.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

             Text('\n'),

              Text(
                'They’ve served 250000+ people with healthy meals so far\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


            Text(
              'Why was Adhar formed?\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


              Text(
                'The stigma that surrounds mental health makes the life of special children & their parents even more difficult. Especially as they age, it becomes more and more problematic for these parents to take care of their children.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Text(
                '\nIn the year 1990, few such parents came together to find a permanent solution to their common concerns. Adhar, an association of parents of intellectually disabled children, was founded under the leadership of Late Mr M.G.Gore, to address this issue. At present, Adhar has two branches in Maharashtra, located in Badlapur & Nasik and is also building an old-age home for their ageing parents.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Text(
                '\n\nHow does Adhar  help?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '\n\nAdhar has created a safe, inclusive & stimulating environment where these intellectually challenged individuals get to say how much support or space they need. At present they have 335 + special adults under their care in two units in Badlapur and Nasik. ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Text(
                '\nThey are providing these special adults with lifelong care, training and rehabilitation facilities with the help of Psychologist, Psychiatrist, Physiotherapist, Occupational Therapist, Medical Officers, Social Workers, Special Teachers, Caretakers and other Office Staff. They run on the contributions the parents make and donations.\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Adhar_Body4.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            Text(
              'But Adhar needs your support now\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


            Text(
              'Since its inception, Adhar has been extending financial subsidies to the parents depending on their economic conditions. However, most of these parents now are too old to work and have used up their savings to take care of their children. Some of them have even passed away and now the siblings take care of the special adults. ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Adhar_Body5.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            
            Text(
              '\n\nLet us join hands and donate grocery and hygiene products to Adhar so that 335+ special adults can have a safe place to live in for the rest of their lives. ',
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

