import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    Color textColor =
        data['time'].toUpperCase().contains("AM") ? Colors.black : Colors.white;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/day_images/${data['image']}'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'image': result['image'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.location_on,
                        color: textColor,
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 20.0,
                        ),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '${data['location']}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    '${data['time']}',
                    style: TextStyle(
                      fontSize: 66.0,
                      color: textColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
