import 'package:control/view/widgets/change_counter.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 800.0,
              // height: 500.0,
              // padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10.0,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChangeCounter(isLevel: false, isOn: isOn),
                  ChangeCounter(
                    isLevel: true,
                    isOn: isOn,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          LottieBuilder.network(
                            'https://assets1.lottiefiles.com/packages/lf20_xkty0q8r.json',
                            height: 200.0,
                            width: 200.0,
                          ),
                          LottieBuilder.network(
                            'https://assets1.lottiefiles.com/packages/lf20_uwngqzsb.json',
                            height: 200.0,
                            width: 200.0,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            isOn = true;
                          });
                        },
                        child: Text(
                          'ON',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            isOn = false;
                          });
                        },
                        child: Text(
                          'OFF',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
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
    );
  }
}
