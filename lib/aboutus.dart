import 'package:flutter/material.dart';


class AboutUs extends StatefulWidget {
  AboutUs({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _State createState() => _State();
}

class _State extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title,style: TextStyle(color: Color(0xffffffff)),),
        backgroundColor: Color(0xFF0A5699),
        
      ),  
     body: Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: ListView(
              children: <Widget>[
                  
                Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXNg1phCwz4PrNIBs-TQUqelwxNiKBWnmEyw&usqp=CAU'),
                                 
                                   ),
                              shape: BoxShape.circle,
                              color: Colors.orange[900]
                            ),),
                Container(
                    margin: const EdgeInsets.only(top: 20.0), 
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'We believe that with the effective use of technology and introducing crowd-funding to the Indian public, we can create a much effective giving culture.',
                       textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    )),
                 
                  Container(
                        margin: const EdgeInsets.only(top: 60.0),
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                                  'https://www.breakingbelizenews.com/wp-content/uploads/2016/12/anti-corrup.jpg'),
                                 
                                   ),
                              shape: BoxShape.circle,
                            ),),
                Container(
                     margin: const EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'No money involved and products will be delivered directly by Charity app, thus complete transparency.',
                       textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
                    )),
                   
               Container(
                     margin: const EdgeInsets.only(top: 60.0),
                    height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                                  'https://thumbs.dreamstime.com/b/quality-management-circle-quality-management-circle-word-cloud-business-concept-199791480.jpg'),
                                 
                                   ),
                              shape: BoxShape.circle,
                              color: Colors.black
                            ),),
                           
                Container(
                     margin: const EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'We will empower and provide tools to NGO’s to manage their donors which will increase the donor retention rate.',
                       textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    )),
                  
               Container(
                     margin: const EdgeInsets.only(top: 60.0),
                    height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                                  'https://img.freepik.com/free-vector/volunteers-packing-donation-boxes_74855-5299.jpg?size=626&ext=jpg&ga=GA1.2.2036626421.1615680000'),
                                 
                                   ),
                              shape: BoxShape.circle,
                                color: Colors.blue[900]
                            ),),
                Container(
                     margin: const EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(10),
                    child: Text(

                      'Just tell us the products that are in need to your organisation we will make sure that you get them all and you just focus on the work you do.',
                       textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    )),
                    
               Container(
                     margin: const EdgeInsets.only(top: 60.0),
                    height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                                  'https://thumbs.dreamstime.com/b/print-134507200.jpg'),
                                 
                                   ),
                              shape: BoxShape.circle,
                              color: Colors.red[900]
                            ),),
                Container(
                      margin: const EdgeInsets.only(top: 20.0,bottom: 10.0),
 
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Completely free for organisations to run any number of campaigns where as crowdfunding platforms charges more than 10% of raised money as fees.',
                       textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    )), 
                    
              
              ],
            ))
      );
     
    }
  }
