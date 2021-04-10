import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideDetails
{
  // ignore: non_constant_identifier_names
  String pickup_address;
  // ignore: non_constant_identifier_names
  String dropoff_address;
  LatLng pickup;
  LatLng dropoff;
  // ignore: non_constant_identifier_names
  String ride_request_id;
  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  String payment_method;
  // ignore: non_constant_identifier_names
  String rider_name;
  // ignore: non_constant_identifier_names
  String rider_phone;

  // ignore: non_constant_identifier_names
  RideDetails({this.pickup_address, this.dropoff_address, this.pickup, this.dropoff, this.ride_request_id, this.payment_method, this.rider_name, this.rider_phone});
}