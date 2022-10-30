import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/PROVIDER/great_paces.dart';
import 'package:flutter_complete_guide/SCREENS/add_places.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text(
            'Yeh jagah khali kyun hai bhai!',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        builder: (ctx, GreatPlaces, ch) => GreatPlaces.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: GreatPlaces.items.length,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(
                    
                      backgroundImage: FileImage(GreatPlaces.items[i].image)),
                    title: Text(GreatPlaces.items[i].title),
                    onTap: (){},
                ),
              ),
      ),
    );
  }
}
