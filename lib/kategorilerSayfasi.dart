import 'package:flutter/Material.dart';
import 'package:hatice_proje/main.dart';
import 'package:hatice_proje/yemeklerSayfa.dart';
import 'kategoridao.dart';
import 'kategoriler.dart';

class KategorilerSayfasi extends StatefulWidget {
  const KategorilerSayfasi({Key? key}) : super(key: key);

  @override
  State<KategorilerSayfasi> createState() => _KategorilerSayfasiState();
}

class _KategorilerSayfasiState extends State<KategorilerSayfasi> {
  Future<List<Kategoriler>> tumKategorileriGetir() async {
    var kategorilist = await Kategorilerdao().tumKategoriler();
    return kategorilist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f2ec).withOpacity(0.85),
        title: const Text("Kategoriler",
            style: TextStyle(fontFamily: 'Fondamento', fontSize: 24, color: Color(0xff6e4318), fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff6e4318), size: 27),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Anasayfa()));
          },
        ),
      ),
      body: Builder(builder: (context) {
        return FutureBuilder<List<Kategoriler>>(
          future: tumKategorileriGetir(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var kategorilist = snapshot.data;
              return ListView.builder(
                itemCount: kategorilist!.length,
                itemBuilder: (context, indeks) {
                  var kategori = kategorilist[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => YemeklerSayfa(kategori: kategori)));
                    },
                    child: Card(
                      color: const Color(0xff6e4318),
                      margin: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              kategori.kategori_adi,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xfff9f2ec),
                                  fontFamily: 'Fondamento'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center();
            }
          },
        );
      }),
    );
  }
}
