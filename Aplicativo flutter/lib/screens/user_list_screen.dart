import 'package:flutter/material.dart';
import 'screens/user_details_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/models/user.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen ({super.key});
  @override
  UserListScreenState createState() => UserListScreenState();
}

class UserListScreenState extends State<UserListScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<User> fetchedUsers = data.map((user) => User(name: user['name'], email: user['email'])).toList();
      setState(() {
        users = fetchedUsers;
      });
    } else {
      print('Failed to fetch users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsScreen(user: users[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

