// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(UsersDetails());
// }
//
// class UsersDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'تفاصيل المستخدمين',
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange,
//       ),
//       home: UserListPage(),
//     );
//   }
// }
//
// class User {
//   final int id;
//   final String name;
//   final String email;
//
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
// }
//
// class UserCard extends StatelessWidget {
//   final User user;
//
//   const UserCard({required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           child: Text(user.name[0]),
//         ),
//         title: Text(user.name, style: TextStyle(fontSize: 16.0)),
//         subtitle: Text(user.email, style: TextStyle(fontSize: 14.0)),
//       ),
//     );
//   }
// }
//
// class UserListPage extends StatefulWidget {
//   @override
//   _UserListPageState createState() => _UserListPageState();
// }
//
// class _UserListPageState extends State<UserListPage> {
//   List<User> _users = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Call the API to get the list of users
//     fetchUsers().then((users) {
//       setState(() {
//         _users = users;
//       });
//     });
//   }
//
//   Future<List<User>> fetchUsers() async {
//     final response =
//     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//     if (response.statusCode == 200) {
//       final jsonList = json.decode(response.body) as List<dynamic>;
//       return jsonList.map((json) => User.fromJson(json)).toList();
//     } else {
//       throw Exception('فشل تحميل المستخدمين');
//     }
//   }
//
//   Future<void> _refreshUsers() async {
//     final users = await fetchUsers();
//     setState(() {
//       _users = users;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           Padding(
//               padding: const EdgeInsets.only(right: 20, top: 5),
//               child: const Text(
//                 'المستخدمين',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               )),
//         ],
//       ),
//       body: Directionality(
//         textDirection: TextDirection.rtl,
//         child: RefreshIndicator(
//           onRefresh: _refreshUsers,
//           child: ListView.builder(
//             itemCount: _users.length,
//             itemBuilder: (context, index) {
//               final user = _users[index];
//               return UserCard(user: user);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }



/////////////////////////////the other code /////////

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(UsersDetails());
}

class UsersDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تفاصيل المستخدمين',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: UserListPage(),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback? onTap;

  const UserCard({required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(user.name[0]),
        ),
        title: Text(user.name, style: TextStyle(fontSize: 16.0)),
        subtitle: Text(user.email, style: TextStyle(fontSize: 14.0)),
        onTap: onTap,
      ),
    );
  }
}

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> _users = [];

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
    await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));
    // await http.get(Uri.parse('http://localhost/UnlimitedBlood/Services/usersPageFromJsonFile.php'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('فشل تحميل المستخدمين');
    }
  }

  Future<void> _refreshUsers() async {
    final users = await fetchUsers();
    setState(() {
      _users = users;
    });
  }

  Future<void> _addUser() async {
    final result = await Navigator.of(context).push<User>(
      MaterialPageRoute(builder: (context) => AddUserPage()),
    );
    if (result != null) {
      setState(() {
        _users.add(result);
      });
    }
  }

  Future<void> _editUser(User user) async {
    final result = await Navigator.of(context).push<User>(
      MaterialPageRoute(builder: (context) => EditUserPage(user: user)),
    );
    if (result != null) {
      setState(() {
        final index = _users.indexWhere((u) => u.id == result.id);
        if (index != -1) {
          _users[index] = result;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('تفاصيل المستخدمين', textAlign: TextAlign.right),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addUser,
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: RefreshIndicator(
          onRefresh: _refreshUsers,
          child: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return UserCard(
                user: user,
                onTap: () => _editUser(user),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 5),
              child: const Text(
                'إضافة مستخدم',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ],
             ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'الاسم',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال الاسم';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال البريد الإلكتروني';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newUser = User(
                      id: DateTime.now().millisecondsSinceEpoch,
                      name: _nameController.text,
                      email: _emailController.text,
                    );
                    Navigator.of(context).pop(newUser);
                  }
                },
                child: Text('إضافة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditUserPage extends StatefulWidget {
  final User user;

  const EditUserPage({required this.user});

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user.name;
    _emailController.text = widget.user.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل المستخدم', textAlign: TextAlign.right),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'الاسم',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال الاسم';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال البريد الإلكتروني';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedUser = User(
                      id: widget.user.id,
                      name: _nameController.text,
                      email: _emailController.text,
                    );
                    Navigator.of(context).pop(updatedUser);
                  }
                },
                child: Text('حفظ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}