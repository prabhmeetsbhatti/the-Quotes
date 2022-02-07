class NullChecker {
  static dynamic check(dynamic input) =>
      input != null && input != '' && input.toString() != '[]' ? input : null;
}

dynamic getTranslatedField(dynamic json, String key, String language, {dynamic whenNull}) {
  String fieldKey;
  if (language == 'de') {
    fieldKey = key;
  } else {
    fieldKey = '${key}_$language';
  }

  return NullChecker.check(json[fieldKey]) ?? whenNull;
}
