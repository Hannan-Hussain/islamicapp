class SajdaAyat {
  final int number;
  final String text;
  final String surahName;
  final String surahEnglishName;
  final String surahEnglishTranslation;
  final String revelationType;
  final int juzzNumber;
  final int manzilNumber;
  final int rukuNumber;
  final int sajdaNumber;

  const SajdaAyat({
    required this.number,
    required this.text,
    required this.surahName,
    required this.surahEnglishName,
    required this.surahEnglishTranslation,
    required this.revelationType,
    required this.juzzNumber,
    required this.manzilNumber,
    required this.rukuNumber,
    required this.sajdaNumber,
  });

  factory SajdaAyat.fromJson(Map<String, dynamic> json) {
    final sajdaData = json['sajda'];
    
    return SajdaAyat(
      number: json['number'] as int? ?? 0,
      text: json['text'] as String? ?? '',
      surahName: json['surah']['name'] as String? ?? '',
      surahEnglishName: json['surah']['englishName'] as String? ?? '',
      surahEnglishTranslation: 
      json['surah']['englishNameTranslation'] as String? ?? '',
      revelationType: json['surah']['revelationType'] as String? ?? '',
      juzzNumber: json['juzz'] as int? ?? 0,
      manzilNumber: json['manzil'] as int? ?? 0,
      rukuNumber: json['ruku'] as int? ?? 0,
      sajdaNumber: (sajdaData is Map<String, dynamic>) 
      ? sajdaData['id'] as int? ?? 0 
      : 0,
    );
  }
}