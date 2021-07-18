import 'package:audioplayers/audioplayers.dart';
import 'package:dolmusproje2/contact.dart';
import 'package:dolmusproje2/yevme.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool tekdokunus = false;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  CountdownController controller = CountdownController();
  int dropdownValue = 0;
  int saniye = 10;
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
  List arabalistem2 = [

  ];
  @override
  Widget build(BuildContext context) {
    print("aaaa");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Text("Dolmuş Takip",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Yevme()));
              },
              leading: Icon(
                Icons.add,
                size: 35,
              ),
              title: Text("Günlük Yevme",
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Contact()));
              },
              leading: Icon(
                Icons.contact_mail,
                size: 35,
              ),
              title: Text("Destek",
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Dolmuş"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 4 / 100, top: height * 4 / 100),
                  child: ElevatedButton(
                      child: Text("Başlat"),
                      onPressed: () {
                        controller.restart();
                      }),
                ),
                SizedBox(
                  width: 20,
                ),
                DropdownButton<int>(
                  iconSize: 24,
                  value: dropdownValue,
                  elevation: 24,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: width * 3 / 100,
                ),
                DropdownButton<int>(
                  iconSize: 30,
                  value: saniye,
                  elevation: 24,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (value) {
                    setState(() {
                      saniye = value!;
                    });
                  },
                  // onChanged: (int newValue) {
                  //   setState(() {
                  //     saniye = newValue;
                  //   });
                  // },
                  items: <int>[
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    10,
                    11,
                    12,
                    13,
                    14,
                    15,
                    16,
                    17,
                    18,
                    19,
                    20,
                    21,
                    22,
                    23,
                    24,
                    25,
                    26,
                    27,
                    28,
                    29,
                    30,
                    31,
                    32,
                    33,
                    34,
                    35,
                    36,
                    37,
                    38,
                    39,
                    40,
                    41,
                    42,
                    43,
                    44,
                    45,
                    50,
                    55,
                  ].map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: width * 5 / 100,
                ),
                Text("Kalan Süre:", style: TextStyle(fontSize: 20)),
                buildCountdown(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (tekdokunus == true) {
                      setState(() {
                        tekdokunus = false;
                      });
                    } else {
                      setState(() {
                        tekdokunus = true;
                      });
                    }
                  },
                  child: Text(
                      tekdokunus == false ? "çift dokunuşta" : "tek dokunuşta"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.pause();
                  },
                  child: Text("Durdur"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.resume();
                  },
                  child: Text("Devam Ettir"),
                ),
              ],
            ),
            Container(
              height: 500,
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: arabalistem.length,
                          itemBuilder: (BuildContext context, sira) {
                            return GestureDetector(
                              onDoubleTap: () {
                                if (tekdokunus == false) {
                                  if(arabalistem2.contains(arabalistem[sira]))
                                  {
                                    return null;
                                  }
                                  else{
                                    setState(() {
                                      arabalistem2.add(arabalistem[sira]);
                                    });
                                  }
                                }
                              },
                              onTap: () {
                                print(tekdokunus.toString());
                                if (tekdokunus == true) {
                                  if(arabalistem2.contains(arabalistem[sira]))
                                    {
                                      return null;
                                    }
                                  else{
                                    setState(() {
                                      arabalistem2.add(arabalistem[sira]);
                                    });
                                  }
                                }
                              },
                              child: ListTile(
                                  tileColor: Colors.green,
                                  title: Center(
                                    child: Text(arabalistem[sira],
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 35)),
                                  )),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: ReorderableListView(
                      children: [
                        for (final item in arabalistem2)
                          GestureDetector(
                            key: ValueKey(item),
                            onDoubleTap: () {
                              setState(() {
                                arabalistem2.remove(item);
                              });
                            },
                            child: ListTile(
                                tileColor: Colors.blue,
                                title: Center(
                                  child: Text(item,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 35)),
                                )),
                          )
                      ],
                      onReorder: (oldindex, newindex) {
                        setState(() {
                          if(newindex>oldindex)
                          {
                            newindex-=1;
                          }
                          final item = arabalistem2.removeAt(oldindex);
                          arabalistem2.insert(newindex, item);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Countdown buildCountdown() {
    return Countdown(
      seconds: saniye + (dropdownValue * 60),
      controller: controller,
      interval: Duration(seconds: 1),
      onFinished: () async {
        print(arabalistem2.length.toString());
        if (arabalistem2[0].toString() == "035") {
          await audioCache.play("035.mp3");
        } else if (arabalistem2[0].toString() == "252") {
          await audioCache.play("252.mp3");
        } else if (arabalistem2[0].toString() == "283") {
          await audioCache.play("283.mp3");
        } else if (arabalistem2[0].toString() == "337") {
          await audioCache.play("337.mp3");
        } else if (arabalistem2[0].toString() == "370") {
          await audioCache.play("370.mp3");
        } else if (arabalistem2[0].toString() == "450") {
          await audioCache.play("450.mp3");
        } else if (arabalistem2[0].toString() == "477") {
          await audioCache.play("477.mp3");
        } else if (arabalistem2[0].toString() == "545") {
          await audioCache.play("545.mp3");
        } else if (arabalistem2[0].toString() == "601") {
          await audioCache.play("601.mp3");
        } else if (arabalistem2[0].toString() == "643") {
          await audioCache.play("643.mp3");
        } else if (arabalistem2[0].toString() == "670") {
          await audioCache.play("670.mp3");
        } else if (arabalistem2[0].toString() == "684") {
          await audioCache.play("684.mp3");
        } else if (arabalistem2[0].toString() == "690") {
          await audioCache.play("690.mp3");
        } else if (arabalistem2[0].toString() == "754") {
          await audioCache.play("754.mp3");
        } else if (arabalistem2[0].toString() == "770") {
          await audioCache.play("770.mp3");
        } else if (arabalistem2[0].toString() == "841") {
          await audioCache.play("841.mp3");
        } else if (arabalistem2[0].toString() == "844") {
          await audioCache.play("844.mp3");
        } else if (arabalistem2[0].toString() == "851") {
          await audioCache.play("851.mp3");
        } else if (arabalistem2[0].toString() == "965") {
          await audioCache.play("965.mp3");
        } else if (arabalistem2[0].toString() == "1032") {
          await audioCache.play("1032.mp3");
        } else if (arabalistem2[0].toString() == "359") {
          await audioCache.play("359.mp3");
        } else if (arabalistem2[0].toString() == "852") {
          await audioCache.play("852.mp3");
        } else if (arabalistem2[0].toString() == "853") {
          await audioCache.play("853.mp3");
        } else if (arabalistem2[0].toString() == "918") {
          await audioCache.play("918.mp3");
        } else if (arabalistem2[0].toString() == "920") {
          await audioCache.play("920.mp3");
        }

        if (arabalistem2.length >= 1) {
          setState(() {
            arabalistem2.removeAt(0);
          });
        }
        if (arabalistem2.length == 0) {
          controller.pause();
        }

        controller.restart();
      },
      build: (BuildContext context, double sec) {
        return Center(
          child: Text(
            sec.toString(),
            style: TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }
}
