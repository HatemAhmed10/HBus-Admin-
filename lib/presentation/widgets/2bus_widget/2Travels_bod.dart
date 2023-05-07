import 'dart:math';

import 'package:admin/data/models/2Users_Model.dart';
import 'package:admin/shared/components/1Tooles/3CustomFormField.dart';
import 'package:admin/shared/components/1Tooles/5Custom_Navigate.dart';
import 'package:admin/shared/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import '../../../data/models/1Travel_Model.dart';
import '../../../shared/styles/assets_manager.dart';
import '../../screens/5Travel_Desc_Screen/Travel_Desc_View.dart';

class Travels_Body extends StatelessWidget {
  final TravelModel travels;

  Travels_Body({
    super.key,
    required this.travels,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                child: Text(
                  travels.Time.toString(),
                  style: TextStyle(
                      fontSize: 20, fontFamily: "bold", color: Colors.white),
                ),
                backgroundColor: Color(0xff669E76),
              ),
            ),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(travels.country.toString()),
                  Text('ج ${travels.salary.toString()}'),
                ],
              ),
            ),
            subtitle: Container(
                // color: Colors.yellow,
                // alignment: Alignment.centerLeft,
                height: 250,
                width: 200,
                child: Image(image: TravelImage[Random().nextInt(4)])),
            onTap: () {
              navigateTo(
                  context,
                  Travel_Desc_View(
                    travels: travels,
                  ));
            },
          ),
          CustomDivider(color: Colors.grey, height: 3)
        ],
      ),
    );
  }
}
