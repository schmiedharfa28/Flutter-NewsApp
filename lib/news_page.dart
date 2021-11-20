import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/detailpage.dart';
import 'package:news_app/res_get_berita.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "News Application",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              //mempunyai beberapa parameter
              CarouselSlider(
                items: listBerita!.map((e) {
                  return Image.network('$ImageUrl' + e.gambarBerita!);
                }).toList(),
                options:
                    CarouselOptions(autoPlay: true, enlargeCenterPage: true),
              ),
              Container(
                height: 330,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listBerita!.length,
                    itemBuilder: (context, index) {
                      Datum? data = listBerita![index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(data)));
                          },
                          title: Text(
                            '${data.judulBerita}',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          subtitle: Text(
                            '\n${data.isiBerita}',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          leading: Padding(
                            padding: EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                '$ImageUrl' + data.gambarBerita!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
