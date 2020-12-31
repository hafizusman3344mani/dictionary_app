import 'term.dart';

class DefineTermResponse {
  List<Term> list;
  DefineTermResponse({this.list});

  factory DefineTermResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] is List) {
      final list = json['list'] as List;
      final objectList = list.cast<Map<String, dynamic>>();
      final termList = objectList.map((e) => Term.fromJson(e));
      return DefineTermResponse(list: termList.toList());
    } else {
      throw Exception('No List in Response');
    }
  }
}
