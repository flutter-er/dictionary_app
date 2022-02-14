import 'dart:io';

import 'package:dictionary_app/model/word_model.dart';
import 'package:dictionary_app/service/http_service.dart';

class WordRepository {
  Future<List<WordResponse>?> getWordsFromDictionary(String query) async {
    try {
      final response = await HttpRequest.getRequest("en_US/$query");

      if (response.statusCode == 200) {
        final result = wordResponseFromJson(response.body);
        return result;
      }else {
        return null;
      }
    } on SocketException catch (e) {
      throw e ;

    }on HttpException catch (e) {
      throw e ;

    }on FormatException  catch (e) {
      throw e ;

    }
  }
}
