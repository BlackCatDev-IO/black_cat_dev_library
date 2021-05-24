import 'states.dart';

class USStates {
  /// Takes case-insensitive name of state and returns abbreviation.
  ///
  /// If abbreviation is not found, empty string is returned.
  static String getAbbreviation(String stateName) {
    final name = stateName.trim().toLowerCase();

    return states.keys.firstWhere((key) => states[key]!.toLowerCase() == name,
        orElse: () => "");
  }

  /// Takes case-insensitive abbreviation of state and returns name.
  ///
  /// If name is not found, unchanged argument is returned
  static String getName(String stateAbbreviation) {
    final abbrev = stateAbbreviation.toUpperCase();

    if (states.containsKey(abbrev)) {
      return states[abbrev]!;
    }

    return stateAbbreviation;
  }

  /// Returns list of all abbreviations.
  static List<String> getAllAbbreviations() {
    return states.keys.toList();
  }

  /// Returns list of all names.
  static List<String> getAllNames() {
    return states.values.toList();
  }

  /// Returns map of Abbreviations as Keys and Names as Values.
  static Map<String, String> getAbbreviationMap() {
    return states;
  }

  /// Returns map of Names as Keys and Abbreviations as Values.
  static Map<String, String> getNameMap() {
    final nameMap = <String, String>{};

    states.forEach((key, value) {
      nameMap[value] = key;
    });

    return nameMap;
  }
}
