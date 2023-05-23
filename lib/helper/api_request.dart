import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

//Api class kullanark istek atip cevap/response alabiliriz
// ve her sayfada response.status if else ile kontrol etmek zorunda kalmayacz
class Api {
//after i put the headers and params and the given url information i got the response.bode
  Future<dynamic> get({required String muscle, required String type,var name}) async {
    final Uri uri = Uri.https(
      url,
      '/v1/exercises',
      {
        'muscle': muscle,
        'type': type,
        'name':name
      },
    );
    final response = await http.get(
      uri,
      headers: {
        "X-RapidAPI-Key": apiKey,
        "X-RapidAPI-Host": apiHost,
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
}
