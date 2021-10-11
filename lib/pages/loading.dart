import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String orderedTime = 'Loading';

  void getTime() async {
    Time time =
        Time(location: 'Cairo', flag: 'assets/Egypt.png', url: 'Europe/London');
    await time.getTime();
    setState(() {
      orderedTime = time.time;
    });
  }

  @override
  void initState() {
    super.initState();

    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            orderedTime,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
