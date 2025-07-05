class AyaOfTheDay {
  String? arText;
  String? enTran;
  int? surNumber;
  String? surEnName;

  AyaOfTheDay({
    this.arText,
    this.enTran,
    this.surNumber,
    this.surEnName,
  });

  factory AyaOfTheDay.fromJSON(Map<String, dynamic> json) {
    final data = json['data'];

    // Safely read from editions
    final arabic = data[0];
    final english = data[1];

    return AyaOfTheDay(
      arText: arabic['text'],
      enTran: english['text'],
      surNumber: arabic['surah']?['number'],
      surEnName: arabic['surah']?['englishName'],
    );
  }
}
