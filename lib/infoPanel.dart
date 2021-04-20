import 'package:covidtrackerfinal/about.dart';
import 'package:covidtrackerfinal/datasource.dart';
import 'package:covidtrackerfinal/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FAQPage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: primaryBlack,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("FAQs", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://covid19responsefund.org/en');
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16), color: primaryBlack,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Donate", style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(
                            'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16), color: primaryBlack,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Text("Myth Busters", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                                  Icon(
                                      Icons.arrow_forward, color: Colors.white),

                                ],
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => AboutPage()));
                              },
                              child: Container(
                                child: Column(
                                    children: <Widget>[
                                Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 10),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16), color: primaryBlack,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    Text("About the Dev", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                    Icon(
                                        Icons.arrow_forward, color: Colors.white),

                                  ],
                                ),
                              ),
    GestureDetector(
    onTap: () {
    Navigator.push(context, MaterialPageRoute(
    builder: (context) => AboutPage()));
    },

                              child: Container(
                                child: Column(
                                    children: <Widget>[
                                Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 10),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16), color: primaryBlack,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[
                                    Text("Buy me a coffee?", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                    Icon(
                                        Icons.arrow_forward, color: Colors.white)
    ],
    ),
    ),
    ],
    )
    ),
    ),
    ],
    ),
    ),
    ),
],
)
),
),
],
),
),
  ),
],
),
);
}
}