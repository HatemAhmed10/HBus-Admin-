import 'package:admin/business_logic/3Users/users_state.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/2Users_Model.dart';

class User_Cubit extends Cubit<Users_States> {
  User_Cubit() : super(UserInitialState());

  static User_Cubit get(context) => BlocProvider.of(context);

  List<UsersModel> Users = [];
  fetchAllUsers() {
    emit(UsersLoadingSuccess());
    Users.clear();
    FirebaseFirestore.instance.collection('users').snapshots().listen((event) {
      Users.clear();
      event.docs.forEach((element) {
        Users.add(UsersModel.fromJson(element.data()));
      });
      emit(UsersSuccess());
    });

    // emit(SubjectsSuccess());
  }

  //-----------------------------------------------
  bool isChecked = false;

  void ChangeSwitch(bool value, UsersModel usersModel) async {
    usersModel.state = value;

    UsersModel usersModel2 = UsersModel(
        id: usersModel.id,
        name: usersModel.name,
        phone: usersModel.phone,
        country: usersModel.country,
        state: value);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(usersModel.id)
        .update(usersModel2.toMap());
    emit(ChangeSwitchState());
  }
  //-------------------------------------------------------------

  void deleteItem({required UsersModel usersModel}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(usersModel.id)
        .delete();
    emit(deleteItemState());
  }
}
