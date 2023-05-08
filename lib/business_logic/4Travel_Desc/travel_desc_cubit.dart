import 'package:admin/business_logic/4Travel_Desc/travel_desc_state.dart';
import 'package:admin/data/models/1Travel_Model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Travel_Desc_Cubit extends Cubit<Travel_Desc_States> {
  Travel_Desc_Cubit() : super(Travel_DescInitialState());

  static Travel_Desc_Cubit get(context) => BlocProvider.of(context);
  Timestamp nowDate = Timestamp.now();

  void Call_User(String phoneNumber) async {
    final String telUrl = "tel:${phoneNumber}";

    if (await canLaunch(telUrl)) {
      await launch(telUrl);
    } else {
      throw "Could not launch $telUrl";
    }
    emit(CallUserState());
  }

  void deleteUser(
      {required TravelModel travelModel, required int index}) async {
    travelModel.userBus!.removeAt(index);
    emit(deleteUserLoadingSuccess());

    TravelModel travelModel2 = TravelModel(
        id: travelModel.id,
        Time: travelModel.Time,
        country: travelModel.country,
        date: travelModel.date,
        salary: travelModel.salary,
        usersnumber: travelModel.usersnumber,
        userBus: travelModel.userBus);

    await FirebaseFirestore.instance
        .collection('Travel')
        .doc(travelModel.id)
        .update(travelModel2.toMap());
    emit(deleteUserState());
  }

  void AddUser(
      {required TravelModel travelModel,
      required String Name,
      required String country,
      required String phone}) async {
    travelModel.userBus!
        .add({"country": country, "name": Name, "phone": phone, "id": "123"});

    TravelModel travelModel2 = TravelModel(
      id: travelModel.id,
      country: travelModel.country,
      Time: travelModel.Time,
      date: travelModel.date,
      salary: travelModel.salary,
      usersnumber: travelModel.usersnumber,
      userBus: travelModel.userBus,
    );
    await FirebaseFirestore.instance
        .collection('Travel')
        .doc(travelModel2.id)
        .update(travelModel2.toMap());
    emit(AddUserState());
  }
}
