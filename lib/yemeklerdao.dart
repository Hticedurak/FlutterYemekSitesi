import 'package:hatice_proje/veriTabaniYardimcisi.dart';
import 'package:hatice_proje/yemekler.dart';

class Yemeklerdao
{
  Future<List<Yemekler>> tumYemeklerByKategoriID(int kategori_id) async{
    var db=await VeriTabaniYardimcisi.vtErisim();
    List<Map<String,dynamic>> maps= await db.rawQuery("SELECT * FROM yemekler WHERE kategori_id='$kategori_id'");
    return List.generate(maps.length, (i)
    {
      var satir=maps[i];
      return Yemekler(satir["yemek_id"], satir["yemek_adi"], satir["yemek_malzemeler"], satir["yemek_resim"], satir["yemek_tarif"]);

    });
  }
  Future<void> yemekEkle(String yemek_adi, String yemek_malzemeler, String yemek_resim, String yemek_tarif,int kategori_id) async {
    var db=await VeriTabaniYardimcisi.vtErisim();
    var yemek = <String, dynamic>{};
    yemek["yemek_adi"] = yemek_adi;
    yemek["yemek_malzemeler"] = yemek_malzemeler;
    yemek["yemek_resim"] = yemek_resim;
    yemek["yemek_tarif"] = yemek_tarif;
    yemek["kategori_id"] = kategori_id;
    await db.insert("yemekler", yemek);
  }

  Future<void> yemekSil(int yemek_id) async {
    var db=await VeriTabaniYardimcisi.vtErisim();
    await db.delete("yemekler", where: "yemek_id=?", whereArgs: [yemek_id]);
  }
}
