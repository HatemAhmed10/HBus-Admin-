import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/4Bus/Bus_cubit.dart';
import '../../../business_logic/4Bus/Bus_state.dart';
import '../../../shared/components/1Tooles/1CustomButton.dart';

class BottomSheetBody_screen extends StatelessWidget {
  final BuildContext context2;

  BottomSheetBody_screen({
    super.key,
    required this.context2,
  });

  var countryController = TextEditingController();
  var TimeController = TextEditingController();
  var SalaryController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Bus_Cubit(),
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

                              controller: countryController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'اكتب اسم الرحله';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'الاتجاه',
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

                              controller: TimeController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'اكتب وقت الرحله';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'الوقت',
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

                              controller: SalaryController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'اكتب سعر الرحله';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'السعر',
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
                child: BlocBuilder<Bus_Cubit, Bus_States>(
                  builder: (context, state) {
                    return CustomAnimatedButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          Bus_Cubit.get(context).addTravel(
                              country: countryController.text,
                              Time: TimeController.text,
                              salary: SalaryController.text);

                          Navigator.pop(context);
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
