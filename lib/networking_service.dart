import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urban_dictionary/define_term_response.dart';
import 'package:urban_dictionary/term.dart';

class NetworkingService {
  Future<List<Term>> defineTerm(String searchedTerm) async {
    final queryParameters = {'term': searchedTerm};
    final uri = Uri.https('mashape-community-urban-dictionary.p.rapidapi.com',
        'define', queryParameters);
    final headers = {
      "x-rapidapi-key": "f151d9fa4bmsh216400c34de3529p18d6d7jsn29c196780368",
      "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com"
    };
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body);
      final defineTermResponse = DefineTermResponse.fromJson(decodedBody);
      return defineTermResponse.list;
    } else {
      throw Exception('Failed to define term');
    }
  }
}
