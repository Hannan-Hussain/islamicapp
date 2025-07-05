import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:islamicapp/models/aya_0f_the_day.dart';

class ApiServices {
  Future<AyaOfTheDay> getAyaOfTheDay() async {
    int ayahNumber = random(1, 6236); // 6236 is last ayah in Quran
    String url =
        "https://api.alquran.cloud/v1/ayah/$ayahNumber/editions/quran-uthmani,en.asad,en.pickthall";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load");
      throw Exception("Failed to Load Post");
    }
  }
}

int random(int min, int max) {
  var rn = Random();
  return min + rn.nextInt(max - min + 1); // +1 to include max
}
