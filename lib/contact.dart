import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  openwhatsapp() async {
    var whatsapp = "+905422504931";
    var whatsappURl_android = "whatsapp://send?phone=" +
        whatsapp +
        "&text=Merhaba Dolmus uygulaması için desteğe ihtiyacım var";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      }
    } else {
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        print("whatsapp hata");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Whatsapp Bulunamadı."),
                title: Text("Hata"),
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İletişim Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "İletişim: 0542 250 4931",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Arif Aydın",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  openwhatsapp();
                },
                icon: Icon(Icons.send_to_mobile),
                label: Text("Whatsapp için tıklayınız."))
          ],
        ),
      ),
    );
  }
}
