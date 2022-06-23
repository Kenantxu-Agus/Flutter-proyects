class LocationModel {
  double latitude;
  double longitude;

  LocationModel({this.latitude, this.longitude});

  @override
  String toString() {
    return 'latitude: $latitude, longitude: $longitude';
  }
}
