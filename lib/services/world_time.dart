import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Time {
  String location;
  String flag;
  late String time;
  String url;

  Time({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      print(response.body);

      Map allData = jsonDecode(response.body);

      DateTime now = DateTime.parse(allData['datetime']);

      print(allData['utc_offset']);
      String offset = allData['utc_offset'].toString().substring(1, 3);
      int hours = int.parse(offset);

      now = now.add(Duration(hours: hours));

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error : $e');
      time = 'Couldn\'t get $location time!';
    }
  }
}
