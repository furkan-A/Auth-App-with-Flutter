import 'package:flutter/material.dart';
import 'package:flutter_dev_challenge/constants.dart';
import 'package:flutter_dev_challenge/models/event.dart';

class EventDetail extends StatelessWidget {
  EventDetail({Key? key, required this.event}) : super(key: key);
  Event event;

  // String dropdownValue = 'Male and Female';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  const ClipRRect(
                    child: Image(
                      image: AssetImage('assets/images/event_photo.jpg'),
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        child: Text(
                          event.date,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        margin: const EdgeInsets.all(24),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // const SizedBox(height: 98),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TabBar(
                  tabs: const [
                    Tab(child: Text('Overview')),
                    Tab(child: Text('Photos')),
                    Tab(child: Text('Guest List')),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.white,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                ),
              ),
              // const Spacer(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey[200],
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  event.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 14,
                                        ),
                                        Text(
                                          '${event.likeRate}', // 99999
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: kMainColor,
                                ),
                                Text(event.city),
                              ],
                            ),
                            const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
                            Row(
                              children: [
                                const Spacer(),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: const Text('Interested'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            FractionallySizedBox(
                              widthFactor: 0.98,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Check-In',
                                    style: TextStyle(
                                        color: kMainColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            FractionallySizedBox(
                              widthFactor: 0.98,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Get Guaranteed Entry',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text('Photos'),
                      Column(
                        children: const [
                          Text(
                            'Guaranteed Entries',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          // DropdownButton<String>(
                          //   value: dropdownValue,
                          //   icon: Icon(Icons.sd_storage),
                          //   iconSize: 24,
                          //   elevation: 16,
                          //   style: TextStyle(color: Colors.deepPurple),
                          //   underline: Container(
                          //     height: 2,
                          //     color: Colors.deepPurpleAccent,
                          //   ),
                          //   onChanged: (String? newValue) {
                          //     // setState(() {
                          //     dropdownValue = newValue!;
                          //     // });s
                          //   },
                          //   items: <String>['Male', 'Female', 'Male and Female']
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
