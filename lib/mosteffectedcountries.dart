import 'package:flutter/material.dart';

class MostEffectedPanel extends StatelessWidget {


  final List countryData;

  const MostEffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Image.network(countryData[index]['countryInfo']['flag'], height: 25),
                  SizedBox(width: 12),
                  Text(countryData[index]['country'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Deaths: ' + countryData[index]['deaths'].toString(),
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            );
        },
        itemCount: 5,
      ),
    );

  }
}