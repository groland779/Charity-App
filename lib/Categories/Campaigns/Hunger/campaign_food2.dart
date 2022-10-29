import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';


void main() => runApp(Campaign2());

class Campaign2 extends StatelessWidget {
  static final String title = 'Donate a Meal for Ragpickers \n in Karnataka';

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
    Map<String, dynamic> demodata = {"Email": userEmail, "Product1" : "Rice", "Quantity1" : quantity1.text,
      "Product2" : "Toor Daal", "Quantity2" : quantity2.text,"Product3" : "Cooking Oil", "Quantity3" : quantity3.text,
      "Product4" : "Spices", "Quantity4" : quantity4.text, "Campaign": "Donate a Meal for Ragpickers in Karnataka", "NGO" : "Cognition India",
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
                "https://dkprodimages.gumlet.io/campaign/cover/Support-RagPickers.jpg?format=webp&w=800&dpr=1.3"
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

    Widget productCard4() => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Y5IbBPuMkVprxqIjHEBLmv2HW4T_jOGCIw&usqp=CAU',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Spices \nSpices such as Haldi, Chilli Powder, Garam Masala, Jeera, Sugar etc.',
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
                '“There are so many villages in rural Karnataka that have been ravaged by the pandemic. All these people are rag pickers and daily wagers from low income families. In these difficult times, they have no one to rely on. So many people are reaching out to us for help. All they want is to survive, and we can help them do that.” \n\n- Nagendra Babu, Co-Founder, Bethechange Hospete',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),

              Text(
              '\n\nBetheChange Hospete (BTCH), an initiative of Cognition Social Innovation and Research Centre, was started with the mission of creating a hunger free nation. Today, they’re working tirelessly to save hundreds of families from the brink of starvation.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/Cognition_Body1.jpg?format=webp&w=750&dpr=1.3',
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
              'Nagendra Babu was in college when he saw a large amount of excess food being wasted in his hostel. One day while walking by the dumpyard nearby, he saw a mother and her child picking up the excess food that was thrown away. That was their only meal for the day. His heart broke. He immediately went to a bakery nearby, and gave them some food. That was the beginning of BetheChange.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Text(
                'What started as a small initiative by Nagendra Babu, Sampada and Raviraj, soon grew into a massive food drive with over 700 volunteers.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),



              Text(
                'They have been helping hundreds of families in North Karnataka and in and around Bangalore ever since.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Text(
                '“When the pandemic began last year, so many of these families were left with no job and no money. Every meal was difficult for them, and every day, a struggle. We decided to cook meals for these families ourselves. We would cook 160 meals every day.”',
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
                    'https://dkprodimages.gumlet.io/Cognition_Body4.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),

            Text(
              'With hundreds of people losing their livelihoods during this crisis, BTCH wants to help these families get grocery items that will help them have three healthy meals in a day. These essential ingredients will help them make nutritious meals.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


            Text(
              '\n\nTo be able to distribute this to as many people as possible, they have partnered with organisations across Karnataka like Smitham, Robin hood Army, The Indian Ploggers Army, Swabhiman, Gsq foundation, Hands 4 Society, Indian Crafting roots, Feed the need and People for Passion.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

            
            Text(
              '\nBTCH now needs your help to give hundreds of families in North Karnataka and rural Bangalore grocery kits to survive this crisis. ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

            Text(
              'While they’re trying their best to reach out to as many people as possible, with your support, they will be able to do much more. \n\nYour contribution can be the reason so many families get the help they need. You can truly make a difference.',
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

