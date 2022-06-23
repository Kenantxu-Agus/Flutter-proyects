import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/change_model.dart';
import '../utilities/constants.dart';

class NetworkingService {
  static Future<ChangeModel> getChanges(String base, String quote) async {
    String url = '${urlBaseChange}/$base/$quote?apikey=$apiKey';

    print('accediendo a la url: $url');
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ChangeModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      return Future.error(
          'Codigo de respuesta diferente a 200: ${response.statusCode}');
    }
  }
}
