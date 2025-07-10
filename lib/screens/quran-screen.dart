import 'package:flutter/material.dart';
import 'package:islamicapp/constants/constants.dart';
import 'package:islamicapp/models/sajda.dart';
import 'package:islamicapp/models/surah.dart';
import 'package:islamicapp/services/services.dart';
import 'package:islamicapp/widgets/sajda_custom.dart';
import 'package:islamicapp/widgets/surah_custom.tile.dart';
import 'package:islamicapp/screens/juzz_screen.dart'; // Make sure JuzScreen is imported

class Quranscreen extends StatefulWidget {
  const Quranscreen({super.key});

  @override
  State<Quranscreen> createState() => _QuranscreenState();
}

class _QuranscreenState extends State<Quranscreen> {
  final ApiServices apiServices = ApiServices();
  late Future<List<SajdaAyat>> futureSajda;

  @override
  void initState() {
    super.initState();
    futureSajda = apiServices.getSajda();
  }

  Future<void> _refreshSajdaData() async {
    setState(() {
      futureSajda = apiServices.getSajda();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Quran",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Surah",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Sajda",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Juzz",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              // Surah Tab
              FutureBuilder<List<Surah>>(
                future: apiServices.getSurah(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => surahcustomlistTile(
                        surah: snapshot.data![index],
                        context: context,
                        ontap: () {
                          // Handle surah tap
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text("No Data Found"));
                  }
                },
              ),

              // Sajda Tab
              FutureBuilder<List<SajdaAyat>>(
                future: futureSajda,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Error: ${snapshot.error}'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _refreshSajdaData,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: _refreshSajdaData,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => sajdacustomlistTile(
                          sajdaAyat: snapshot.data![index],
                          context: context,
                          ontap: () {
                            // Handle sajda verse tap
                          },
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: Text('No data found'));
                  }
                },
              ),

              // Juzz Tab
              GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: Constants.totalJuzCount,
                itemBuilder: (context, index) {
                  final juzNumber = index + 1;
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        JuzScreen.id,
                        arguments: juzNumber,
                      );
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Juz $juzNumber',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
