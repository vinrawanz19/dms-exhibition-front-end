import 'package:indomobil_exhibition_front_end/api/api_config.dart';
import 'package:indomobil_exhibition_front_end/models/content_model.dart';

class ContentService {
  static Future<ContentModel> getContent(String companyId) async {
    try {
      var response =
          await request("${ApiConfig.baseUrlContent}/$companyId", "GET", null);

      ContentModel data = ContentModel.fromJson(response.data);
      return data;
    } catch (e) {
      throw ("404 - Get content failed, please refresh to fetch data");
    }
  }
}
