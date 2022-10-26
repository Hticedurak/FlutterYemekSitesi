import 'package:flutter/material.dart';
import 'package:hatice_proje/main.dart';
import 'package:hatice_proje/yeniKayit.dart';


class UyeGirisi extends StatefulWidget {
  const UyeGirisi({Key? key}) : super(key: key);

  @override
  State<UyeGirisi> createState() => _UyeGirisiState();
}

class _UyeGirisiState extends State<UyeGirisi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f2ec).withOpacity(0.85),
        title: const Text("Kullanıcı Girişi",
            style: TextStyle(
                fontFamily: 'Fondamento',
                fontSize: 24,
                color: Color(0xff6e4318),
                fontWeight: FontWeight.bold)
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff6e4318), size: 27),
          onPressed: ()
          {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const Anasayfa()));
          },
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets_/img/arkaplan4.jpg'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 4.0,
                  color: const Color(0xfff9f2ec).withOpacity(0.80),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          style: const TextStyle(color: Color(0xff6e4318)),
                          cursorColor: const Color(0xfff9f2ec),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                (BorderSide(color: Color(0xff6e4318)))),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xff6e4318),
                            ),
                            hintText: "E-Mail",
                            hintStyle: TextStyle(
                                color: Color(0xff6e4318), fontSize: 15, fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: const TextStyle(color: Color(0xff6e4318)),
                          cursorColor: const Color(0xfff9f2ec),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                (BorderSide(color: Color(0xff6e4318)))),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Color(0xff6e4318),
                            ),
                            hintText: "Şifre",
                            hintStyle: TextStyle(
                                color: Color(0xff6e4318), fontSize: 15,fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        RaisedButton(
                          color: const Color(0xff6e4318),
                          child: const Text(
                            "Giriş",
                            style: TextStyle(
                                color: Color(0xfff9f2ec),
                                fontSize: 20,
                                fontFamily: "Fondamento"),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Anasayfa()));
                          },
                        ),
                        const SizedBox(height: 10),
                        RaisedButton(
                          color: const Color(0xff6e4318),
                          child: const Text(
                            "Üye Ol",
                            style: TextStyle(
                                color: Color(0xfff9f2ec),
                                fontSize: 20,
                                fontFamily: "Fondamento"),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>const YeniKayit() ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),);
  }

}
