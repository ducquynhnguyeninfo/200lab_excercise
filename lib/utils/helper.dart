import 'dart:convert';

import 'dart:math';

class Helper {
  static tryParseJson(json) {
    try {
      dynamic result = jsonDecode(json);
      return result;
    } catch (e) {
      return json;
    }
  }
}
