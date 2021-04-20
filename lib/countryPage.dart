import 'package:covidtrackerfinal/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  List countryData;

  fetchCountryData() async {
    var url = Uri.parse("https://corona.lmao.ninja/v3/covid-19/countries");
    http.Response response = await http.get(url);
    setState(() {
      countryData = json.decode(response.body);
    }
    );
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), color: Colors.black87, onPressed: (){

            showSearch(context: context, delegate: Search(countryData));

          }),
        ],
        centerTitle: true,
        title: Text('Country Statistics',
            style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: Colors.black87
        ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey[100], blurRadius: 10, offset: Offset(0, 10)),
            ]),
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(countryData[index]['country'], style: TextStyle(fontWeight: FontWeight.bold)),
                      Image.network(countryData[index]['countryInfo']['flag'], height: 56, width: 60),
                    ],
                  ),
                ),
                Expanded(child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Confirmed: ' + countryData[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                      Text('Active: ' + countryData[index]['active'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                      Text('Recovered: ' + countryData[index]['recovered'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                      Text('Deaths: ' + countryData[index]['deaths'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800])),
                    ],
                  ),
                )
                )

              ],
            ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}