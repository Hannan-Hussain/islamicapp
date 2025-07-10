import 'package:flutter/material.dart';
import 'package:islamicapp/models/juzz.dart';
import 'package:islamicapp/services/services.dart';
import 'package:islamicapp/widgets/juz_custom.dart';


class JuzScreen extends StatefulWidget {
  static const String id = 'juz_screen';
  final int juzNumber;

  const JuzScreen({Key? key, required this.juzNumber}) : super(key: key);

  @override
  State<JuzScreen> createState() => _JuzScreenState();
}

class _JuzScreenState extends State<JuzScreen> {
  late Future<JuzModel> _juzFuture;
  final ApiServices apiServices = ApiServices();


  @override
  void initState() {
    super.initState();
    _juzFuture = apiServices.getJuz(widget.juzNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Juz ${widget.juzNumber}'),
        
      ),
      body: FutureBuilder<JuzModel>(
        future: _juzFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.ayahs.length,
              itemBuilder: (context, index) {
                return JuzCustomTile(
                  ayah: snapshot.data!.ayahs[index],
                  index: index,
                );
              },
            );
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}