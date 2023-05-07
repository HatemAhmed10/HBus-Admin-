import 'package:admin/data/models/2Users_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Users_Bosy extends StatelessWidget {
  final UsersModel Users;

  Users_Bosy({
    super.key,
    required this.Users,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(Users.name.toString()),
    );
  }
}
