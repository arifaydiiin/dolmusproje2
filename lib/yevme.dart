import 'package:dolmusproje2/databasehelper.dart';
import 'package:dolmusproje2/models/plakalar.dart';
import "package:flutter/material.dart";
import 'package:sqflite/sqflite.dart';

class Yevme extends StatefulWidget {
  Yevme({Key? key}) : super(key: key);

  @override
  _YevmeState createState() => _YevmeState();
}

class _YevmeState extends State<Yevme> {
  List arabalistem = [
    "035",
    "252",
    "283",
    "337",
    "359",
    "370",
    "450",
    "477",
    "545",
    "601",
    "643",
    "670",
    "684",
    "690",
    "754",
    "770",
    "841",
    "844",
    "851",
    "852",
    "853",
    "918",
    "920",
    "965",
    "1032",
  ];
  DatabaseHelper dh1 = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    dh1.tumplakalar().then((value) {
      int? sayi = value?.length;
      print(value?.length.toString());
      if (sayi! < 1) {
        dh1.plakaekle(Plakalar.withID(1, "035", 0));
        dh1.plakaekle(Plakalar.withID(2, "252", 0));
        dh1.plakaekle(Plakalar.withID(3, "283", 0));
        dh1.plakaekle(Plakalar.withID(4, "337", 0));
        dh1.plakaekle(Plakalar.withID(5, "359", 0));
        dh1.plakaekle(Plakalar.withID(6, "370", 0));
        dh1.plakaekle(Plakalar.withID(7, "450", 0));
        dh1.plakaekle(Plakalar.withID(8, "477", 0));
        dh1.plakaekle(Plakalar.withID(9, "545", 0));
        dh1.plakaekle(Plakalar.withID(10, "601", 0));
        dh1.plakaekle(Plakalar.withID(11, "643", 0));
        dh1.plakaekle(Plakalar.withID(12, "670", 0));
        dh1.plakaekle(Plakalar.withID(13, "684", 0));
        dh1.plakaekle(Plakalar.withID(14, "690", 0));
        dh1.plakaekle(Plakalar.withID(15, "754", 0));
        dh1.plakaekle(Plakalar.withID(16, "770", 0));
        dh1.plakaekle(Plakalar.withID(17, "841", 0));
        dh1.plakaekle(Plakalar.withID(18, "844", 0));
        dh1.plakaekle(Plakalar.withID(19, "851", 0));
        dh1.plakaekle(Plakalar.withID(20, "852", 0));
        dh1.plakaekle(Plakalar.withID(21, "853", 0));
        dh1.plakaekle(Plakalar.withID(22, "918", 0));
        dh1.plakaekle(Plakalar.withID(23, "920", 0));
        dh1.plakaekle(Plakalar.withID(24, "965", 0));
        dh1.plakaekle(Plakalar.withID(25, "1032", 0));
        setState(() {});
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Yevmeler"),
        actions: [
          IconButton(
              onPressed: () {
                for (int i = 1; i < 26; i++) {
                  dh1.plakaguncelle(Plakalar.withID(i, arabalistem[i - 1], 0));
                }
                setState(() {});
              },
              icon: Icon(Icons.cleaning_services_outlined))
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>?>?>(
        future: plakalarigetir(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var veriler = snapshot.data![index]!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 35 / 100,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: snapshot.data![index]!["ver"] == 0
                                ? MaterialStateProperty.all(Colors.red)
                                : MaterialStateProperty.all(Colors.green),
                          ),
                          onPressed: () async {
                            await dh1.plakaguncelle(Plakalar.withID(
                                veriler["id"],
                                veriler["plakaadi"],
                                veriler["ver"] == 1 ? 0 : 1));
                            setState(() {});
                          },
                          child: Text(
                              snapshot.data![index]!["plakaadi"].toString()),
                        ),
                      ),
                    ],
                  );
                });
          }
          return Text("ilginç");
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>?>?> plakalarigetir() async {
    var sonuc = await dh1.tumplakalar();

    return sonuc;
  }
}
/*
ElevatedButton(
style: ButtonStyle(
backgroundColor: yevme035 == false ? MaterialStateProperty.all(Colors.red)
: MaterialStateProperty.all(Colors.green),
),
onPressed: () async{

},
child: Text("035"),
),


ListTile(
                    title: Text(snapshot.data![0]!["plakaadi"].toString()),
                  );


*/

/*
 FutureBuilder(
          future: verigetir(),
          builder: (context,snapshot){
            if(!snapshot.hasData)
              {
                return Center(child: CircularProgressIndicator(),);
              }
            if(snapshot.hasData)
              {
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        await veriyaz();
                        setState(() {

                        });
                      },
                      child: Text("035"),
                    ),
                    Text(snapshot.data.toString()),
                  ],
                );
              }
            return Text("ilginç");
          },
        ),
*/
/*
 dh1.plakaekle(Plakalar.withID(1, "035",0));
    dh1.plakaekle(Plakalar.withID(2, "252",0));
    dh1.plakaekle(Plakalar.withID(3, "283",0));
    dh1.plakaekle(Plakalar.withID(4, "337",0));
    dh1.plakaekle(Plakalar.withID(5, "359",0));
    dh1.plakaekle(Plakalar.withID(6, "370",0));
    dh1.plakaekle(Plakalar.withID(7, "450",0));
    dh1.plakaekle(Plakalar.withID(8, "477",0));
    dh1.plakaekle(Plakalar.withID(9, "545",0));
    dh1.plakaekle(Plakalar.withID(10, "601",0));
    dh1.plakaekle(Plakalar.withID(11, "643",0));
    dh1.plakaekle(Plakalar.withID(12, "670",0));
    dh1.plakaekle(Plakalar.withID(13, "684",0));
    dh1.plakaekle(Plakalar.withID(14, "690",0));
    dh1.plakaekle(Plakalar.withID(15, "754",0));
    dh1.plakaekle(Plakalar.withID(16, "770",0));
    dh1.plakaekle(Plakalar.withID(17, "841",0));
    dh1.plakaekle(Plakalar.withID(18, "844",0));
    dh1.plakaekle(Plakalar.withID(19, "851",0));
    dh1.plakaekle(Plakalar.withID(20, "852",0));
    dh1.plakaekle(Plakalar.withID(21, "853",0));
    dh1.plakaekle(Plakalar.withID(22, "918",0));
    dh1.plakaekle(Plakalar.withID(23, "920",0));
    dh1.plakaekle(Plakalar.withID(24, "965",0));
    dh1.plakaekle(Plakalar.withID(25, "1032",0));

 */
