import 'package:flutter/material.dart';

class dataBox extends StatelessWidget {
  @override
  final Color textColor;
  final String title;
  final String count;
  final double fontSize;

  const dataBox({Key key, this.textColor, this.title, this.count, this.fontSize}) : super(key: key);

  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double screenWidth = mediaQueryData.size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(10,10,10,10),
      height: 150,
      width: screenWidth/2,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        border: Border(top: BorderSide(color: textColor, width: 3.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(this.count,
            style: TextStyle(
              fontSize: this.fontSize + 8,
              color: textColor,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(this.title,
            style: TextStyle(
              fontSize: this.fontSize,
              color: Colors.white,
              letterSpacing: 1.5,
          ),
        )
        ],
      ),
    );
  }
}
