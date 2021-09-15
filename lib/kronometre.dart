import 'dart:async';
import 'package:flutter/material.dart';
import 'package:odev1/sonuc.dart';

// ignore: must_be_immutable
class Kronometre extends StatefulWidget {
  int puan;
  Kronometre(this.puan);
  @override
  _KronometreState createState() => _KronometreState();
}

// ignore: camel_case_types
class _KronometreState extends State<Kronometre> {
  Timer kronometre;
  int saniye = 60;
  void initState() {
    super.initState();
    baslat();
  }

  void baslat() {
    saniye = 60;
    kronometre = Timer.periodic(Duration(seconds: 1), (sayac) {
      setState(() {
        if (saniye > 0) {
          saniye--;
        } else {
          kronometre.cancel();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Sonuc(widget.puan)));
        }
      });
    });
  }

  bool visibleKontrol = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Time $saniye",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
