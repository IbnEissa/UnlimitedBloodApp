import 'package:blood_nepal/SingleTonClasses/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.imageUrl),
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}