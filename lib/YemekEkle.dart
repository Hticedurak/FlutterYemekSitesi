import 'package:flutter/material.dart';
import 'package:hatice_proje/yemeklerdao.dart';
import 'main.dart';

class YemekEkle extends StatefulWidget {
  const YemekEkle(this.kategori_id,{Key? key}) : super(key: key);
  final kategori_id;
  @override
  State<YemekEkle> createState() => _YemekEkleState();
}

class _YemekEkleState extends State<YemekEkle> {
  final _formKey = GlobalKey<FormState>();
  String yemekAdi = "";
  String yemekMalzemeler = "";
  String yemekResim = "";
  String yemekTarif = "";

  Future<void> yemekEkle(String yemekAdi, String yemekMalzemeler, String yemekResim, String yemekTarif,int kategori_id) async {
    await Yemeklerdao().yemekEkle(yemekAdi, yemekMalzemeler, yemekResim, yemekTarif,kategori_id);
  }
  @override
  Widget build(BuildContext context) {
    final screenInfo = MediaQuery.of(context).size;
    var screenWidth = screenInfo.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f2ec).withOpacity(0.85),
        title: Text("Yeni Yemek Ekle",
            style: const TextStyle(
                fontFamily: 'Fondamento',
                fontSize: 24,
                color: Color(0xff6e4318),
                fontWeight: FontWeight.bold)
        ),
        iconTheme: const IconThemeData(color: Color(0xff6e4318)),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  "Lütfen bilgileri eksiksiz doldurun!",
                  style: TextStyle(fontSize: 25, fontFamily: "Fondamento", color: Color(0xff6e4318)),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Yemek adı*',

                    ),
                    validator: (String? value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return 'Lütfen zorunlu alanları doldurun.';
                      } else {
                        yemekAdi = value;
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      labelText: 'Yemek kapak resmi linki*',

                    ),
                    validator: (String? value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return 'Lütfen zorunlu alanları doldurun.';
                      } else {
                        yemekResim = value;
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Malzemeler*',
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return 'Lütfen zorunlu alanları doldurun.';
                      } else {
                        yemekMalzemeler = value;
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Yemek Tarifi*',
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return 'Lütfen zorunlu alanları doldurun.';
                      } else {
                        yemekTarif = value;
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                    width: screenWidth * 90 / 100,
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      color: const Color(0xff6e4318),
                      child: const Text(
                        "Ekle",
                        style: TextStyle(color: Color(0xfff9f2ec), fontSize: 20, fontFamily: "Fondamento"),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          yemekEkle(yemekAdi, yemekMalzemeler, yemekResim, yemekTarif,widget.kategori_id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
