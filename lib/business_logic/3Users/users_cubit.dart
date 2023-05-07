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
}
