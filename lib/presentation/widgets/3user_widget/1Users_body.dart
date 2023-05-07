import 'package:admin/data/models/2Users_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/3Users/users_cubit.dart';
import '../../../business_logic/3Users/users_state.dart';

class Users_Bosy extends StatelessWidget {
  final UsersModel Users;
  final int index;

  Users_Bosy({
    super.key,
    required this.Users,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<User_Cubit, Users_States>(
      builder: (context, state) {
        User_Cubit cubit = User_Cubit.get(context);

        return ListTile(
          leading: Container(
            width: 60,
            height: 60,
            child: CircleAvatar(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    fontSize: 20, fontFamily: "bold", color: Colors.white),
              ),
              backgroundColor: Color(0xff669E76),
            ),
          ),
          title: Text(Users.name.toString()),
          subtitle: Row(
            children: [
              Text(Users.phone.toString()),
              Text(' / ${Users.country.toString()}'),
            ],
          ),
          trailing: Container(
            width: 200,
            height: 100,
            child: Row(
              children: [
                Spacer(),
                Switch(
                  activeColor: Color(0xff669E76),
                  value: Users.state as bool,
                  onChanged: (val) {
                    cubit.ChangeSwitch(val, Users);
                  },
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      cubit.deleteItem(usersModel: Users);
                    },
                    icon: Icon(Icons.delete)),
                Spacer(),
              ],
            ),
          ),
          // onTap: () {
          //   // Handle onTap event here.
          // },
        );
      },
    );
  }
}
