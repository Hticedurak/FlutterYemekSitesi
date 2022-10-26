import 'package:flutter/material.dart';
import 'package:hatice_proje/YemekEkle.dart';
import 'package:hatice_proje/kategoriler.dart';
import 'package:hatice_proje/kategorilerSayfasi.dart';
import 'package:hatice_proje/yemekler.dart';
import 'package:hatice_proje/yemeklerdao.dart';

import 'detaySayfa.dart';

class YemeklerSayfa extends StatefulWidget {

  final Kategoriler kategori;
  const YemeklerSayfa({Key? key, required this.kategori}) : super(key: key);

  @override
  State<YemeklerSayfa> createState() => _YemeklerSayfaState();
}
class _YemeklerSayfaState extends State<YemeklerSayfa> {
  Future<List<Yemekler>> kategoriyeGoreYemekGetir(int kategoriId) async{
    var yemekListesi= await Yemeklerdao().tumYemeklerByKategoriID(kategoriId);
    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f2ec).withOpacity(0.85),
        title: Text("${widget.kategori.kategori_adi} ",
            style: const TextStyle(
                fontFamily: 'Fondamento',
                fontSize: 24,
                color: Color(0xff6e4318),
                fontWeight: FontWeight.bold)
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff6e4318), size: 27),
          onPressed: ()
          {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const KategorilerSayfasi()));
          },
        ),

      ),
      body: FutureBuilder<List<Yemekler>>(
        future: kategoriyeGoreYemekGetir(widget.kategori.kategori_id),
        builder: (context,snapshot) {
          if(snapshot.hasData) {
            var yemekListesi=snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: yemekListesi!.length,
              itemBuilder: (context,indeks) {
                var yemekler =yemekListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(yemek: yemekler)));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, top: 20,right: 20, bottom: 50),
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                    decoration: BoxDecoration(
                        color: const Color(0xff6e4318),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 16))
                        ]),

                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Image.asset("assets_/img/${yemekler.yemek_resim}"),
                        const SizedBox(height: 30),
                        Text(yemekler.yemek_adi, style: const TextStyle(
                            color: Color(0xfff9f2ec),
                            fontSize: 20,
                            fontFamily: "Fondamento",
                            fontWeight: FontWeight.bold)),
                      ],
                    ),


                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6e4318),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>YemekEkle(widget.kategori.kategori_id)));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),


    );
  }
}
