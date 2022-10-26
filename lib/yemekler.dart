import 'package:hatice_proje/veriTabaniYardimcisi.dart';

class Yemekler {
  late int yemek_id;
  late String yemek_adi;
  late String yemek_malzemeler;
  late String yemek_tarif;
  late String yemek_resim;

  Yemekler(this.yemek_id, this.yemek_adi, this.yemek_malzemeler,
      this.yemek_resim, this.yemek_tarif);

  Yemekler.fromMap(Map<String, dynamic> map){
    yemek_id = map["yemek_id"];
    yemek_adi = map["yemek_adi"];
    yemek_malzemeler = map["yemek_malzemeler"];
    yemek_tarif = map["yemek_tarif"];
    yemek_resim = map["yemek_resim"];
  }

  Map<String, dynamic> toMap() {
    return {
      VeriTabaniYardimcisi.columnId: yemek_id,
      VeriTabaniYardimcisi.columnAdi: yemek_adi,
      VeriTabaniYardimcisi.columnMalzemeler: yemek_malzemeler,
      VeriTabaniYardimcisi.columnTarif: yemek_tarif,
      VeriTabaniYardimcisi.columnResim: yemek_resim,
    };
  }
}
