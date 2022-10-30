import 'package:flutter/material.dart';
 
class ContactUs extends StatefulWidget {
  ContactUs({Key? key, required this.title}) : super(key: key);
  final String title;
 
  @override
  _State createState() => _State();
}
 
class _State extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
     
        title: Text(widget.title,style: TextStyle(color: Color(0xffffffff)),),
        backgroundColor: Color(0xFF0A5699),
       
      ),  
      body:Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: ListView(
        children :<Widget>[
        Container(
         margin: const EdgeInsets.only(top: 20.0),
                    height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                                  'https://res.cloudinary.com/dw4sh4ci7/image/upload/v1626340082/location_vurqy2.jpg'),
                                 
                                   ),
                              shape: BoxShape.circle,
                             
                            ),
         ),
        Container(
         margin: const EdgeInsets.only(top: 5.0),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '267 Julien Motorway Nerul,242125',
                       textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
         ),
        Container(
         margin: const EdgeInsets.only(top: 30.0),
                    height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                                  'https://res.cloudinary.com/dw4sh4ci7/image/upload/v1626340082/phone_onokjm.jpg'),
                                 
                                   ),
                              shape: BoxShape.circle,
                             
                            ),
         ),
        Container(
         
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '225-930-5723',
                       textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
         ),
        Container(
         margin: const EdgeInsets.only(top: 45.0),
                    height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                                  'https://res.cloudinary.com/dw4sh4ci7/image/upload/v1626340082/mail_yvxzot.jpg'),
                                 
                                   ),
                              shape: BoxShape.circle,
                             
                            ),
         ),
        Container(
         margin: const EdgeInsets.only(top: 5.0),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'charity123@gmail.com',
                       textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
         ),
        ]  
    )));
  }
}
