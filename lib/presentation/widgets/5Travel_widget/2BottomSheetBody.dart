import 'package:admin/shared/components/1Tooles/5Custom_Navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/4Travel_Desc/travel_desc_cubit.dart';
import '../../../business_logic/4Travel_Desc/travel_desc_state.dart';
import '../../../data/models/1Travel_Model.dart';
import '../../../shared/components/1Tooles/1CustomButton.dart';
import '../../screens/4Bus_Screen/bus_view.dart';

class BottomSheetBody_screen2 extends StatelessWidget {
  final BuildContext context2;
  final TravelModel travelModel;

  var countryController = TextEditingController();
  var NameController = TextEditingController();
  var PhoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  BottomSheetBody_screen2({
    super.key,
    required this.context2,
    required this.travelModel,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Travel_Desc_Cubit(),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: TextFormField(
                              // style: TextStyle(fontSize: 15),
                              cursorColor: Color(0xff669E76),

                              controller: NameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'اكتب اسم الشخص';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'الاسم',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xff669E76),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(
                                //     color: Color(0xffD6A4DE),
                                //   ),
                                //   borderRadius: BorderRadius.all(Radius.circular(20)),
                                // ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff669E76),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: TextFormField(
                              // style: TextStyle(fontSize: 15),
                              cursorColor: Color(0xff669E76),

                              controller: countryController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'اكتب اسم البلد';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'البلد',
                                prefixIcon: Icon(
                                  Icons.location_city,
                                  color: Color(0xff669E76),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(
                                //     color: Color(0xffD6A4DE),
                                //   ),
                                //   borderRadius: BorderRadius.all(Radius.circular(20)),
                                // ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff669E76),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: TextFormField(
                              // style: TextStyle(fontSize: 15),
                              cursorColor: Color(0xff669E76),

                              controller: PhoneController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'اكتب رقم المحمول';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'المحمول',
                                prefixIcon: Icon(
                                  Icons.location_city,
                                  color: Color(0xff669E76),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(
                                //     color: Color(0xffD6A4DE),
                                //   ),
                                //   borderRadius: BorderRadius.all(Radius.circular(20)),
                                // ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff669E76),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: BlocBuilder<Travel_Desc_Cubit, Travel_Desc_States>(
                  builder: (context, state) {
                    return CustomAnimatedButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          Travel_Desc_Cubit.get(context).AddUser(
                              travelModel: travelModel,
                              Name: NameController.text,
                              country: countryController.text,
                              phone: PhoneController.text);
                          navigateAndFinish(context, Bus_View());
                        }
                      },
                      widget: Text("اضافه"),
                      ButtonHight: 80,
                      Buttonwidth: 80,
                      backgroundcolor: Color(0xff669E76),
                      shape: BoxShape.rectangle,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
