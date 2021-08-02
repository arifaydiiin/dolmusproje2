import 'package:dolmusproje2/databasehelper.dart';
import 'package:flutter/material.dart';

class Gecmisler extends StatefulWidget {
  Gecmisler({Key? key}) : super(key: key);

  @override
  _GecmislerState createState() => _GecmislerState();
}

class _GecmislerState extends State<Gecmisler> {
  DatabaseHelper dh1 = DatabaseHelper();
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Geçmişler"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Map<String, dynamic>?>?>(
            future: dh1.gecmistumplakalar(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Henüz veri yok"),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Veri getirilirken hata oluştu"),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var veriler = snapshot.data![index]!;

                    // List list = snapshot.data![index]!.values.toList();
                    // list.sort((a, b) => b["time"].compareTo(a["time"]));
                    // var veriler2 = list;
                    return ListTile(
                      title: Text("plaka:" + veriler["plakaadi"]),
                      subtitle: Text("çıkış:" + veriler["time"]),
                      trailing: Text("Geç çıktığı süre " +
                          veriler["lasttime"] +
                          " saniye"),
                    );
                  });
            }),
      ),
    );
  }
}
