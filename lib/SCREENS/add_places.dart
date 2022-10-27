import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/WIDGET/add_image.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routename = '/Add-Place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titlecontroller = TextEditingController();

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
                      decoration: InputDecoration(labelText: 'Title',),
                      style: TextStyle(fontSize: 30),
                      controller: _titlecontroller,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    
                    ImageInput(),
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
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Add Place'),
          )
        ],
      ),
    );
  }
}
