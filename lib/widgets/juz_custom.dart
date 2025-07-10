import 'package:flutter/material.dart';
import 'package:islamicapp/models/juzz.dart';
// import '../models/juz_model.dart';

class JuzCustomTile extends StatelessWidget {
  final JuzAyahs ayah;
  final int index;

  const JuzCustomTile({
    Key? key,
    required this.ayah,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ayah.text,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Kitab',
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 8),
            Text(
              'Surah ${ayah.surahName} (${ayah.surahNumber}) - Ayah ${ayah.number}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}