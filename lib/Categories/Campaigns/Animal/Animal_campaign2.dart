import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';

void main() => runApp(Campagin2());

class Campagin2 extends StatelessWidget {
  static final String title = 'Help us feed stray animals post \nCOVID - 19';

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
      "Product1" : "Milk",
      "Quantity1" : quantity1.text,
      "Product2" : "Dog Food",
      "Quantity2" : quantity2.text,
      "Product3" : "Cat Food",
      "Quantity3" : quantity3.text,
      "Product4" : "",
      "Quantity4" : "",
      "Campaign": "Help us feed stray animals post COVID - 19",
      "NGO" : "Animals Matter to Me Mumbai",
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
            buildImageInteractionCard1(),
            SizedBox( //Use of SizedBox
              height: 18,
              ),
            buildImageInteractionCard2(),
            SizedBox( //Use of SizedBox
              height: 18,
              ),
            buildImageInteractionCard3(),
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
                  percent: 0.41,
                  center: new Text("41%"),
                  progressColor: Colors.green,
                ),
              Text(
                '\n  4000                      171 \nDonors                Days left\n\n 15000                   147896\nNeeded               Obtained',
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
                "https://dkprodimages.gumlet.io/campaign/AMTM2503_Cover.jpg?format=webp&w=800&dpr=1.3"
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

  Widget buildImageInteractionCard1() => Card(
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
                    'https://5.imimg.com/data5/DI/MO/MY-28603212/buffalo-fresh-milk-500x500.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Milk',
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

  Widget buildImageInteractionCard2() => Card(
        clipBehavior: Clip.antiAlias,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(24),
        // ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/catalogue/Pedigree-Adult-Dog-Food-Chicken-Vegetables-1.2-Kg.jpg?format=webp&w=360&dpr=1.3',
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
                controller: quantity2,
                min: 0,
                max: 10,
              ),
            ),
          ],
        ),
      );

  Widget buildImageInteractionCard3() => Card(
        clipBehavior: Clip.antiAlias,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(24),
        // ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://m.media-amazon.com/images/I/810Y9KuHUrL._AC_SS450_.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Cat food',
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
                'The Corona virus has locked people inside their homes, caused the death of thousands of individuals and is now hurting animals. These furry four-legged creatures are suffering as the lockdown has left them wandering on the streets for food. \n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Text(
                'Since the Janta Curfew, many animals have been starving for days. Hundreds of them scouting for tidbits of food here and there.\n\n ',
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
                    'https://dkprodimages.gumlet.io/AMTM2503_Body1.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

             Text('\n'),

            Text(
              'Stray animals are seen wandering around the streets of India. They’re reliant on the scraps given by the public such as passersby, restaurants, and so on. Amidst the lockdown, hundreds of cafes, restaurants, bakeries, shops, and establishments have been shut down. These stays already live in horrendous conditions and the lockdown is starving them to death. The strays often relied on people who’ve kindly left out water in bowls. \n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Text(
                'Without any source of food and water, these animals are suffering. After a directive issued by Maneka Gandhi that the stray animals can be fed. AMTM has made a strategic plan to feed the animals.\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/AMTM2503_Body2.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            Text(
              'Our NGO, Animals Matter To Me (AMTM) have decided to start supplying dog and cat food to animals across Mumbai. We made four teams, many strays have not got any food for nearly 48 hours.\n\n-Ganesh Nayak, Founder of AMTM \n\n',
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
                    'https://media.istockphoto.com/photos/human-gives-a-treat-to-a-golden-retriever-dog-picture-id180717031?k=6&m=180717031&s=612x612&w=0&h=cJ4OxHe1nf-1uvrADxRLIlvoEx_yVMjKQeWGaacGXfU=',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            Text(
              'Due to the risk of Corona, AMTM will be taking several precautions to execute the drive. \nThey plan on making four AMTM teams for the Mumbai region. To avoid the risk of getting infected, they’ll conduct midnight operations. The staff and volunteers will hire 4 to 8 ambulances to conduct the drive. They’ll also conduct food, water and healthcare checks. Keeping the safety of the staff and volunteers in mind, AMTM will be responsibly conducting the drive at wee hours. \nCorona virus can be fatal if the stray animals aren’t fed as it can raise several issues that can elevate the problem. AMTM will be operating on alternative days to cover all the respective regions in Mumbai to ensure that all the stray animals get food.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Text(
                'For the animals, they’re looking for dog food, cat food and milk. \nYou can help feed many stray animals from the comfort of your own home. Help feed these animals so they can withstand the crisis until things go back to normal. Together, we can do it. \n',
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

