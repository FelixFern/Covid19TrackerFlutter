import 'package:flutter/material.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("About App"),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        child: Column(children: <Widget>[
            SizedBox(height: 20,),
            CircleAvatar(backgroundImage: AssetImage('assets/app-icon.png'),backgroundColor: Colors.grey[300],radius: 80, ),
            SizedBox(height: 20,),
            Center(
            child:Text('COVID - 19 Tracker', style: 
              TextStyle(
                color: Colors.grey[200],
                fontSize: 25,
                fontWeight: FontWeight.w400
              ),
            ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),  
              child: 
                Text('Aplikasi \"COVID-19 Tracker\" ini adalah aplikasi sederhana untuk menampilkan data COVID-19 di Indonesia dan dunia', style: 
                  TextStyle(
                    color: Colors.grey[200],
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                  ),
                ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),  
              child: 
                Text('Sumber Data : https://kawalcovid19.harippe.id/api/summary\nhttps://corona.lmao.ninja/v2/all', style: 
                  TextStyle(
                    color: Colors.grey[200],
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                  ),
                ),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),  
              child: 
                Text('Developer : Felix Fernando', style: 
                  TextStyle(
                    color: Colors.grey[200],
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                  ),
                ),
            ),
            SizedBox(height: 100,),
            Text('Version 1.0', style: 
              TextStyle(
                color: Colors.grey[500],
                fontSize: 10
              )
            ),
            Text('Dibuat tahun 2020', style: 
              TextStyle(
                color: Colors.grey[500],
                fontSize: 10
              )
            )
          ],
        ),
      ),
    );
  }
}