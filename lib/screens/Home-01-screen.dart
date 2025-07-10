import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:islamicapp/models/aya_0f_the_day.dart';
import 'package:islamicapp/services/services.dart';

class Home01screen extends StatefulWidget {
  const Home01screen({super.key});

  @override
  State<Home01screen> createState() => _Home01screenState();
}

class _Home01screenState extends State<Home01screen> {
  ApiServices _apiServices = ApiServices();
  // AyaOfTheDay? data;

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal("ar");

    var _size = MediaQuery.of(context).size;
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat("EEE, d MMM y");
    var formatted = format.format(day);

    // _apiServices.getAyaOfTheDay().then((value) => data = value);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/background_img.jpg"),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
   children: [
  SizedBox(height: 60),
  Padding(
    padding: const EdgeInsets.only(left: 8.0), 
    child: Text(
      formatted,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                _hijri.hDay.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                _hijri.longMonthName,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "${_hijri.hYear} AH",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
                child: Column(
                  children: [
                    FutureBuilder<AyaOfTheDay>(
                      future: _apiServices.getAyaOfTheDay(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Icon(Icons.sync_problem);
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return CircularProgressIndicator();
                          case ConnectionState.done:
                            if (!snapshot.hasData || snapshot.data == null) {
                              return Text("No data found");
                            }
                            final aya = snapshot.data!;
                            return Container(

                              margin: EdgeInsetsDirectional.all(16),
                              padding: EdgeInsetsDirectional.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: Offset(0,1),
                                  )

                                ]
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Quran Aya Of The Day",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    thickness: 0.5,
                                  ),
                                  Text(
                                    aya.arText ?? '',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    snapshot.data!.enTran ?? '',
                                    style: TextStyle(color: Colors.black),
                                    
                                  ),
                                  RichText(
                                    text: TextSpan(children: <InlineSpan>[
                                      WidgetSpan(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            snapshot.data!.surNumber?.toString() ?? '',  style: TextStyle(fontSize: 14),),
                                      )),
                                      WidgetSpan(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                            Text(snapshot.data!.surEnName?.toString() ?? '', style: TextStyle(fontSize: 14),),
                                      )),
                                    ]),
                                  ),
                                ],
                              ),
                            );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
