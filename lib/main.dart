import 'package:audioplayers/audioplayers.dart';
import 'package:dolmusproje2/contact.dart';
import 'package:dolmusproje2/databasehelper.dart';
import 'package:dolmusproje2/gecmisler.dart';
import 'package:dolmusproje2/gecmissuretakip.dart';
import 'package:dolmusproje2/yevme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';
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
        primarySwatch: Colors.indigo,
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  DatabaseHelper dh1 = DatabaseHelper();
  bool tekdokunus = false;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  CountdownController controller = CountdownController();
  //CustomTimerController customcontroller = CustomTimerController();
  //TimerController? _timercontroller;
  TimerController? _timerController;
  TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.both;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_up;
  @override
  void initState() {
    // _timercontroller = TimerController.seconds(50);
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  int dropdownValue = 1;
  int saniye = 0;
  int customsaniye = 0;
  int customdakika = 0;
  int simpledakika = 0;
  int simplesaniye = 0;
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
  List arabalistem2 = [];
  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => Gecmisler()));
              },
              leading: Icon(
                Icons.timeline,
                size: 35,
              ),
              title: Text("Geçmiş Takip",
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GecmisSureTakip()));
              },
              leading: Icon(
                Icons.time_to_leave,
                size: 35,
              ),
              title: Text("Geçmiş Süre Takip",
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF6190E8), Color(0xFFff9068)]),
            //0xFF1e3c72
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 3 / 100, top: height * 4 / 100),
                    child: ElevatedButton(
                        child: Text("Başlat"),
                        onPressed: () {
                          // customcontroller.reset();
                          // customcontroller.start();
                          _timerController!.restart();
                          _timerController!.start();
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 3 / 100, top: height * 4 / 100),
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.send),
                        label: Text("Postala"),
                        onPressed: () async {
                          if (arabalistem2.isNotEmpty) {
                            await dh1.gecmisplakaekle(
                                arabalistem2[0].toString(), gecensurehesapla());
                            setState(() {
                              arabalistem2.remove(arabalistem2[0]);
                            });
                          }
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
                    items: [
                      0,
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
                      15
                    ].map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: width * 2 / 100,
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
                      0,
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
                    width: width * 2 / 100,
                  ),

                  // Container(
                  //     width: 55,
                  //     height: 50,
                  //     child: SimpleTimer(
                  //       controller: _timerController,
                  //       duration: Duration(seconds: 10),
                  //     ))
                  //buildCountdown(),
                  Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: SimpleTimer(
                      duration: Duration(seconds: 1200),
                      controller: _timerController,
                      timerStyle: _timerStyle,
                      onStart: handleTimerOnStart,
                      onEnd: handleTimerOnEnd,
                      valueListener: timerValueChangeListener,
                      progressIndicatorColor: Colors.green,
                      progressIndicatorDirection: _progressIndicatorDirection,
                      progressTextCountDirection: _progressTextCountDirection,
                      progressTextStyle: TextStyle(color: Colors.black),
                      strokeWidth: 10,
                    ),
                  )
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
                    child: Text(tekdokunus == false
                        ? "çift dokunuşta"
                        : "tek dokunuşta"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //customcontroller.pause();
                      _timerController!.stop();
                      print("dakikamız: " +
                          simpledakika.toString() +
                          "saniyemiz: " +
                          simplesaniye.toString());
                    },
                    child: Text("Durdur"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // customcontroller.start();
                      _timerController!.start();
                    },
                    child: Text("Devam Ettir"),
                  ),
                ],
              ),
              Container(
                height: height * 75 / 100,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            itemCount: arabalistem.length,
                            itemBuilder: (BuildContext context, sira) {
                              return GestureDetector(
                                onDoubleTap: () async {
                                  if (tekdokunus == false) {
                                    if (arabalistem2
                                        .contains(arabalistem[sira])) {
                                      return null;
                                    } else {
                                      setState(() {
                                        arabalistem2.add(arabalistem[sira]);
                                      });
                                    }
                                  }
                                },
                                onTap: () {
                                  print(tekdokunus.toString());
                                  if (tekdokunus == true) {
                                    if (arabalistem2
                                        .contains(arabalistem[sira])) {
                                      return null;
                                    } else {
                                      setState(() {
                                        arabalistem2.add(arabalistem[sira]);
                                      });
                                    }
                                  }
                                },
                                child: ListTile(
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
                              onDoubleTap: () async {
                                await dh1.gecmisplakaekle(
                                    arabalistem2[0].toString(),
                                    gecensurehesapla());
                                setState(() {
                                  arabalistem2.remove(item);
                                });
                              },
                              child: ListTile(
                                  title: Center(
                                child: Text(item,
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 35)),
                              )),
                            )
                        ],
                        onReorder: (oldindex, newindex) {
                          setState(() {
                            if (newindex > oldindex) {
                              newindex -= 1;
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
      ),
    );
  }

  void handleTimerOnStart() async {
    await Future.delayed(Duration(seconds: dropdownValue * 60 + saniye - 20));
    if (arabalistem2.isNotEmpty) {
      // if (arabalistem2[0].toString() == "035") {
      //   audioCache.play("035.mp3").then((value) => _timerController!.start());
      // }
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
    }
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }

  int gecensurehesapla() {
    int sayi = simplesaniye - (dropdownValue * 60 + saniye);
    print(sayi.toString());
    return sayi;
  }

  void timerValueChangeListener(Duration timeElapsed) async {
    setState(() {
      simpledakika = timeElapsed.inMinutes;
      simplesaniye = timeElapsed.inSeconds;
    });
    print("simple dakika: " +
        simpledakika.toString() +
        "simple saniye: " +
        simplesaniye.toString());
  }

  // Countdown buildCountdown() {
  //   return Countdown(
  //     seconds: saniye + (dropdownValue * 60),
  //     controller: controller,
  //     interval: Duration(seconds: 1),
  //     onFinished: () async {
  //       print(arabalistem2.length.toString());
  //       if (arabalistem2[0].toString() == "035") {
  //         await audioCache.play("035.mp3");
  //       } else if (arabalistem2[0].toString() == "252") {
  //         await audioCache.play("252.mp3");
  //       } else if (arabalistem2[0].toString() == "283") {
  //         await audioCache.play("283.mp3");
  //       } else if (arabalistem2[0].toString() == "337") {
  //         await audioCache.play("337.mp3");
  //       } else if (arabalistem2[0].toString() == "370") {
  //         await audioCache.play("370.mp3");
  //       } else if (arabalistem2[0].toString() == "450") {
  //         await audioCache.play("450.mp3");
  //       } else if (arabalistem2[0].toString() == "477") {
  //         await audioCache.play("477.mp3");
  //       } else if (arabalistem2[0].toString() == "545") {
  //         await audioCache.play("545.mp3");
  //       } else if (arabalistem2[0].toString() == "601") {
  //         await audioCache.play("601.mp3");
  //       } else if (arabalistem2[0].toString() == "643") {
  //         await audioCache.play("643.mp3");
  //       } else if (arabalistem2[0].toString() == "670") {
  //         await audioCache.play("670.mp3");
  //       } else if (arabalistem2[0].toString() == "684") {
  //         await audioCache.play("684.mp3");
  //       } else if (arabalistem2[0].toString() == "690") {
  //         await audioCache.play("690.mp3");
  //       } else if (arabalistem2[0].toString() == "754") {
  //         await audioCache.play("754.mp3");
  //       } else if (arabalistem2[0].toString() == "770") {
  //         await audioCache.play("770.mp3");
  //       } else if (arabalistem2[0].toString() == "841") {
  //         await audioCache.play("841.mp3");
  //       } else if (arabalistem2[0].toString() == "844") {
  //         await audioCache.play("844.mp3");
  //       } else if (arabalistem2[0].toString() == "851") {
  //         await audioCache.play("851.mp3");
  //       } else if (arabalistem2[0].toString() == "965") {
  //         await audioCache.play("965.mp3");
  //       } else if (arabalistem2[0].toString() == "1032") {
  //         await audioCache.play("1032.mp3");
  //       } else if (arabalistem2[0].toString() == "359") {
  //         await audioCache.play("359.mp3");
  //       } else if (arabalistem2[0].toString() == "852") {
  //         await audioCache.play("852.mp3");
  //       } else if (arabalistem2[0].toString() == "853") {
  //         await audioCache.play("853.mp3");
  //       } else if (arabalistem2[0].toString() == "918") {
  //         await audioCache.play("918.mp3");
  //       } else if (arabalistem2[0].toString() == "920") {
  //         await audioCache.play("920.mp3");
  //       }

  //       if (arabalistem2.length >= 1) {
  //         await dh1.gecmisplakaekle(arabalistem2[0].toString());
  //         setState(() {
  //           arabalistem2.removeAt(0);
  //         });
  //       }
  //       if (arabalistem2.length == 0) {
  //         controller.pause();
  //       }
  //     },
  //     build: (BuildContext context, double sec) {
  //       return Center(
  //         child: Text(
  //           sec.toString(),
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       );
  //     },
  //   );
  // }
}
