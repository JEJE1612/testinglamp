import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'lamp_state.dart';

class LampCubit extends Cubit<LampState> {
  LampCubit() : super(LampInitial());
  bool? showOn = false;
  bool? On = false;
  late Timer _timer;
  final String authToken =
      'UrmcUhJPbHf5Us7P6IDBO5EZ6AI3gdN4'; // Replace with your Auth Token
  final String baseUrl = 'https://sgp1.blynk.cloud';

  Future<void> apiturnOffMyLamp() async {
    showOn = true;

    final response = await http.get(Uri.parse(
        '$baseUrl/external/api/update?token=$authToken&pin=v0&value=0'));
  }

  bool? onclick ;
  void onSwitch() {
    onclick != onclick;
    emit(loadingData());
    if (showOn == false) {
      apiturnOnMyLamp();
      emit(turnOnMyLamp());
    } else {
      apiturnOffMyLamp();
      emit(turnOnMyLamp());
    }
  }

  Future<void> apiturnOnMyLamp() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/external/api/update?token=$authToken&pin=v0&value=1'));
  }

  bool? dublicute() {
    bool? on;
    _timer = Timer.periodic(Duration(milliseconds: 1), (Timer timer) {
      on = apifetchData() as bool;
    });
    return on;
  }

  Future<bool> apifetchData() async {
    final response = await http
        .get(Uri.parse('$baseUrl/external/api/get?token=$authToken&pin=v0'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data as int == 0) {
        return false;
      } else {
        return true;
      }
    } else {
      // Handle error
      throw Exception('Failed to load lamp status');
    }
  }
}
