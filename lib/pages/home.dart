import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // print(ModalRoute.of(context)!.settings.arguments);
    data = ModalRoute.of(context)!.settings.arguments as Map;
    // print(data['location']);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
          child: Column(
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.red[800]),
                ),
                onPressed: () => Navigator.of(context).pushNamed('/location'),
                icon: const Icon(
                  Icons.location_on,
                  size: 35,
                ),
                label: const Text(
                  'Edit Location',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['flag']),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    data['location'],
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: const TextStyle(fontSize: 55),
              )
            ],
          ),
        ),
      ),
    );
  }
}
