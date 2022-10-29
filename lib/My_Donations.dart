import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'NavBar.dart';
class My_Donations extends StatelessWidget {
  @override
     Widget build(BuildContext context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            drawer: NavBar(),
            appBar: AppBar(
                title: Text('My Donations',style: TextStyle(color: Color(0xffffffff)),),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Color(0xFF0A5699)
            ),
            body:StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Donations").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasData) {
      return ListView.builder(itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, i) {
        final _auth = FirebaseAuth.instance;
        dynamic user;
        String userEmail;
        user = _auth.currentUser!;
        userEmail = user.email;
        QueryDocumentSnapshot x = snapshot.data!.docs[i];
        String Product1 = x['Product1'];
        String Product2 = x['Product2'];
        String Product3 = x['Product3'];
        String Product4 = x['Product4'];
        String Quantity1 = x['Quantity1'];
        String Quantity2 = x['Quantity2'];
        String Quantity3 = x['Quantity3'];
        String Quantity4 = x['Quantity4'];
        String NGO = x['NGO'];
        String Campagin = x['Campaign'];
      if(x['Email'] == userEmail){
        return Card(
            margin: EdgeInsets.all(13.0),
            shadowColor: Colors.white,
            elevation: 10,
            clipBehavior: Clip.antiAlias,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                if(Quantity1 != "0" || Quantity2 != "0" || Quantity3 != "0" || Quantity4 != "0" )
                Row(
                  children:[
                Text(
                  "   Campaign Name: ",
                  textAlign: TextAlign.left,
                  style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600,),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0),),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor:  1.0,
                  child:
                   Text("\n"+ Campagin,
                  style: TextStyle( fontSize: 20),
                ),
                )
                )
                ]
                ),
                if(Quantity1 != "0" || Quantity2 != "0" || Quantity3 != "0" || Quantity4 != "0" )
                  Row(
                    children:[
                      Text(
                        "    NGO Name: ",
                        textAlign: TextAlign.left,
                        style: TextStyle( fontSize: 20 ,fontWeight: FontWeight.w600,),
                      ),
                      Padding(padding: EdgeInsets.only(right: 57.0),),
                      Expanded(child:
                      Text( "\n" + NGO + "\n",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        style: TextStyle( fontSize: 20),
                      ),
                      ),
                    ]
                ),
                Text(
                  '    Products :',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                if(Quantity1 != "0")
                Row(
                    children:[
                      Text("    "+ Product1 + " (" + Quantity1 + ")" ,
                        style: TextStyle( fontSize: 20),
                      ),
                    ]

                ),
                if(Product2 != "" && Quantity2 != "0")
                  Row(
                      children:[
                        Text("    "+Product2 + " (" + Quantity2 + ")" ,
                          textAlign: TextAlign.left,
                          style: TextStyle( fontSize: 20),
                        ),
                      ]
                  ),
                if(Product3 != "" &&  Quantity3 != "0")
                  Row(
                      children:[
                        Text("    "+Product3 + " (" + Quantity3 + ")",
                          textAlign: TextAlign.left,
                          style: TextStyle( fontSize: 20),
                        ),
                      ]
                  ),
                if(Product4 != ""  && Quantity4 != "0")
                  Row(
                      children:[
                        Text("    "+Product4 + " (" + Quantity4 + ")",
                          textAlign: TextAlign.left,
                          style: TextStyle( fontSize: 20),
                        ),
                      ]
                  ),
                Text(
                  "\n"
                )
              ]
          )
        );
      }
      else{
        return Container(
        );
      }
      }
      );
      }
      return Center(child: CircularProgressIndicator(),);
      }
      )
      )
      );
    }
  }

