import 'package:flutter/material.dart';
import 'dart:math';
import 'package:odev1/kronometre.dart';

// ignore: must_be_immutable
class GamePage extends StatefulWidget {
  int size = 3;
  int rastgeleSayi;

  GamePage({this.size, this.rastgeleSayi});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    print("sayfa çalıştı");
  }

  int rastgeleRenk = Random().nextInt(25);
  int hafizadakiRenk = 0;
  int geciciRenk = 0;
  int puan = 0;
  int sayac = 25;
  List<int> renkler = [
    0xFFf44336,
    0xFFe91e63,
    0xFF9c27b0,
    0xFF673ab7,
    0xFF3f51b5,
    0xFF2196f3,
    0xFF03a9f4,
    0xFF00bcd4,
    0xFF009688,
    0xFF4caf50,
    0xFF8bc34a,
    0xFFcddc39,
    0xFFffeb3b,
    0xFFffc107,
    0xFFff9800,
    0xFFff5722,
    0xFF795548,
    0xFF9e9e9e,
    0xFF607d8b,
    0xFFe0e0e0, //gri
    0xFF212121, //siyah
    0xFFf48fb1,
    0xFFce93d8,
    0xFFbcaaa4,
    0xFFfff9c4
  ];
  void yenidenolustur() {
    renkler = [
      0xFFf44336,
      0xFFe91e63,
      0xFF9c27b0,
      0xFF673ab7,
      0xFF3f51b5,
      0xFF2196f3,
      0xFF03a9f4,
      0xFF00bcd4,
      0xFF009688,
      0xFF4caf50,
      0xFF8bc34a,
      0xFFcddc39,
      0xFFffeb3b,
      0xFFffc107,
      0xFFff9800,
      0xFFff5722,
      0xFF795548,
      0xFF9e9e9e,
      0xFF607d8b,
      0xFFe0e0e0, //gri
      0xFF212121, //siyah
      0xFFf48fb1,
      0xFFce93d8,
      0xFFbcaaa4,
      0xFFfff9c4
    ];
  }

  var geciciRenkler;
  int get removeRenk {
    geciciRenkler = renkler;
    int gecici = geciciRenkler[rastgeleRenk];
    geciciRenkler.removeAt(rastgeleRenk);
    return gecici;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Kronometre(puan),
            secilecekRenk(),
            Expanded(
              child: gridYapisi(),
            ),
          ],
        ),
      ),
    );
  }

  GridView gridYapisi() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.size,
      ),
      itemCount: widget.size * widget.size,
      itemBuilder: (context, indeks) {
        return GestureDetector(
          onTap: () {
            // ignore: unnecessary_statements
            indeks == widget.rastgeleSayi ? puan++ : null;

            if (indeks == widget.rastgeleSayi) {
              setState(() {
                rastgeleRenk = Random().nextInt(25);
                sayac = 25;
                widget.rastgeleSayi =
                    Random().nextInt(widget.size * widget.size);
                yenidenolustur();

                geciciRenkler = renkler;
              });
            }
          },
          child: Card(
            color: Color(widget.rastgeleSayi == indeks
                ? hafizadakiRenk
                : ((geciciRenk = geciciRenkler[rastgeleRenk =
                            Random().nextInt(--sayac)]) ==
                        null)
                    ? null
                    : removeRenk),
          ),
        );
      },
    );
  }

  Row secilecekRenk() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Next",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Container(
          color: Color(
            ((hafizadakiRenk = renkler[rastgeleRenk]) == null)
                ? null
                : removeRenk,
          ),
          height: 50,
          width: 50,
        ),
      ],
    );
  }
}
