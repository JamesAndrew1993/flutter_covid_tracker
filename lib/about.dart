import 'package:covidtrackerfinal/datasource.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: primaryBlack,
        centerTitle: true,
        title: Text('About the Dev'),
        ),
      backgroundColor: Colors.white,
      body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage('image/jamesflutter.jpeg'),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'James Andrew',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Pacifico',
              color: Colors.teal[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              'IOS & Android Developer',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal[800],
                fontSize: 22.5,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              )
          ),
          SizedBox(
            height: 25,
            width: 325.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Icon(
                Icons.location_city_rounded,
                color: Colors.teal,
              ),
              title: Text(
                'Aberdeen, UK',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal[800],
                  fontFamily: 'Source Sans Pro',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 17.5,
          ),
          GestureDetector(
              onTap: () {
                launch(
                    'https://www.linkedin.com/in/james-andrew-b5aba7a4');
              },
          ),
          Container(
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person_add_alt_1_rounded,
                  color: Colors.teal,
                ),
                title: Text(
                  'Connect with me on Linkedin',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal[800],
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      )
    );}
 }