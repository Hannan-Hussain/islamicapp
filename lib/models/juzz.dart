class JuzModel {
  final int juzNumber;
  final List<JuzAyahs> ayahs;

  JuzModel({
    required this.juzNumber,
    required this.ayahs,
  });

  factory JuzModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    final ayahsList = (data['ayahs'] as List)
        .map((e) => JuzAyahs.fromJson(e))
        .toList();

    return JuzModel(
      juzNumber: data['number'] as int,
      ayahs: ayahsList,
    );
  }
}

class JuzAyahs {
  final int number;
  final String text;
  final String surahName;
  final int surahNumber;

  JuzAyahs({
    required this.number,
    required this.text,
    required this.surahName,
    required this.surahNumber,
  });

  factory JuzAyahs.fromJson(Map<String, dynamic> json) {
    return JuzAyahs(
      number: json['number'] as int,
      text: json['text'] as String,
      surahName: json['surah']['name'] as String,
      surahNumber: json['surah']['number'] as int,
    );
  }
}