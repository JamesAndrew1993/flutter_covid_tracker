import 'package:covidtrackerfinal/datasource.dart';
import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red.shade100.withOpacity(0.6),
            textColor: primaryBlack,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor:  Colors.blue.shade100.withOpacity(0.6),
            textColor: primaryBlack,
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green.shade100.withOpacity(0.6),
            textColor: primaryBlack,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.grey.shade100.withOpacity(0.6),
            textColor: primaryBlack,
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: panelColor
      ),
      margin: EdgeInsets.all(17.5),
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.coronavirus_rounded, color: primaryBlack),
          SizedBox(height: 7.5),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 18, color: textColor, fontFamily: 'Pacifico'),
          ),
          SizedBox(height: 10),
          Text(
            count,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: textColor, fontFamily: 'Source Sans Pro'),
          )
        ],
      ),
    );
  }
}