import 'package:admin/business_logic/4Bus/Bus_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/1Travel_Model.dart';

class Bus_Cubit extends Cubit<Bus_States> {
  Bus_Cubit() : super(BusInitialState());

  static Bus_Cubit get(context) => BlocProvider.of(context);
  Timestamp nowDate = Timestamp.now();

  addTravel(
      {required String country,
      required String Time,
      required String salary}) async {
    emit(AddTravelLoading());
    // try {
    // var subjectsBox = Hive.box<SubjectModel>(kSubjectBox);
    // await subjectsBox.add(subject);
    var FId = FirebaseFirestore.instance.collection('Travel').doc();

    TravelModel travelModel = TravelModel(
      id: FId.id,
      country: country,
      Time: Time,
      salary: salary,
      date: nowDate,
      date2: nowDate.toDate().toIso8601String().substring(0, 10).toString(),
    );

    await FirebaseFirestore.instance
        .collection("Travel")
        .doc(FId.id)
        .set(travelModel.toMap())
        .then((value) {
      emit(AddSTravelSuccessState());
    }).catchError((error) {
      emit(AddTravelErrorState());
    });

    // emit(AddSubjectSuccess());
    // } catch (e) {
    //   emit(AddSubjectFailure(e.toString()));
    // }
  }
  //--------------------------------------------------------

  List<TravelModel> travels = [];
  fetchAllTravels() {
    emit(TravelsLoadingSuccess());
    travels.clear();
    FirebaseFirestore.instance
        .collection('Travel')
        .orderBy("date", descending: true)
        .snapshots()
        .listen((event) {
      travels.clear();
      event.docs.forEach((element) {
        String data1 = element
            .data()["date"]
            .toDate()
            .toIso8601String()
            .substring(0, 10)
            .toString();
        String data2 =
            nowDate.toDate().toIso8601String().substring(0, 10).toString();
        if (data1 == data2) {
          travels.add(TravelModel.fromJson(element.data()));
        }
      });
      emit(TravelsSuccess());
    });
  }
}
