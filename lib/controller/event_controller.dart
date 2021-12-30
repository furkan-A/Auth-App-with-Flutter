import 'package:flutter_dev_challenge/models/event.dart';

class EventController {
  List<Event> weekdays = [
    Event(
        name: 'Monday',
        description: 'description',
        city: 'Adana',
        date: '21 SEP',
        likeRate: 3.9),
    Event(
        name: 'Tuesday',
        description: 'description',
        city: 'Adana',
        date: '21 SEP',
        likeRate: 4.1),
    Event(
        name: 'Wednesday',
        description: 'description',
        city: 'Adana',
        date: '21 SEP',
        likeRate: 3.9),
    Event(
        name: 'Thursday',
        description: 'description',
        city: 'Adana',
        date: '21 SEP',
        likeRate: 4.3),
    Event(
        name: 'Friday',
        description: 'description',
        city: 'Adana',
        date: '21 SEP',
        likeRate: 4.9),
  ];
  List<Event> weekend = [
    Event(
        name: 'Saturday',
        description: 'description',
        city: 'Izmir',
        date: '18 NOV',
        likeRate: 3.9),
    Event(
        name: 'Sunday',
        description: 'description',
        city: 'Izmir',
        date: '17 DEC',
        likeRate: 3.9),
  ];

  Event example = Event(
      name: 'Lorem Ipsum',
      description: 'description',
      city: 'Istanbul',
      date: '11 JUL',
      likeRate: 4.4);
}
