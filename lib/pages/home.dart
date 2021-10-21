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
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    // print(data['location']);
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night5.jpeg';
    Color? bgColor = data['isDayTime'] ? Colors.yellow[900] : Colors.black12;
    Color? locationColor =
        data['isDayTime'] ? Colors.black54 : Colors.grey[300];
    Color? buttonColor =
        data['isDayTime'] ? Colors.yellow[900] : Colors.blue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 180.0, 0.0, 0.0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(10),
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () async {
                    dynamic result =
                        await Navigator.of(context).pushNamed('/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime']
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.location_on,
                    size: 35,
                  ),
                  label: const Text(
                    'Edit Location',
                    style: TextStyle(
                      fontSize: 20,
                      shadows: [Shadow(color: Colors.white, blurRadius: 7)],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(data['flag']),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30,
                        color: locationColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: const TextStyle(fontSize: 75, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
