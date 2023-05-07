import 'package:flutter/material.dart';

import '../../../data/models/1Travel_Model.dart';

class Travel_Desc_View extends StatelessWidget {
  final TravelModel travels;

  Travel_Desc_View({
    super.key,
    required this.travels,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(travels.country.toString()),
      ),
    );
  }
}
