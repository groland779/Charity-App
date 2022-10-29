import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../NavBar.dart';
import '../../../confirm_donation.dart';


void main() => runApp(Campaign2());

class Campaign2 extends StatelessWidget {
  static final String title = 'Help give People With Disabilities \nA Dignified Life';

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
      "Product1": "Groceries",
      "Quantity1": quantity1.text,
      "Product2": "First Aid",
      "Quantity2": quantity2.text,
      "Product3": "Medicines",
      "Quantity3": quantity3.text,
      "Product4": "Children/Adult Diapers or Sanitary Pads",
      "Quantity4": quantity4.text,
      "Campaign": "Help give People With Disabilities A Dignified Life",
      "NGO": "Helpers Of The Handicapped",
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
                "https://dkprodimages.gumlet.io/campaign/cover/Help-Helpers-of-Handicapped.jpg?format=webp&w=800&dpr=1.3"
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
                  percent: 0.22,
                  center: new Text("22%"),
                  progressColor: Colors.green,
                ),
              Text(
                '\n       22%                               16 \nCompleted                    Days left\n\n     474                               1199\n  Donors                 Products Raised',
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
                    'https://dkprodimages.gumlet.io/catalogue/HOH%20Product_2.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'First Aid \nMaterials like Antiseptic(liquid/ointment), Cotton, Gauge, Bandages etc.',
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
                    'https://dkprodimages.gumlet.io/catalogue/HOH%20Product_1.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Medicines \nCough Syrup, Vaporub, Painkillers etc.',
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
                    'https://dkprodimages.gumlet.io/catalogue/HoH29062021_AdultDiaper.jpg?format=webp&w=128&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Children/Adult Diapers or Sanitary Pads',
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
                'People with disabilities face immense difficulties in their everyday work like fetching groceries, medicines, or adult diapers etc.  Able-bodied people don’t realize the advantage they have in simply being able to walk to the store or order things and have them delivered at the doorstep.\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  // fontStyle: FontStyle.italic,
                ),
              ),

              Text(
                'Two dynamic women, Miss Naseema Hurzuk and Mrs. Rajani (Karkare) Deshpande, who had faced the downside of disability started a crusade in 1984 to help others suffering from disabilities. Their organisation was called Helpers of the Handicapped, in Kolhapur.\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),


              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/HoH29062021_Body1.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

             Text('\n'),

              Text(
                '“It was only after polio struck me, leaving me dependent on crutches for life, did I realize how difficult it is for people with disabilities to get simple amenities. Along with Miss Naseema Hurzuk and other crusaders, we are fortunate to have found our voice again, and strive to help restore the voices of many others suffering from disabilities.” - Mrs. Rajani (Karkare) Deshpande',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),


            Text(
              '\n\nHow does Helpers of the Handicapped help others?\n\n ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),
              ),


              Text(
                'Helpers of the Handicapped is a not-for-profit organization that aims to rehabilitate persons with disabilities.\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),


              Text(
                'The organization’s mission is to provide rehabilitation assistance to help people with disabilities take charge of their lives and maintain “optimal physical, intellectual, psychological, economic and social functional levels”.\n\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://dkprodimages.gumlet.io/HoH29062021_Body3.jpg?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),


              Text(
                '\nThis passionate project aims to empower persons with disabilities and look beyond their caste, creed, religion, economic, or other status. A truly forward-thinking movement, it has established camps and projects that allow people to get involved and help persons with disabilities in a way that they can contribute to the community.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),


            Text(
              '\n\nThe organization has helped over 10,243 differently-abled people and has established infrastructures including hostels, schools, and rehabilitation and training centres costing Rs. 9.00 Crores (figures up to 31st March 2016) to help this part of the community.',
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
                    'https://dkprodimages.gumlet.io/HoH29062021_Body5.JPG?format=webp&w=750&dpr=1.3',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text('\n'),


            Text(
              '\nThere are thousands of persons with disabilities that require basic medical attention and basic amenities like groceries, medicines, and adult diapers. To care for them and support them, helpers of the Handicapped is in need of resources.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

            
            Text(
              '\n\nDonate to help people with disabilities find their place in society and help them get back to life again.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

            Text(
              'By donating to this cause, you will be helping Helpers of the Handicapped help hundreds of more people suffering from disabilities in living a decent life. You can help them empower more persons with disabilities by giving them a second chance at life. Even your small donation can go a long way in helping them with everyday essentials. ',
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

