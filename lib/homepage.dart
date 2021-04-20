import 'dart:convert';
import 'package:covidtrackerfinal/countryPage.dart';
import 'package:covidtrackerfinal/datasource.dart';
import 'package:covidtrackerfinal/infoPanel.dart';
import 'package:covidtrackerfinal/mosteffectedcountries.dart';
import 'package:covidtrackerfinal/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;

  fetchWorldWideData() async {
    var url = Uri.parse("https://corona.lmao.ninja/v3/covid-19/all");
    http.Response response = await http.get(url);
    setState(() {
      worldData = jsonDecode(response.body);
    }
    );
  }

  List countryData;
  fetchCountryData() async {
    var url = Uri.parse("https://corona.lmao.ninja/v3/covid-19/countries?sort=cases");
    http.Response response = await http.get(url);
    setState(() {
      countryData = json.decode(response.body);
    }
    );
  }

  Future fetchData() async{
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Icon(
            Icons.coronavirus_rounded,
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
        title: Text('COVID-19 Infection Tracker',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
      ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      alignment: FractionalOffset.centerRight,
                      child: Image(
                          image: AssetImage(
                            'image/cov2.png'
                          ),
                        height: 150,
                        width: 190,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 75.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Tap into the Statistics Below', style: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w600,)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Worldwide',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CountryPage()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Regional',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                worldData == null
                    ? CircularProgressIndicator()
                    : WorldwidePanel(
                  worldData: worldData,
                ),
                SizedBox(height: 27.5),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Most Effected Countries',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12.5),
                countryData == null
                    ? Container()
                    : MostEffectedPanel(
                  countryData: countryData,
                ),
                SizedBox(height: 17.5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 17.5),
                  child: Text(
                      'Further Information',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                ),
                InfoPanel(),
                SizedBox(height: 27.5),
              ],
            )),
      ),
    );
  }
}
