import 'package:covid_api/modal/covidDataModal.dart';
import 'package:covid_api/utils/apiHelper.dart';
import 'package:flutter/foundation.dart';

class CovidProvider extends ChangeNotifier {
  CovidDataModal covidDataModal = CovidDataModal();

  Future<CovidDataModal> data() async {
    covidDataModal = await ApiHelper.apiHelper.getData();
    notifyListeners();
    return covidDataModal;
  }
}
