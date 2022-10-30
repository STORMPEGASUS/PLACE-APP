import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/HELPERS/location_helper.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewimageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    final staticMapImageUrl = LocationHelper.generatedLocationPreviewImage(
        latitude: locData.latitude, longitude: locData.longitude);
    setState(() {
      _previewimageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 29, 60, 153)),
          ),
          alignment: Alignment.center,
          height: 190,
          width: double.infinity,
          child: _previewimageUrl == null
              ? Text(
                  'No Location chosen',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                )
              : Image.network(
                  _previewimageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(Icons.location_on),
              label: Text(
                'Current Location',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text(
                'Select on Map',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
