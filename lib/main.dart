// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CounterDownApp(),
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({super.key});

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  int numberOfSecond = 7;
  Timer? timeCounter;
  countdown() {
    timeCounter = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (numberOfSecond > 0) {
          numberOfSecond--;
        } else {
          timer.cancel();
        }
      });
    });
  }

//this function is for cancel timer
  stopTimer() {
    setState(() {
      if (timeCounter!.isActive) {
        timeCounter!.cancel();
      }
    });
  }

  String secondsText() {
    String titel;
    if (numberOfSecond == 0) {
      titel = "";
    } else if (numberOfSecond == 1) {
      titel = "Second";
    } else {
      titel = "Seconds";
    }
    return titel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              numberOfSecond == 0
                  ? "👌"
                  : numberOfSecond.toString().padLeft(2, "0"),
              style: TextStyle(
                  color: Colors.white, fontSize: numberOfSecond == 0 ? 40 : 68),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              secondsText(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    countdown();
                    if (numberOfSecond == 0) {
                      setState(() {
                        numberOfSecond = 7;
                      });
                    }
                  },
                  child: Text(
                    "Start Timer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.pink.shade400),
                  ),
                  onPressed: () {
                    stopTimer();
                  },
                  child: Text(
                    "Stop Timer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
