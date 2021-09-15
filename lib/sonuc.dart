import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Sonuc extends StatefulWidget {
  int puan;
  Sonuc(this.puan);

  @override
  _SonucState createState() => _SonucState();
}

class _SonucState extends State<Sonuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GAME OVER",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Card(
              child: Text(
                "SKORUNUZ: ${widget.puan}",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
