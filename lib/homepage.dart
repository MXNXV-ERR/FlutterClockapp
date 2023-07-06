import 'package:clockapp/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var fTime = DateFormat('jm').format(now);
    var fDate = DateFormat('EEE,d MMM').format(now);
    var timezoneStr = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneStr.toString().startsWith('-')) offsetSign = '+';
    print(offsetSign + timezoneStr);

    return Scaffold(
      backgroundColor: Color(0xff2d2f41),
      body: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildMenuButtons('Clock', 'assets/logo.png'),
                buildMenuButtons('Alram', 'assets/alram.png'),
                buildMenuButtons('Timer', 'assets/timer.png')
              ],
            ),
            const VerticalDivider(
              color: Colors.white10,
              width: 2,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                color: const Color(0XFF2d2f41),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        'Clock',
                        style: TextStyle(color: Colors.white70, fontSize: 50),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fTime,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 40),
                          ),
                          Text(
                            fDate,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(child: ClockView()))),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Timezone',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 25,
                                ),
                              ),
                              Row(children: [
                                Icon(
                                  Icons.language,
                                  color: Colors.white,
                                ),
                                Text('  UTC' + offsetSign + timezoneStr,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ])
                            ]))
                  ],
                ),
              ),
            ),
          ],
        ),
        // child: Container(
        //   padding: const EdgeInsets.all(20),
        //   alignment: Alignment.center,
        //   color: const Color(0XFF2d2f41),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       const Text(
        //         'Clock',
        //         style: TextStyle(color: Colors.white70, fontSize: 50),
        //       ),
        //       Text(
        //         fTime,
        //         style: const TextStyle(color: Colors.white, fontSize: 40),
        //       ),
        //       Text(
        //         fDate,
        //         style: const TextStyle(color: Colors.white, fontSize: 20),
        //       ),
        //       const ClockView(),
        //       const Text(
        //         'Timezone',
        //         style: TextStyle(
        //           color: Colors.white70,
        //           fontSize: 25,
        //         ),
        //       ),
        //       Row(children: [
        //         Icon(
        //           Icons.language,
        //           color: Colors.white,
        //         ),
        //         Text('  UTC' + offsetSign + timezoneStr,
        //             style: TextStyle(color: Colors.white, fontSize: 20)),
        //       ])
        //     ],
        //   ),
        // ),
      ),
    );
  }

  TextButton buildMenuButtons(String title, String image) {
    return TextButton(
      onPressed: () {},
      child: Column(
        children: [
          Image.asset(
            image,
            scale: 15,
          ),
          Text(title)
        ],
      ),
    );
  }
}
