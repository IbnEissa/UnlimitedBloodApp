import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final List<AssetImage> images = [
    AssetImage('assets/images/patient.jpg'),
    AssetImage('assets/images/donate.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'المطورون',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context), // add Navigator.pop() here
          ),
          backgroundColor: Colors.deepOrange,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 5),
              child: const Text(
                'المطورون',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildProfile(
                images[0],
                'محمد حمود عيسى',
                '771036353',
              ),
              SizedBox(height: 30),
              _buildProfile(
                images[1],
                'أسامة نبيل الجايفي',
                '773974422',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(ImageProvider image, String name, String phone) {
    return Column(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: image,
        ),
        SizedBox(height: 20),
        Text(
          name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          phone,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}