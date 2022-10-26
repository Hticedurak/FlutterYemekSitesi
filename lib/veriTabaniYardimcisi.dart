import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeriTabaniYardimcisi{

  static final String VeriTabaniAdi= "yemek.sqlite";
  static final columnId="yemek_id";
  static final columnAdi="yemek_adi";
  static final columnMalzemeler="yemek_malzemeler";
  static final columnTarif="yemek_tarif";
  static final columnResim="yemek_resim";

  static Future<Database> vtErisim() async
  {
    String veriTabaniYolu=join(await getDatabasesPath(),VeriTabaniAdi);

    if(await databaseExists(veriTabaniYolu))
    {
      print("Database kayıtlı, kopyalamaya gerek yok");
    }
    else {
      ByteData data=await rootBundle.load(("veritabani/$VeriTabaniAdi"));
      List<int> bytes=data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File (veriTabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veritabani Kopyalandi");
    }
    return openDatabase(veriTabaniYolu);
  }
}
