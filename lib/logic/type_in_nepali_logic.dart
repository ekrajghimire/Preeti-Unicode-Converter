String typeInNepali(String text) {
  // Mapping Romanized Nepali to Nepali script (स्वर वर्ण & व्यञ्जन)
  Map<String, String> romanToNepaliMap = {
    // Vowels (स्वर वर्ण)
    'a': 'अ', 'aa': 'आ', 'i': 'इ', 'ii': 'ई', 'u': 'उ', 'uu': 'ऊ', 'e': 'ए',
    'ai': 'ऐ', 'o': 'ओ', 'au': 'औ',
    'am': 'अं', 'an': 'अं', 'aha': 'अः', 'ri': 'ऋ',

    // Consonants (व्यञ्जन)
    'ka': 'क', 'kha': 'ख', 'ga': 'ग', 'gha': 'घ', 'nga': 'ङ',
    'cha': 'च', 'chha': 'छ', 'ja': 'ज', 'jha': 'झ', 'nya': 'ञ',
    'ta': 'ट', 'tha': 'ठ', 'da': 'ड', 'dha': 'ढ', 'ana': 'ण',
    't': 'त', 'th': 'थ', 'd': 'द', 'dh': 'ध', 'n': 'न',
    'pa': 'प', 'fa': 'फ', 'ba': 'ब', 'bha': 'भ', 'ma': 'म',
    'ya': 'य', 'ra': 'र', 'la': 'ल', 'wa': 'व', 'sha': 'श',
    'SHA': 'ष', 'sa': 'स', 'ha': 'ह', 'kshya': 'क्ष', 'tra': 'त्र',
    'gyna': 'ज्ञ',

    // Special cases (handling for combined syllables like "mero" -> "मेरो")
    'mer': 'मेर',
    'ne': 'ने',
    'ko': 'को',
    'cha': 'छ',
    'ta': 'त',
    'ra': 'र',
  };

  // Replace Romanized words with Nepali script
  String converted = text;

  // Sort keys by length to replace longer syllables first to avoid partial replacements
  List<String> sortedKeys = romanToNepaliMap.keys.toList();
  sortedKeys.sort(
      (a, b) => b.length.compareTo(a.length)); // Sort from longest to shortest

  // Replace the Roman characters with Nepali script using the map
  for (String roman in sortedKeys) {
    converted = converted.replaceAll(
        RegExp(roman, caseSensitive: false), romanToNepaliMap[roman]!);
  }

  // Return the converted Nepali text
  return converted;
}
