import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController yourName = new TextEditingController();
  TextEditingController partnerName = new TextEditingController();
  GifController controller;
  String firstName;
  String secondName;
  String finalllscore = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void erase() {
    yourName.clear();
    partnerName.clear();
    controller.animateTo(0);
    finalllscore = "";
  }

  String calculation({String firstName, String secondName}) {
    int finalScore;
    List<String> firstList = firstName.toLowerCase().split('');
    List<String> secondList = secondName.toLowerCase().split('');

//making complete word "firstName + loves + second name"
    List<String> magicWord = firstList + "loves".split('') + secondList;
    print(magicWord);
//Counting occurence of letters and storing them into map
    var nameMap = new Map();
    magicWord.forEach((f) {
      nameMap.containsKey(f) ? nameMap[f]++ : nameMap[f] = 1;
    });

    print(nameMap.values);
// adding all occurances to list
    List magicCode = nameMap.values.toList();

    print(magicCode);
    List score;
//repeating calculation until we get magicCode.length of 2
    while (magicCode.length > 2) {
      score = _calculate(magicCode);
      magicCode = score;
      print(score);
    }
//   print(magicCode);
    finalScore = magicCode[0] * 10 + magicCode[1];
    print(finalScore);
    finalllscore = finalScore.toString() + "%";
    controller.animateTo(finalScore / 2.28);
  }

//calculation in loop
  List _calculate(List magicCode) {
    int countSum;
    List score = new List();
    do {
      countSum = magicCode.first + magicCode.last;
      if (countSum > 9) countSum -= 9;
      score.add(countSum);
      magicCode.removeLast();
      magicCode.removeAt(0);
    } while (magicCode.length >= 2);
    print(magicCode);
    if (magicCode.isNotEmpty) {
      score.add(magicCode.first);
    }
    return score;
  }

  animate() {
    controller =
        GifController(vsync: this, duration: Duration(milliseconds: 100));
    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Love Meter",
        ),
        backgroundColor: Colors.pink,
        toolbarHeight: 40,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white, Colors.pink[100]])),
          ),
          Container(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 25.0),
                GifImage(
                  height: MediaQuery.of(context).size.height / 4,
                  controller: controller,
                  image: AssetImage("assets/gifs/metergif.gif"),
                ),
                SizedBox(height: 35.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: yourName,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                    ],
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: partnerName,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                    ],
                    decoration: InputDecoration(
                      hintText: 'Enter your parterner\'s name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 150,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          splashColor: Colors.pink,
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            if (yourName.text.isNotEmpty &&
                                partnerName.text.isNotEmpty &&
                                yourName.text != " " &&
                                partnerName.text != " ") {
                              firstName = yourName.text;
                              secondName = partnerName.text;
                              calculation(
                                  firstName: firstName, secondName: secondName);
                            } else {}
                          }),
                      decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              Colors.pink,
                              Colors.purple,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          splashColor: Colors.pink,
                          child: Text(
                            'Clear',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: erase),
                      decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.brown,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      '$finalllscore',
                      style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
