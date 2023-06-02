import 'dart:convert';

import 'package:covid_api/modal/covidDataModal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper();
  CovidDataModal covidDataModal = CovidDataModal();
  String link = "https://covid-193.p.rapidapi.com/statistics";

  Future<CovidDataModal> getData() async {
    var response = await http.get(Uri.parse(link),headers: {
      "X-RapidAPI-Key":"6f97230f13msh3fdbd52643a9adap18facdjsn2e3fa5540899",
      "X-RapidAPI-Host":"covid-193.p.rapidapi.com",
    });
    var cjson = jsonDecode(response.body);
    covidDataModal = CovidDataModal.fromJson(cjson);
    print(covidDataModal.parameters);
    return covidDataModal;
  }
}
