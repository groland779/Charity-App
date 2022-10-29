import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';

void main() => runApp(Campaign2());

class Campaign2 extends StatelessWidget {
  static final String title = 'Help Women Waste Pickers Survive \nthis Crisis with your Support';

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
      "Product1" : "Hand Gloves",
      "Quantity1" : quantity1.text,
      "Product2" : "Masks",
      "Quantity2" : quantity2.text,
      "Product3" : "Soaps",
      "Quantity3" : quantity3.text,
      "Product4" : "Groceries",
      "Quantity4" : quantity4.text,
      "Quantity4" : quantity4.text,
      "Campaign": "Help Women Waste Pickers Survive this Crisis with your Support", "NGO" : "Stree Mukti"
    };
    CollectionReference collectionReference =  FirebaseFirestore.instance.collection("Donations");
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
                "https://dkprodimages.gumlet.io/campaign/cover/Help-Needy-Women.jpg?format=webp&w=800&dpr=1.3"
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
                  percent: 0.08,
                  center: new Text("8%"),
                  progressColor: Colors.green,
                ),
              Text(
                '\n      8%                                10 \nCompleted                  Days left\n\n    182                              446\n Donors                        Products',
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
                    'https://5.imimg.com/data5/BD/ZU/KD/GLADMIN-7320817/medical-surgical-nitrile-disposable-hand-gloves-500x500.jpeg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Hand Gloves',
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
                    'https://5.imimg.com/data5/SELLER/Default/2021/5/JJ/FM/XZ/20730873/face-mask-250x250.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Face Mask',
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
                    'https://5.imimg.com/data5/LW/GN/MY-4990337/bath-soap-500x500.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Soaps',
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
                'These women waste pickers have to worry about food, rent, electricity, their children’s school and just making it to the next day. They have no other way to earn a living. The second wave has been especially difficult for them since they have been working throughout the pandemic, without access to the necessary safety precautions. While we stayed home, they had no option but to put their lives at risk. \n- Jyoti Mhapsekar, President of Stree Mukti Sanghatana',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),

              Text(
              '\n\nToday, these women continue to work despite the pandemic, but they’re completely helpless.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Stree23062021_Body1.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

             Text('\n'),

            Text(
              'Stree Mukti Sanghatana’s Work \n\nStree Mukti Sanghatana has been working towards women empowerment since it was founded in 1975. Their aim is to work towards gender equality by spreading awareness about women’s rights and working at the grassroot levels to help uplift these women.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Text(
                'Their aim is to provide financial assistance for health, housing, education among others to these women. In the last four months alone, they have helped over 4000 women waste pickers by giving them grocery kits and protective gear. ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '\n\nHowever, now they need your help to continue working towards their mission.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Stree23062021_Body2.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            Text(
              'Your Contribution Can Make A Difference',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


            Text(
              '\n\nYour support will help Stree Mukti Sanghatana help over 4000 women who work as waste pickers in Maharashtra. The grocery kits that you donate towards will help them cook nutritious meals for their families and the protective gear will keep them safe at work.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

            
            Text(
              '\nLet’s come together and save these women who have suffered so much throughout their lives and now during the pandemic. You can make a difference in their lives and give them hope.',
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

