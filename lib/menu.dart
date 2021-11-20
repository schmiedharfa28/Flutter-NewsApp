import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/constant.dart';
import 'package:news_app/detailpage.dart';
import 'package:news_app/res_get_berita.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Datum>? listBerita = [];
  Future getListBerita() async {
    var res = await http
        .get(Uri.parse('http://192.168.10.17/berita_coba/getBerita.php'));
    setState(() {
      listBerita = resGetBeritaFromJson(res.body).data;
    });
    return resGetBeritaFromJson(res.body).data;
  }

  @override
  void initState() {
    getListBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Menu Berita'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: GridView.builder(
                    itemCount: listBerita!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      Datum? data = listBerita![index];
                      return InkWell(
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: GridTile(
                                footer: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  color: Colors.black.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      "${data.judulBerita}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    '$ImageUrl' + data.gambarBerita!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(data)));
                          });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
