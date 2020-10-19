import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splashscreen/splashscreen.dart';
import 'dataBox.dart';
import 'about.dart';

Image background;
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "COVID-19 Tracker",
      color: Colors.grey[900],
      home: Splash()));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      image: Image.asset('assets/app-icon.png'),
      photoSize: 150.0,
      loaderColor: Colors.blue,
      backgroundColor: Colors.white,
      navigateAfterSeconds: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  @override
  Map indonesiaData;
  fetchIndonesia() async {
    http.Response response =
        await http.get('https://disease.sh/v3/covid-19/countries/indonesia');
    setState(() {
      ;
      indonesiaData = jsonDecode(response.body);
    });
  }

  Map worldData;
  fetchWorld() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      ;
      worldData = jsonDecode(response.body);
    });
  }

  void initState() {
    fetchIndonesia();
    fetchWorld();
    background = Image.asset('assets/bg.png');
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(background.image, context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    image: DecorationImage(
                        image: AssetImage('assets/app-icon.png'),
                        fit: BoxFit.cover)),
                child: Text(
                  'COVID - 19 Tracker',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('About'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => about()));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("COVID - 19 TRACKER"),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              image: DecorationImage(
                  image: AssetImage('assets/bg.gif'), fit: BoxFit.cover),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/image/indonesia.png',
                          width: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Indonesia',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500))
                      ],
                    )),
                Container(
                  child: indonesiaData == null
                      ? Center(
                          child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[900],
                        ))
                      : GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio:
                              MediaQuery.of(context).size.width / 2 / 90,
                          children: <Widget>[
                            dataBox(
                              title: 'Terkonfirmasi',
                              count: indonesiaData['cases'].toString(),
                              textColor: Colors.yellowAccent,
                              fontSize: 14,
                            ),
                            dataBox(
                              title: 'Dalam Perawatan',
                              count: indonesiaData['active'].toString(),
                              textColor: Colors.orangeAccent,
                              fontSize: 14,
                            ),
                            dataBox(
                              title: 'Sembuh',
                              count: indonesiaData['recovered'].toString(),
                              textColor: Colors.greenAccent,
                              fontSize: 14,
                            ),
                            dataBox(
                              title: 'Meninggal',
                              count:
                                  indonesiaData['deaths'].toString(),
                              textColor: Colors.redAccent,
                              fontSize: 14,
                            ),
                          ],
                        ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: MediaQuery.of(context).size.width - 20,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 2,
                        ),
                        Image.asset(
                          'assets/image/world.png',
                          width: 50,
                        ),
                        Text('Dunia',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500))
                      ],
                    )),
                Container(
                  child: worldData == null
                      ? Center(
                          child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[900],
                        ))
                      : GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio:
                              MediaQuery.of(context).size.width / 2 / 120,
                          children: <Widget>[
                            dataBox(
                              title: 'Terkonfirmasi',
                              count: worldData['active'].toString(),
                              textColor: Colors.yellowAccent,
                              fontSize: 8,
                            ),
                            dataBox(
                              title: 'Sembuh',
                              count: worldData['recovered'].toString(),
                              textColor: Colors.greenAccent,
                              fontSize: 8,
                            ),
                            dataBox(
                              title: 'Meninggal',
                              count: worldData['deaths'].toString(),
                              textColor: Colors.redAccent,
                              fontSize: 8,
                            )
                          ],
                        ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: indonesiaData == null
                      ? Center(
                          child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[900],
                        ))
                      : Column(
                          children: <Widget>[
                            Text(
                              'Terakhir kali di update',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 12),
                            ),
                            Text(indonesiaData['update'].toString(),
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 12))
                          ],
                        ),
                )
              ],
            )));
  }
}
