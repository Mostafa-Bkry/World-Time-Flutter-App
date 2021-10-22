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
        url: 'Africa/Khartoum'),
    Time(
        location: 'Casablanca',
        flag: 'assets/flags/Casablanca-Morocco.jpg',
        url: 'Africa/Casablanca'),
    Time(
        location: 'Costa Rica',
        flag: 'assets/flags/Costa_Rica.jpg',
        url: 'America/Costa_Rica'),
    Time(
        location: 'Colorado',
        flag: 'assets/flags/denver-Colorado.jpg',
        url: 'America/Denver'),
    Time(
        location: 'Istanbul',
        flag: 'assets/flags/Istanbul-Turkey.jpg',
        url: 'Europe/Istanbul'),
    Time(
        location: 'Nairobi',
        flag: 'assets/flags/Keyna-Nairobi.jpg',
        url: 'Africa/Nairobi'),
    Time(
        location: 'Moscow',
        flag: 'assets/flags/Moscow-Russian.jpg',
        url: 'Europe/Moscow'),
    Time(
        location: 'Oslo',
        flag: 'assets/flags/Oslo-Norwa.jpg',
        url: 'Europe/Oslo'),
    Time(
        location: 'Prague',
        flag: 'assets/flags/Prague.jpg',
        url: 'Europe/Prague'),
    Time(
        location: 'Rome',
        flag: 'assets/flags/Rome-Italy.jpg',
        url: 'Europe/Rome'),
    Time(
        location: 'Stockholm',
        flag: 'assets/flags/Stockholm-Sweden.jpg',
        url: 'Europe/Stockholm'),
    Time(location: 'Tunis', flag: 'assets/flags/Tunis.jpg', url: 'Africa/Tunis')
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
        itemCount: 17,
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
