// To parse this JSON data, do
//
//     final resGetBerita = resGetBeritaFromJson(jsonString);

import 'dart:convert';

ResGetBerita resGetBeritaFromJson(String str) =>
    ResGetBerita.fromJson(json.decode(str));

String resGetBeritaToJson(ResGetBerita data) => json.encode(data.toJson());

class ResGetBerita {
  ResGetBerita({
    this.sukses,
    this.pesan,
    this.data,
  });

  bool? sukses;
  String? pesan;
  List<Datum>? data;

  factory ResGetBerita.fromJson(Map<String, dynamic> json) => ResGetBerita(
        sukses: json["sukses"] == null ? null : json["sukses"],
        pesan: json["pesan"] == null ? null : json["pesan"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sukses": sukses == null ? null : sukses,
        "pesan": pesan == null ? null : pesan,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.judulBerita,
    this.isiBerita,
    this.tglBerita,
    this.gambarBerita,
  });

  String? id;
  String? judulBerita;
  String? isiBerita;
  DateTime? tglBerita;
  String? gambarBerita;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        judulBerita: json["judul_berita"] == null ? null : json["judul_berita"],
        isiBerita: json["isi_berita"] == null ? null : json["isi_berita"],
        tglBerita: json["tgl_berita"] == null
            ? null
            : DateTime.parse(json["tgl_berita"]),
        gambarBerita:
            json["gambar_berita"] == null ? null : json["gambar_berita"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "judul_berita": judulBerita == null ? null : judulBerita,
        "isi_berita": isiBerita == null ? null : isiBerita,
        "tgl_berita": tglBerita == null
            ? null
            : "${tglBerita!.year.toString().padLeft(4, '0')}-${tglBerita!.month.toString().padLeft(2, '0')}-${tglBerita!.day.toString().padLeft(2, '0')}",
        "gambar_berita": gambarBerita == null ? null : gambarBerita,
      };
}
