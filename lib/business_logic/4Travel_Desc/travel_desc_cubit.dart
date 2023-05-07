import 'package:admin/business_logic/4Travel_Desc/travel_desc_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Travel_Desc_Cubit extends Cubit<Travel_Desc_States> {
  Travel_Desc_Cubit() : super(Travel_DescInitialState());

  static Travel_Desc_Cubit get(context) => BlocProvider.of(context);
}
