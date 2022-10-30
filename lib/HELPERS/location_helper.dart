const GOOGLE_API_KEY = 'AIzaSyB8hAnUvkLuzUnwN1zxHY5MAwfxzc8qDoY';

class LocationHelper {
  static String generatedLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
