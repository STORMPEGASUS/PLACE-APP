import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  //function to pick image
  Future<void> _takePicture() async {
    final _picker = ImagePicker(); //due to deprecated member failure
    
    final imagefile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
  

   
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 175,
          height: 175,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(height: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text(
              'Take Picture',
              style: TextStyle(fontSize: 20),
            ),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
