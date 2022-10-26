import 'package:flutter/material.dart';
import 'package:hatice_proje/main.dart';

class YeniKayit extends StatefulWidget {
  const YeniKayit({Key? key}) : super(key: key);

  @override
  State<YeniKayit> createState() => _YeniKayitState();
}

class _YeniKayitState extends State<YeniKayit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff9f2ec).withOpacity(0.85),
        title: Text("Üye Kayıt",
            style: TextStyle(
                fontFamily: 'Fondamento',
                fontSize: 24,
                color: Color(0xff6e4318),
                fontWeight: FontWeight.bold)
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff6e4318), size: 27),
          onPressed: ()
          {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Anasayfa()));
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
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
                color: Color(0xfff9f2ec).withOpacity(0.80),
                margin: EdgeInsets.only(left: 20, right: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Color(0xff6e4318)),
                        cursorColor: Color(0xff6e4318),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              (BorderSide(color: Color(0xff6e4318)))),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff6e4318),
                          ),
                          hintText: "Adı Soyadı",
                          hintStyle: TextStyle(
                              color: Color(0xff6e4318), fontSize: 15, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        style: TextStyle(color: Color(0xff6e4318)),
                        cursorColor: Color(0xfff9f2ec),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
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
                      SizedBox(height: 12),
                      TextFormField(
                        style: TextStyle(color: Color(0xff6e4318)),
                        cursorColor: Color(0xfff9f2ec),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
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
                      SizedBox(height: 25),
                      RaisedButton(
                        color: Color(0xff6e4318),
                        child: Text(
                          "Kaydet",
                          style: TextStyle(
                              color: Color(0xfff9f2ec),
                              fontSize: 20,
                              fontFamily: "Fondamento"),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Anasayfa()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
