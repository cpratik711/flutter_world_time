import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name of the UI
  String flag;
  String url;
  String image;

  WorldTime.name(this.url, this.location, this.flag);

  String time;

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/${url}');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);
      print(offset);
      print(data.toString());

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      image = getBgImage(now.hour);
      print(time);
    } catch (e) {
      print(e);
      time = 'Could not get time data';
    }
  }

  String getBgImage(int hour) {
    String imageName = "morning.png";
    if (hour > 5 && hour < 12) {
      imageName = 'morning.png';
    } else if (hour > 12 && hour < 17) {
      imageName = 'afternoon.png';
    } else if (hour > 5 && hour < 20) {
      imageName = 'evening.png';
    } else if (hour > 8 && hour < 24) {
      imageName = 'night.png';
    }
    return imageName;
  }
}
