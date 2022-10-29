import 'package:flutter/material.dart';
import 'My_Donations.dart';
import 'aboutus.dart';
import 'categories.dart';
import 'contactus.dart';
import 'package:flutter/services.dart';
import 'main.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          DrawerHeader(
            child: Text(
              '"Giving is the greatest act of Grace"',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 25),
            ),


            decoration: BoxDecoration(
                color: Colors.blue,

                image: DecorationImage(
                    fit: BoxFit.fill,

                    image: NetworkImage(
                        'https://res.cloudinary.com/dw4sh4ci7/image/upload/v1626274968/2_xynjjd.png'))),

          ),
          ListTile(
            leading: Icon(Icons.home,color: Colors.black87
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Categories()),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.volunteer_activism_outlined,color: Colors.black87 ),
              title: Text('My Donations'),
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => My_Donations()),
                );
              }
          ),

          ListTile(
            leading: Icon(Icons.info_outline,color: Colors.black87  ),
            title: Text('About Us'),
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUs(title: 'About Us',)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_support_outlined ,color: Colors.black87),
            title: Text('Contact Us'),
            onTap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUs(title: 'Contact Us',)),
              );
            },
          ),
          Divider(
            height: 10,
            thickness: 2,
            indent: 16,
            endIndent: 16,


          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.black87 ),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app,color: Colors.black87 ),
              title: Text('Exit'),
              onTap: () => SystemNavigator.pop()
          ),
        ],
      ),
    );
  }
}

MyHomePage({required String title}) {
}