class Constants {
  static int currentJuzIndex = 1;
  static const int totalJuzCount = 30;
  static const String baseApiUrl = 'https://api.alquran.cloud/v1';
  
  static String getJuzApiUrl(int juzNumber) {
    return '$baseApiUrl/juz/$juzNumber/quran-uthmani';
  }
}