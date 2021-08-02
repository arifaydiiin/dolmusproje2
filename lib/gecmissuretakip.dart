import 'package:dolmusproje2/databasehelper.dart';
import 'package:dolmusproje2/models/plakalar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class GecmisSureTakip extends StatefulWidget {
  const GecmisSureTakip({Key? key}) : super(key: key);

  @override
  _GecmisSureTakipState createState() => _GecmisSureTakipState();
}

class _GecmisSureTakipState extends State<GecmisSureTakip> {
  DatabaseHelper dh1 = DatabaseHelper();
  TextEditingController _controller = TextEditingController();
  List items = [];
  var p1,
      p2,
      p3,
      p4,
      p5,
      p6,
      p7,
      p8,
      p9,
      p10,
      p11,
      p12,
      p13,
      p14,
      p15,
      p16,
      p17,
      p18,
      p19,
      p20,
      p21,
      p22,
      p23,
      p24,
      p25;
  Future verileritopla() async {
    p1 = await dh1.plakaverigetir("035");
    items.add(p1);
    p2 = await dh1.plakaverigetir("252");
    items.add(p1);
    p3 = await dh1.plakaverigetir("283");
    items.add(p1);
    p4 = await dh1.plakaverigetir("337");
    items.add(p1);
    p5 = await dh1.plakaverigetir("359");
    items.add(p1);
    p6 = await dh1.plakaverigetir("370");
    items.add(p1);
    p7 = await dh1.plakaverigetir("450");
    items.add(p1);
    p8 = await dh1.plakaverigetir("477");
    items.add(p1);
    p9 = await dh1.plakaverigetir("545");
    items.add(p1);
    p10 = await dh1.plakaverigetir("601");
    items.add(p1);
    p11 = await dh1.plakaverigetir("643");
    items.add(p1);
    p12 = await dh1.plakaverigetir("670");
    items.add(p1);
    p13 = await dh1.plakaverigetir("684");
    items.add(p1);
    p14 = await dh1.plakaverigetir("690");
    items.add(p1);
    p15 = await dh1.plakaverigetir("754");
    items.add(p1);
    p16 = await dh1.plakaverigetir("770");
    items.add(p1);
    p17 = await dh1.plakaverigetir("841");
    items.add(p1);
    p18 = await dh1.plakaverigetir("844");
    items.add(p1);
    p19 = await dh1.plakaverigetir("851");
    items.add(p1);
    p20 = await dh1.plakaverigetir("852");
    items.add(p1);
    p21 = await dh1.plakaverigetir("853");
    items.add(p1);
    p22 = await dh1.plakaverigetir("918");
    items.add(p1);
    p23 = await dh1.plakaverigetir("920");
    items.add(p1);
    p24 = await dh1.plakaverigetir("965");
    p25 = await dh1.plakaverigetir("1032");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    dh1.tablosil();
                  });
                },
                icon: Icon(Icons.delete))
          ],
          title: Text("Geçmiş Süre Takip"),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: verileritopla(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(p1 == -999
                          ? "035 veri yok"
                          : "035 plakanın geçikmesi: " + p1.toString()),
                    ),
                    ListTile(
                      title: Text(p2 == -999
                          ? "252 veri yok"
                          : "252 plakanın geçikmesi: " + p2.toString()),
                    ),
                    ListTile(
                      title: Text(p3 == -999
                          ? "283 veri yok"
                          : "283 plakanın geçikmesi: " + p3.toString()),
                    ),
                    ListTile(
                      title: Text(p4 == -999
                          ? "337 veri yok"
                          : "337 plakanın geçikmesi: " + p4.toString()),
                    ),
                    ListTile(
                      title: Text(p5 == -999
                          ? "359 veri yok"
                          : "359 plakanın geçikmesi: " + p5.toString()),
                    ),
                    ListTile(
                      title: Text(p6 == -999
                          ? "370 veri yok"
                          : "370 plakanın geçikmesi: " + p6.toString()),
                    ),
                    ListTile(
                      title: Text(p7 == -999
                          ? "450 veri yok"
                          : "450 plakanın geçikmesi: " + p7.toString()),
                    ),
                    ListTile(
                      title: Text(p8 == -999
                          ? "477 veri yok"
                          : "477 plakanın geçikmesi: " + p8.toString()),
                    ),
                    ListTile(
                      title: Text(p9 == -999
                          ? "545 veri yok"
                          : "545 plakanın geçikmesi: " + p9.toString()),
                    ),
                    ListTile(
                      title: Text(p10 == -999
                          ? "601 veri yok"
                          : "601 plakanın geçikmesi: " + p10.toString()),
                    ),
                    ListTile(
                      title: Text(p11 == -999
                          ? "643 veri yok"
                          : "643 plakanın geçikmesi: " + p11.toString()),
                    ),
                    ListTile(
                      title: Text(p12 == -999
                          ? "670 veri yok"
                          : "670 plakanın geçikmesi: " + p12.toString()),
                    ),
                    ListTile(
                      title: Text(p13 == -999
                          ? "684 veri yok"
                          : "684 plakanın geçikmesi: " + p13.toString()),
                    ),
                    ListTile(
                      title: Text(p14 == -999
                          ? "690 veri yok"
                          : "690 plakanın geçikmesi: " + p14.toString()),
                    ),
                    ListTile(
                      title: Text(p15 == -999
                          ? "754 veri yok"
                          : "754 plakanın geçikmesi: " + p15.toString()),
                    ),
                    ListTile(
                      title: Text(p16 == -999
                          ? "770 veri yok"
                          : "770 plakanın geçikmesi: " + p16.toString()),
                    ),
                    ListTile(
                      title: Text(p17 == -999
                          ? "841 veri yok"
                          : "841 plakanın geçikmesi: " + p17.toString()),
                    ),
                    ListTile(
                      title: Text(p18 == -999
                          ? "844 veri yok"
                          : "844 plakanın geçikmesi: " + p18.toString()),
                    ),
                    ListTile(
                      title: Text(p19 == -999
                          ? "851 veri yok"
                          : "851 plakanın geçikmesi: " + p19.toString()),
                    ),
                    ListTile(
                      title: Text(p20 == -999
                          ? "852 veri yok"
                          : "852 plakanın geçikmesi: " + p20.toString()),
                    ),
                    ListTile(
                      title: Text(p21 == -999
                          ? "853 veri yok"
                          : "853 plakanın geçikmesi: " + p21.toString()),
                    ),
                    ListTile(
                      title: Text(p22 == -999
                          ? "918 veri yok"
                          : "918 plakanın geçikmesi: " + p22.toString()),
                    ),
                    ListTile(
                      title: Text(p23 == -999
                          ? "920 veri yok"
                          : "920 plakanın geçikmesi: " + p23.toString()),
                    ),
                    ListTile(
                      title: Text(p24 == -999
                          ? "965 veri yok"
                          : "965 plakanın geçikmesi: " + p24.toString()),
                    ),
                    ListTile(
                      title: Text(p25 == -999
                          ? "1032 veri yok"
                          : "1032 plakanın geçikmesi: " + p25.toString()),
                    ),
                  ],
                );
              }),
        ));
  }
}
