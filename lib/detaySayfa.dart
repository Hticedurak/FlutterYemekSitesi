import 'package:flutter/material.dart';
import 'package:hatice_proje/main.dart';
import 'package:hatice_proje/yemekler.dart';
import 'package:hatice_proje/yemeklerdao.dart';

class DetaySayfa extends StatefulWidget {
  final Yemekler yemek;
  final yemek_id;
  const DetaySayfa({Key? key, required this.yemek, this.yemek_id}) : super(key: key);


  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  Future<void> yemekSil(int yemek_id) async{
    await Yemeklerdao().yemekSil(yemek_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff6e4318),
          size: 25,
        ),
        backgroundColor: const Color(0xfff9f2ec).withOpacity(0.85),
        title: Text(
          widget.yemek.yemek_adi,
          style: const TextStyle(fontFamily: 'Fondamento', fontSize: 24, color: Color(0xff6e4318), fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: Column(
                children: <Widget>[
                  Image.asset("assets_/img/${widget.yemek.yemek_resim}"),
                  const SizedBox(height: 22),
                  buildBaslik("Malzemeler"),
                  const SizedBox(height: 15),
                  buildMalzemeler(Text(
                    widget.yemek.yemek_malzemeler,
                    style: const TextStyle(
                        color: Color(0xfff9f2ec), fontFamily: "Fondamento", fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  const SizedBox(height: 15),
                  buildBaslik("Tarif"),
                  const SizedBox(height: 15),
                  buildTarif(Text(
                    widget.yemek.yemek_tarif,
                    style: const TextStyle(
                        color: Color(0xfff9f2ec), fontFamily: "Fondamento", fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6e4318),
        onPressed: (){
          yemekSil(widget.yemek.yemek_id);
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Anasayfa()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.restore_from_trash),
      ),
    );
  }

  Widget buildBaslik(String metin) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xff6e4318)),
      child: Text(
        metin,
        style: const TextStyle(fontFamily: 'Fondamento', color: Color(0xfff9f2ec), fontSize: 18),
      ),
    );
  }

  Widget buildTarif(Text text) {
    return Container(
      padding: const EdgeInsets.all(29.0),
      decoration: BoxDecoration(
        color: const Color(0xff6e4318).withOpacity(0.80),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        child: text,
      ),
    );
  }

  Widget buildMalzemeler(Text text) {
    return Container(
      margin: const EdgeInsets.only(left: 60, top: 10, right: 60, bottom: 10),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xff6e4318).withOpacity(0.80),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        child: text,
      ),
    );
  }

}
