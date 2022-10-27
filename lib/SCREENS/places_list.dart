import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/SCREENS/add_places.dart';

class PlaceslistScreen extends StatelessWidget {
  const PlaceslistScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routename);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
