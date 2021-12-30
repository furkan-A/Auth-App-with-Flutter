class Event {
  String name;
  String description;
  String city;
  double likeRate = 0.0;
  String date;
  List guestList = [];

  Event(
      {required this.name,
      required this.description,
      required this.city,
      required this.date,
      required this.likeRate});
}
