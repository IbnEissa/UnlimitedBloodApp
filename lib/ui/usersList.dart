import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyUsersListPage extends StatefulWidget {
  const MyUsersListPage({super.key});

  @override
  _MyUsersListPageState createState() => _MyUsersListPageState();
}

class _MyUsersListPageState extends State<MyUsersListPage> {
  // List<dynamic> accounts = [];
  List responseData=[];
  Future<void> fetchData() async {
    final url = 'http://localhost/UnlimitedBlood/Services/api.php';
    // final data = {
    //   'phoneNumber': '1234567890',
    //   'password': '1234567890',
    // };
    try {
      var response = await http.get(Uri.parse(url));
      // final response = await http.put(Uri.parse(url), body: data);
      // if (response.statusCode == 200) {
         // responseData = json.decode(response.body);
        // final  operation = responseData['Operation'];

        // if (operation == 'Done') {
          setState(() {
            responseData = json.decode(response.body);
            // accounts = responseData[];
          });
        // } else {
        //   print('API request failed. Operation: $operation');
        // }
      // } else {
      //   print('Failed to retrieve data. Status code: ${response.statusCode}');
      // }
    } catch (e) {
      print('Error sending HTTP request: $e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accounts')),
      body: ListView.builder(
          itemCount: responseData.length,
          itemBuilder: (context,index) {
            // final account = accounts[index];
            // print('${account['email']}');
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(responseData[index]['fName']),
                subtitle: Text(responseData[index]['lName']),

              ),
              // subtitle: Text('${account['email']}',style: TextStyle(color: Colors.black),),
            );
          },
        ),
    );
  }
}