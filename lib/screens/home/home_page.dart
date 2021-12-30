import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_challenge/constants.dart';
import 'package:flutter_dev_challenge/controller/event_controller.dart';
import 'package:flutter_dev_challenge/screens/event_detail_page.dart';
import 'package:flutter_dev_challenge/screens/first_page.dart';
import 'package:flutter_dev_challenge/screens/home/event_card.dart';
import 'package:flutter_dev_challenge/services/auth.dart';
// import 'package:flutter_dev_challenge/models/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    double deviceWidth = queryData.size.width;
    double deviceHeight = queryData.size.height;
    double cardWidth = deviceWidth * 2 / 3;
    double cardHeight = cardWidth * 1.24;

    EventController eventController = EventController();

    // final user = Provider.of<User>(context);
    final AuthService _auth = AuthService();
    var username = FirebaseAuth.instance.currentUser!.email;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        primary: true,
        backgroundColor: Colors.grey[400],
        title: Text('welcome $username'),
        actions: [
          TextButton(
              onPressed: () async {
                showAlertDialog(context, _auth);
              },
              child: const Text('Sign Out')),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(height: deviceHeight / 9),
              const Text(
                'Events you might like',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 28),
              const Text('All of weekdays events'),
              SizedBox(
                height: cardHeight,
                width: cardWidth,
                child: ListView.builder(
                    padding: EdgeInsets.all(kDefPadding),
                    itemCount: eventController.weekdays.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var containers = eventController.weekdays
                          .map(
                            (event) => InkWell(
                              onTap: () {
                                Route route =
                                    MaterialPageRoute(builder: (context) {
                                  return EventDetail(event: event);
                                });
                                Navigator.push(context, route);
                              },
                              child: EventCard(
                                cardHeight: cardHeight,
                                cardWidth: cardWidth,
                                event: event,
                              ),
                            ),
                          )
                          .toList();
                      return containers[index];
                    }),
              ),
              const SizedBox(height: 14),
              const Text('Weekend events'),
              SizedBox(
                height: cardHeight,
                width: cardWidth,
                child: ListView.builder(
                    padding: EdgeInsets.all(kDefPadding),
                    itemCount: eventController.weekend.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var containers = eventController.weekend
                          .map(
                            (event) => InkWell(
                              onTap: () {
                                Route route =
                                    MaterialPageRoute(builder: (context) {
                                  return EventDetail(event: event);
                                });
                                Navigator.push(context, route);
                              },
                              child: EventCard(
                                cardHeight: cardHeight,
                                cardWidth: cardWidth,
                                event: event,
                              ),
                            ),
                          )
                          .toList();
                      return containers[index];
                    }),
              ),
              const SizedBox(height: 14),
              const Text('The Others'),
              SizedBox(
                height: cardHeight,
                width: cardWidth,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(builder: (context) {
                          return EventDetail(event: eventController.example);
                        });
                        Navigator.push(context, route);
                      },
                      child: EventCard(
                        cardHeight: cardHeight,
                        cardWidth: cardWidth,
                        event: eventController.example,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, AuthService auth) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () async {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      await auth.signOut();
      Route route = MaterialPageRoute(builder: (context) {
        return const FirstPage();
      });
      Navigator.push(context, route);
    },
  );

  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Sign Out"),
    content: const Text("Are you sure you want to sign out?"),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
