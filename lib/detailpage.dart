import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/res_get_berita.dart';

class DetailPage extends StatelessWidget {
  final Datum data;
  DetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Detail Berita",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network('$ImageUrl' + data.gambarBerita!),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${data.judulBerita}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${data.isiBerita}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
