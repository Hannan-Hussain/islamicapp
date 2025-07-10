import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:islamicapp/constants/constants.dart';
import 'package:islamicapp/models/aya_0f_the_day.dart';
import 'package:islamicapp/models/juzz.dart';
import 'package:islamicapp/models/sajda.dart';
import 'package:islamicapp/models/surah.dart';
import 'package:islamicapp/widgets/sajda_custom.dart';

class ApiServices {
  final String surahEndpoint = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  /// Get a random Aya of the Day
  Future<AyaOfTheDay> getAyaOfTheDay() async {
    int ayahNumber = random(1, 6236); // Total ayahs = 6236
    String url =
        "https://api.alquran.cloud/v1/ayah/$ayahNumber/editions/quran-uthmani,en.asad,en.pickthall";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load Aya");
      throw Exception("Failed to Load Aya of the Day");
    }
  }

  /// Get list of Surahs
  Future<List<Surah>> getSurah() async {
    final response = await http.get(Uri.parse(surahEndpoint));
    list.clear(); // Optional: Clear old data before re-adding

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      print('Loaded ${list.length} Surahs');
      return list;
    } else {
      throw Exception("Can't get the Surah");
    }
  }
  
  Future<List<SajdaAyat>> getSajda() async {
    const url = "https://api.alquran.cloud/v1/sajda/en.asad";
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final ayahs = json['data']['ayahs'] as List;
      
      return ayahs.map((ayah) => SajdaAyat.fromJson(ayah)).toList();
    } else {
      throw Exception('Failed to load Sajda verses');
    }
  }
 
  Future<JuzModel> getJuz(int juzNumber) async {
    final response = await http.get(Uri.parse(Constants.getJuzApiUrl(juzNumber)));
    
    if (response.statusCode == 200) {
      return JuzModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load juz $juzNumber');
    }
  }

  /// Random int generator
  int random(int min, int max) {
    var rn = Random();
    return min + rn.nextInt(max - min + 1);
  }

}
