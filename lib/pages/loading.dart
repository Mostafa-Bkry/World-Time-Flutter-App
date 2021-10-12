import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Time time =
        Time(location: 'Cairo', flag: 'assets/Egypt.png', url: 'Africa/Cairo');
    await time.getTime();
    Navigator.of(context).pushReplacementNamed('/home', arguments: {
      'location': time.location,
      'flag': time.flag,
      'time': time.time,
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
      backgroundColor: Colors.red[800],
      body: const SafeArea(
        child: Center(
          child: SpinKitDancingSquare(
            color: Colors.white,
            size: 90,
          ),
        ),
      ),
    );
  }
}
