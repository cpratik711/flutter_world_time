import 'package:flutter/material.dart';
import 'package:flutterworldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime.name('Europe/London', 'London', 'uk.png'),
    WorldTime.name('Europe/Berlin', 'Athens', 'greece.png'),
    WorldTime.name('Africa/Cairo', 'Cairo', 'egypt.png'),
    WorldTime.name('Africa/Nairobi', 'Nairobi', 'kenya.png'),
    WorldTime.name('America/Chicago', 'Chicago', 'usa.png'),
    WorldTime.name('America/New_York', 'New York', 'usa.png'),
    WorldTime.name('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTime.name('Asia/Jakarta', 'Jakarta', 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'location': worldTime.location,
      'time': worldTime.time,
      'flag': worldTime.flag,
      'image': worldTime.image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Choose the Location',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.cyanAccent[400],
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
