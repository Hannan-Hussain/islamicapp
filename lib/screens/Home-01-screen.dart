import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';


class Home01screen extends StatefulWidget {
  const Home01screen({super.key});

  @override
  State<Home01screen> createState() => _Home01screenState();
}

class _Home01screenState extends State<Home01screen> {
  

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal("ar"); 

  var _size = MediaQuery.of(context).size;
  var _hijri = HijriCalendar.now();

  var day = DateTime.now(); 
  var format = DateFormat("EEE, d MMM y"); 
  var formatted = format.format(day);
    return SafeArea(

      child: Scaffold(
        body: Stack(
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
                Text(formatted, style: TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.bold)),

                 
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all( 4.0),
                            child: Text(
                              _hijri.hDay.toString(),style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              
                              ),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.longMonthName,
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: TextStyle(fontSize: 20, ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${_hijri.hYear} AH",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                         
                        ),
                      ],
                    ),
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
