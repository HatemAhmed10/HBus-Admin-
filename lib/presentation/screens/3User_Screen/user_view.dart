import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../../business_logic/3Users/users_cubit.dart';
import '../../../business_logic/3Users/users_state.dart';
import '../../../shared/components/1Tooles/8custom_feding.dart';
import '../../widgets/3user_widget/1Users_body.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => User_Cubit()..fetchAllUsers(),
      child: BlocConsumer<User_Cubit, Users_States>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          User_Cubit cubit = User_Cubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff669E76),
              title: Text("Users"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, top: 8, left: 8, bottom: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.save),
                  ),
                )
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! UsersLoadingSuccess,
              fallback: (context) => LoadingListPage(),
              builder: (context) => Center(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return Users_Bosy(
                    Users: cubit.Users[index],
                    index: index,
                  );
                },
                itemCount: cubit.Users.length,
              )),
            ),
          );
        },
      ),
    );
  }
}
