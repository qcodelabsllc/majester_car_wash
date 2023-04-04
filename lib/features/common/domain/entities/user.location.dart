/// model for user location
class UserLocation {
  final String address;
  final String tag;
  final double latitude;
  final double longitude;

  const UserLocation({
    required this.address,
    required this.tag,
    required this.latitude,
    required this.longitude,
  });
}
