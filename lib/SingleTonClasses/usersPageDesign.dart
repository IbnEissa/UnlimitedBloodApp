import 'dart:convert';

import 'package:blood_nepal/SingleTonClasses/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cardOfUsersDesign.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> _users = [];

  get http => null;

  @override
  void initState() {
    super.initState();

    // Call the API to get the list of users
    fetchUsers().then((users) {
      setState(() {
        _users = users;
      });
    });
  }

  Future<List<User>> fetchUsers() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    // final response = await http.get(Uri.parse('https://example.com/users'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return UserCard(user: user);
        },
      ),
    );
  }
}