import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool loaded = false;

  void getTime() async {
    Time time =
        Time(location: 'Cairo', flag: 'assets/Egypt.png', url: 'Europe/London');
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
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(Icons.refresh, size: 50),
        ),
      ),
    );
  }
}
