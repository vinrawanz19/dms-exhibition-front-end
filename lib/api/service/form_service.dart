import 'package:dio/dio.dart';
import 'package:indomobil_exhibition_front_end/api/api_config.dart';
import 'package:indomobil_exhibition_front_end/models/form_model.dart';

class FormService {
  static Future<void> createForm(FormModel data) async {
    try {
      var response =
          await request(ApiConfig.baseUrlForm, "POST", data.toJson());
      if (response.data != null) {
        print("Success submit form");
      }
    } catch (e) {
      if (e is DioException) {
        throw (e.response!.data["detail"].toString());
      } else {
        throw (e);
      }
    }
  }
}
