import 'package:test_app/modules/home_page/data/model/logistic_model.dart';
import 'package:test_app/modules/home_page/domain/entity/logistic_entity.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LogisticRepository {
  Future<List<LogisticEntity>> getLogistic() async {
    final jsonString = await rootBundle.loadString('assets/json/logistic_data.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((json) => LogisticModel.fromJson(json)).toList();
  }
}