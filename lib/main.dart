import 'package:flutter/material.dart';
import 'package:hatice_proje/uyeGirisi.dart';
import 'package:hatice_proje/yeniKayit.dart';
import 'hakkimizda.dart';
import 'kategorilerSayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}
class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);


  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: const Color(0xfff9f2ec),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                buildBaslik(),
                buildBanner(),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //ilk eleman
                      buildNavigation(
                          text: "Kategoriler",
                          icon: Icons.menu,
                          widget: const KategorilerSayfasi(),
                          context: context),
                      buildNavigation(
                          text: "Kullanıcı Girişi",
                          icon: Icons.person,
                          widget: const UyeGirisi(),
                          context: context),
                      buildNavigation(
                          text: "Üye Kayıt",
                          icon: Icons.people,
                          widget: const YeniKayit(),
                          context: context),
                      buildNavigation(
                          text: "Hakkımızda",
                          icon: Icons.web_outlined,
                          widget: const Hakkimizda(),
                          context: context)
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Text(
                  "Beş Çayı",textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Fondamento',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff6e4318)),
                ),
                const SizedBox(height: 13),
                buildTarihce(
                  metin: "İngilizlerin en köklü geleneklerinden birisi olan beş çayı, ikindi çayı olarak da adlandırılır. 19. yüzyılda İngiltere Düşes'i Anna tarafından başlanan 5 çayı ritüeli, Düşes'in öğle ile akşam yemeği arasında çay ve sandviç yemesiyle ortaya çıkar. Düşes'in alışkanlığına misafirleri de dahil olur ve bir süre sonra İngiltere’nin en popüler sosyal ritüellerinden birisine dönüşür. 1900’lü yılların sonunda toplumda yer alan burjuva kadınlar öğleden sonra toplanarak çay içmeye başlar. Genellikle 4 ila 5 arasında yapılan çay toplantılarına kadınlar uzun ipek eldiven ve şapkalarla katılır. Bu alışkanlığın kralın da hoşuna gitmesi ile beraber her akşam sarayda çay partileri düzenlenmeye başlar. Günümüzde hala devam eden İngiliz 5 çayı alışkanlığı, İngilizlerin arkadaşları ile ikindi vakitlerinde buluşarak çay ve kurabiye içmeleri şeklinde devam eder. İkindi çayında, çay kadar ortam da önemlidir. Evin en rahat ve huzurlu noktası seçilerek şömine ya da pencerenin önüne iki adet masa yerleştirilir. Masanın birinde misafirler otururken diğer masada çay yer alır ve ev sahibi çayı servis eder. Demliğin, misafirlerin oturduğu masada yer alması hoş kabul edilmez. ",
                  fotourl: "assets_/img/cay.jpg",
                ),
                const SizedBox(height: 29),

                const SizedBox(height: 29),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavigation({
    required String text,
    required IconData icon,
    required widget,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget;
        }));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
            decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Color(0xff6e4318)),
            child: Icon(
              icon,
              color: const Color(0xfff9f2ec),
              size: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff6e4318),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBaslik() {
    return const Padding(
      padding: EdgeInsets.only(top: 25.0),
      child: Text(
        "Beş Çayı",
        style: TextStyle(
          fontFamily: 'Fondamento',
          fontSize: 30,
          color: Color(0xff6e4318),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildBanner() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: const Color(0xff6e4318),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Beş Çayı' na Hoş Geldiniz:)",
              style: TextStyle(
                fontFamily: 'Fondamento',
                fontSize: 18,
                color: Color(0xfff9f2ec),
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }

  Widget buildTarihce({required String metin, required String fotourl}) {
    return Column(
      children: [
        Image.asset(fotourl),
        const SizedBox(height: 35),
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6e4318).withOpacity(0.85)),
          child: Text(
            metin,
            style: const TextStyle(
                fontFamily: 'Fondamento',
                color: Color(0xfff9f2ec),
                fontSize: 18),
          ),
        ),
      ],
    );
  }
}
