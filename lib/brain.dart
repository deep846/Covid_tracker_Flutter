import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppBrain {
  String countryname = "india";
  AppBrain(String countryname){
    this.countryname = countryname;
  }
  Future loaddata() async {
    http.Response response = await http.get(
      Uri.parse('https://disease.sh/v3/covid-19/countries/$countryname'),
    );
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      // print(data['cases']);
      return data;
    }
    else{

    }
  }
}
