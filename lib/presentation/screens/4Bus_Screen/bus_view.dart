import 'package:admin/data/models/1Travel_Model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/4Bus/Bus_cubit.dart';
import '../../../business_logic/4Bus/Bus_state.dart';
import '../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../shared/components/1Tooles/8custom_feding.dart';
import '../../widgets/2bus_widget/1BottomSheetBody.dart';
import '../../widgets/2bus_widget/2Travels_bod.dart';
import '../3User_Screen/user_view.dart';

class Bus_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Bus_Cubit()..fetchAllTravels(),
      child: BlocConsumer<Bus_Cubit, Bus_States>(
          listener: (context, state) {},
          builder: (context, state) {
            Bus_Cubit cubit = Bus_Cubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff669E76),
                centerTitle: true,
                title: Text("Bus"),
                actions: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            navigateTo(context, UserView());
                          },
                          icon: Icon(Icons.person_3_rounded)),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xff669E76),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomSheetBody_screen(
                        context2: context,
                      );
                    },
                  );
                },
                child: Icon(Icons.add),
              ),
              body: ConditionalBuilder(
                condition: state is! TravelsLoadingSuccess,
                fallback: (context) => LoadingListPage(),
                builder: (context) => Center(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Travels_Body(
                      travels: cubit.travels[index],
                    );
                  },
                  itemCount: cubit.travels.length,
                )),
              ),
            );
          }),
    );
  }
}
