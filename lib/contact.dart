import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

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
            Text("İletişim: 0542 250 4931",style: TextStyle(fontSize: 25),),
            Text("Arif Aydın",style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
