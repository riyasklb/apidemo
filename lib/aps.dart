import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:httpp/numberfactresponse/numberfactresponse.dart';

//final _data = Numberfactresponse.fromJson(_bodyasjson);
Future<Numberfactresponse> getnumber({required String num}) async {
  final _response =
      await http.get(Uri.parse('http://numbersapi.com/$num?json'));
  final _bodyasjson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = Numberfactresponse.fromJson(_bodyasjson);
  return _data;
}
