import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/HELPERS/db_helper.dart';
import 'package:flutter_complete_guide/MODELS/places.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  //getter method to retrive our list
  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File pickedImage) {
    final newplace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: title,
        location: null);

    _items.add(newplace);
    notifyListeners();
    DBHelper.insert('PLACES_DB', {
      'ID': newplace.id,
      'TITLE': newplace.title,
      'IMAGE': newplace.image.path,
    });
  }

  Future<void> fetchAndSetplaces() async {
    final dataList = await DBHelper.getData('PLACES_DB');
    _items = dataList
        .map((item) => Place(
            id: item['ID'],
            title: item['TITLE'],
            location: null,
            image: File(item['IMAGE'])))
        .toList();
    notifyListeners();
  }
}
