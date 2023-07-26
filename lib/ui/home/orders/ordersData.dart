import 'dart:async';

import 'package:blood_nepal/ui/login.dart';
import 'package:blood_nepal/ui/signup.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../SingleTonClasses/usersPageDesign.dart';
import '../../usersList.dart';
import '../../widgets/dataUsesFromApi.dart';
import '../devlopers/developers.dart';



class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _currentIndex = 0;
  BorderRadius _borderRadius = BorderRadius.circular(14.5);
  Border _border = Border.all();
  BoxShadow _boxShadow = BoxShadow();
  late BoxDecoration _containerDecoration;

  TextStyle _textStyle = TextStyle(
      backgroundColor: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrange);
  // final List<NetworkImage> images = [
  //   NetworkImage('https://picsum.photos/seed/1/300/200'),
  //   NetworkImage('https://picsum.photos/seed/2/300/200'),
  //   NetworkImage('https://picsum.photos/seed/3/300/200'),
  //   // add more image URLs here
  // ];
  // final imageTexts = [
  //   'Image 1',
  //   'Image 2',
  //   'Image 3',
  //   'Image 4',
  //   'Image 5',
  //   'Image 6',
  //   'Image 7',
  //   'Image 8',
  //   'Image 9',
  //   'Image 10',
  // ];
  final List<AssetImage> images = [
    AssetImage('assets/images/download (3).jpg'),
    AssetImage('assets/images/download (4).jpg'),
    AssetImage('assets/images/blood4.png'),
    AssetImage('assets/images/download .jpg'),
    AssetImage('assets/images/patient.jpg'),
    AssetImage('assets/images/donate.jpg'),
    AssetImage('assets/images/doctor.jpg'),
    AssetImage('assets/images/blood1.webp'),
  ];

  final imageTexts = [
    'تبرع بدمك لإنقاذ حياة مريض',
    'أنقذ حياة بتبرعك بالدم',
    'في إمكانك التبرع مرة كل ثلاثة أشهر',
    'التبرع قليل من وقتك ولكنه كثير لمن يحتاج',
    'فتح قلبك وحدد موعد للتبرع بالدم اليوم',
    'اتصل الآن للتبرع بالدم المجاني وإنقاذ حياة',
    'قد يكون تبرعك اليوم هو الأمل الأخير لمريض',
    'تبرع بالدم إحدى أبسط طرق الإنسانية'
  ];
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _borderRadius = BorderRadius.circular(16.0);
    _border = Border.all(color: Colors.black87, width: 3.0);
    _boxShadow = BoxShadow(
        color: Colors.white.withOpacity(0.7),
        spreadRadius: 10,
        blurRadius: 6,
        offset: Offset(3, 3)); // changes position of shadow),
    _containerDecoration = BoxDecoration(
        borderRadius: _borderRadius, border: _border, boxShadow: [_boxShadow]);
  }

  void _showTabOrdersPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MyTabPage()),
    );
  }

  _navToPage1() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 5),
              child: const Text(
                'الرئيسية',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CarouselSlider(
              items: images.map((image) {
                return Container(
                    width: 400,
                    height: 300,
                    decoration: _containerDecoration,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image(
                            image: image,
                            fit: BoxFit.fill,
                          ),
                          flex: 6,
                        ),
                        Expanded(
                          child: Text(
                            imageTexts[images.indexOf(image)],
                            style: _textStyle,
                          ),
                          flex: 1,
                        )
                      ],
                    ));
              }).toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    setState(() => _currentImageIndex = index),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // Button 1
                    MaterialButton(
                      minWidth: 130,
                      // Change width
                      height: 130,
                      // Change height
                      onPressed: () {},
                      color: Colors.deepOrange,
                      padding: EdgeInsets.all(20.0),
                      shape: UnderlineInputBorder(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.house_sharp,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            Text('المستشفيات',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0)),
                          ]),
                    ),
                    SizedBox(height: 16),
                    MaterialButton(
                      minWidth: 130,
                      // Change width
                      height: 130,
                      // Change height
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MyApp()));
                      },
                      color: Colors.deepOrange,
                      padding: EdgeInsets.all(20.0),
                      shape: UnderlineInputBorder(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.developer_mode,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            Text('المطورون',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0)),
                          ]),
                    ),

                    // Button 2

                    SizedBox(height: 16),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                ),
                Column(
                  children: [
                    // Button 1
                    MaterialButton(
                      minWidth: 130,
                      // Change width
                      height: 130,
                      // Change height
                      onPressed: _showTabOrdersPage,
                      color: Colors.deepOrange,
                      padding: EdgeInsets.all(20.0),
                      shape: UnderlineInputBorder(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bloodtype_outlined,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            Text('طلبات التبرع',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),
                    SizedBox(height: 16),
                    // Button 2
                    MaterialButton(
                      minWidth: 130,
                      // Change width
                      height: 130,
                      // Change height
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UsersDetails()));
                      },
                      color: Colors.deepOrange,
                      padding: EdgeInsets.all(20.0),
                      shape: UnderlineInputBorder(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.supervised_user_circle_sharp,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            Text('المستخدمين',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),

                    SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTabOrdersPage,
        child: Icon(Icons.tab),
      ),
    );
  }
}

class MyTabPage extends StatefulWidget {
  const MyTabPage({Key? key}) : super(key: key);

  @override
  State<MyTabPage> createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الطلبات')),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // All orders tab
          Signup(),

          // Pending orders tab
          Login(),

          // Completed orders tab
          Signup(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _selectedIndex,
        items: [
          // All orders icon
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'المتبرعون',
          ),

          // Pending orders icon
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_bottom),
            label: 'المستشفيات',
          ),

          // Completed orders icon
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'المستخدمون',
          ),
        ],
      ),
    );
  }
}
