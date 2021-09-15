import 'dart:math';

import 'package:flutter/material.dart';
import 'package:odev1/gamePage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homework 1 - Color Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ZORLUK SEVİYESİNİ SEÇİN",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buton(context, 3, Colors.deepOrange),
                buton(context, 4, Colors.deepPurple),
                buton(context, 5, Colors.pink),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ignore: deprecated_member_use
  RaisedButton buton(BuildContext context, int boyut, Color renk) {
    // ignore: deprecated_member_use
    return RaisedButton(
        color: renk,
        child: Text("$boyut x $boyut",
            style: TextStyle(color: Colors.white, fontSize: 24)),
        onPressed: () {
          int rastgeleSayi = Random().nextInt(boyut * boyut);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  GamePage(size: boyut, rastgeleSayi: rastgeleSayi),
            ),
          );
        });
  }
}
