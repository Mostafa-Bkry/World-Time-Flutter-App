import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Time> locationsData = [
    Time(location: 'Cairo', flag: 'assets/flags/egy.jpg', url: 'Africa/Cairo'),
    Time(
        location: 'London',
        flag: 'assets/flags/england.jpg',
        url: 'Europe/London'),
    Time(
        location: 'Paris',
        flag: 'assets/flags/french.png',
        url: 'Europe/Paris'),
    Time(
        location: 'Chicago',
        flag: 'assets/flags/usa.jpg',
        url: 'America/Chicago'),
    Time(
        location: 'Madrid',
        flag: 'assets/flags/spanish.jpg',
        url: 'Europe/Madrid'),
    Time(
        location: 'Khartoum',
        flag: 'assets/flags/sudan.png',
        url: 'Africa/Khartoum')
  ];

  void updateTime(index) async {
    Time time = locationsData[index];
    await time.getTime();
    Navigator.pop(context, {
      'location': time.location,
      'flag': time.flag,
      'time': time.time,
      'isDayTime': time.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title: const Text(
          'Location',
          style: TextStyle(
              fontSize: 30,
              letterSpacing: 5,
              shadows: [Shadow(color: Colors.white, blurRadius: 10)]),
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
          child: Card(
            child: ListTile(
              onTap: () => updateTime(index),
              title: Text(
                locationsData[index].location,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(locationsData[index].flag),
              ),
              trailing: Icon(
                Icons.location_on,
                size: 30,
                color: Colors.red[800],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
