import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/4Travel_Desc/travel_desc_cubit.dart';
import '../../../business_logic/4Travel_Desc/travel_desc_state.dart';
import '../../../data/models/1Travel_Model.dart';
import '../../../shared/components/1Tooles/1CustomButton.dart';
import '../../../shared/components/1Tooles/8custom_feding.dart';
import '../../widgets/2bus_widget/1BottomSheetBody.dart';
import '../../widgets/5Travel_widget/1user_list.dart';
import '../../widgets/5Travel_widget/2BottomSheetBody.dart';

class Travel_Desc_View extends StatelessWidget {
  final TravelModel travels;

  Travel_Desc_View({
    super.key,
    required this.travels,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Travel_Desc_Cubit(),
      child: BlocConsumer<Travel_Desc_Cubit, Travel_Desc_States>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff669E76),
              centerTitle: true,
              title: Row(
                children: [
                  Spacer(),
                  Text(travels.Time.toString()),
                  Spacer(),
                  Text(travels.country.toString()),
                  Spacer(),
                  Text('ج ${travels.salary.toString()}'),
                  Spacer(),
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! deleteUserLoadingSuccess,
              fallback: (context) => LoadingListPage(),
              builder: (context) => Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        // color: Colors.yellow,
                        width: 350,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${travels.userBus!.length} / ${travels.usersnumber}',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.orange),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // color: Colors.blue,
                              height: 340,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return User_List(
                                    travels2: travels,
                                    travels: travels.userBus!,
                                    index: index,
                                  );
                                },
                                itemCount: travels.userBus!.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    travels.userBus!.length ==
                            int.parse(travels.usersnumber.toString())
                        ? Expanded(
                            flex: 1,
                            child: Text(
                              "لا يوجد مكان في هذه العربيه",
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xff669E76),
                              ),
                            ))
                        : Expanded(
                            flex: 1,
                            child: Container(
                              // color: Colors.blue,
                              child: Column(
                                children: [
                                  CustomAnimatedButton(
                                    function: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return BottomSheetBody_screen2(
                                            context2: context,
                                            travelModel: travels,
                                          );
                                        },
                                      );
                                    },
                                    widget: Text("اضافه"),
                                    ButtonHight: 80,
                                    Buttonwidth: 80,
                                    backgroundcolor: Color(0xff669E76),
                                    shape: BoxShape.circle,
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
