import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/PROVIDER/great_paces.dart';
import 'package:flutter_complete_guide/WIDGET/add_image.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routename = '/Add-Place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titlecontroller = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savedPlace() {
    if (_titlecontroller.text.isEmpty || _pickedImage == null) {
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              child: AlertDialog(
                title: Text(
                  'ALERT!!',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                content: Text(
                  'Andha hai kya LAUDE thik se daal.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Thik Chacha'))
                ],
              ),
            );
          });
      return;
    }

    Provider.of<GreatPlaces >(context,listen: false)
        .addPlace(_titlecontroller.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      style: TextStyle(fontSize: 30),
                      controller: _titlecontroller,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              minimumSize: Size.fromHeight(50),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.black,
              textStyle: TextStyle(fontSize: 20),
            ),
            onPressed: _savedPlace,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
          )
        ],
      ),
    );
  }
}
