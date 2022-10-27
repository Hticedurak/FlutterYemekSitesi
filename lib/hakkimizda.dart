import 'package:flutter/material.dart';
import 'package:hatice_proje/main.dart';


class Hakkimizda extends StatelessWidget {
  const Hakkimizda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff9f2ec).withOpacity(0.85),
          title: const Text("Hakkımızda",
              style: TextStyle(fontFamily: 'Fondamento', fontSize: 24, color: Color(0xff6e4318), fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff6e4318), size: 27),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Anasayfa()));
            },
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets_/img/arkaplan4.jpg'), fit: BoxFit.cover),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    child: Container(
                        padding: const EdgeInsets.all(26.0),
                        decoration: BoxDecoration(
                          color: const Color(0xfff9f2ec).withOpacity(0.80),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Yemek yemek insan hayatının temel ihtiyaçlarından biridir. Bizimki gibi bazı toplumlarda kültürel bir değer olarak da görülür. Eşle dostla biraraya gelinip yenilen yemekler bir başkadır. Psikolojik araştırmalar, birlikte yemek yiyen insanların birbirileri ile daha hızlı bağ kurduğunu göstermektedir. Bu duruma, yemeğinizi sevdiklerinizle birlikte yiyebilme imkanı da eklenince yemek ritüeli, rahatlatan bir aktivite haline gelir."
                                "\n \nÜlkemizde yaygın olan 5 çayı konsepti, hayatımızda önemli bir yer tutmaktadır. Peki 5 çayı konseptinde yapılacak yemekler nelerdir? İşte uygulamamız bu konuda sizlere yardımcı olacaktır. Uygulamamızda bulunan çeşitli yemek tarifleri gününüzü kurtarmakta adeta kahraman görevindedir. Uzman şefler tarafından onaylanmış şahane yemekler, sizler için derlenip sunulmuştur."
                                "\n \nUygulamamızda, her kesimden insanın rahatlıkla girip eşsiz lezzetlere ulaşması için kolay bir arayüz kullanılmıştır. Uygulamamız eşsiz tasarımıyla gözünüze hitap ederken içerisindeki lezzetler damağınızda mükemmel hazlar uyandırır. Uygulamamız, açıklayıcı ve pratik yemek anlatımı ile yediden yetmişe her bireye yemek yapmasını sevdirir ve hiç tatmadığınız deneyimler sunar. Uygulamamızdaki tarifler ile sofralarınızı süsleyecek, lezzet dolu nefis yemekler sizleri beklemektedir.",
                            style: TextStyle(
                              fontFamily: 'Fondamento',
                              fontSize: 20,
                              color: Color(0xff6e4318),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ),
                ]))));
  }
}

