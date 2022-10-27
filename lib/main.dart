import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/PROVIDER/great_paces.dart';
import 'package:flutter_complete_guide/SCREENS/add_places.dart';
import 'package:flutter_complete_guide/SCREENS/places_list.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          // ignore: deprecated_member_use
          accentColor: Colors.amber,
        ),
        home: PlaceslistScreen(),
        routes: {
          AddPlaceScreen.routename:(context) => AddPlaceScreen(), 
        },
      ),
    );
  }
}
