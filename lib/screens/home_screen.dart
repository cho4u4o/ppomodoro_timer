import 'package:flutter/material.dart';
import 'package:ppomodoro_timer/time_button.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRunning = false;
  int totalSeconds = 1500;
  int totalPomodoros = 0;
  int totalGoals = 0;
  late Timer timer; // initiate later

  void onClick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        if (totalPomodoros <= 4) {
          totalPomodoros = totalPomodoros + 1;
        } else {
          totalGoals = totalGoals + 1;
          totalPomodoros = 0;
        }
        isRunning = false;
        totalSeconds = 1500;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
        const Duration(seconds: 1), onClick); // periodically activate {}, 주기마다
    setState(() {
      isRunning = true;
    });
  } // 괄호는 넣을 필요가 없음 -> 괄호 넣으면 즉시실행의미

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = 1500;
    });
  }

  void onButton(int time) {
    setState(() {
      isRunning = false;
      timer.cancel();
      totalSeconds = time * 60;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7); //우와!!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'POMOTIMER',
                  style: TextStyle(
                    fontFamily: "Syne",
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.7),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).cardColor.withOpacity(0.7),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      format(totalSeconds),
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 50,
                        fontFamily: "Syne",
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TimeButton(
                          time: 1,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 10,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 15,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 20,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 25,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 30,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 35,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 40,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 45,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 50,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                        TimeButton(
                          time: 55,
                          onPressed: onButton,
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(isRunning
                          ? Icons.pause_sharp
                          : Icons.play_arrow_sharp),
                      iconSize: 60,
                      color: Theme.of(context).cardColor,
                    ),
                    IconButton(
                      onPressed: onResetPressed,
                      icon: const Icon(Icons.restart_alt_sharp),
                      iconSize: 60,
                      color: Theme.of(context).cardColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(0.9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "$totalPomodoros",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: "Syne",
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "/4",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: "Syne",
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "ROUND",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Syne",
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "$totalGoals",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: "Syne",
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color!,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "/12",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: "Syne",
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "GOAL",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Syne",
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color!,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
