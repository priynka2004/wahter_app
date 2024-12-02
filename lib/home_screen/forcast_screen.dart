import 'package:flutter/material.dart';
import 'dart:ui'; // Import for BackdropFilter
import 'package:google_fonts/google_fonts.dart';

import '../services/weather_service.dart';

class ForcastScreen extends StatefulWidget {
  final String city;

  const ForcastScreen({super.key, required this.city});

  @override
  State<ForcastScreen> createState() => _ForcastScreenState();
}

class _ForcastScreenState extends State<ForcastScreen> {
  final WeatherService weatherService = WeatherService();
  List<dynamic>? forecast;

  @override
  void initState() {
    super.initState();
    fetchForecast();
  }

  Future<void> fetchForecast() async {
    try {
      final forecastData = await weatherService.fetch7DayForecast(widget.city);
      setState(() {
        forecast = forecastData['forecast']['forecastday'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: forecast == null
          ? Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A2344),
              Color.fromARGB(255, 125, 32, 142),
              Colors.purple,
              Color.fromARGB(255, 151, 44, 170),
            ],
          ),
        ),
        child: Center(child: CircularProgressIndicator()),
      )
          : Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A2344),
              Color.fromARGB(255, 125, 32, 142),
              Colors.purple,
              Color.fromARGB(255, 151, 44, 170),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "7 Days Forecast",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: forecast!.length,
                itemBuilder: (context, index) {
                  final day = forecast![index];
                  final iconUrl = 'http:${day['day']['condition']['icon']}';
                  final date = day['date'];
                  final maxTemp = day['day']['maxtemp_c'];
                  final minTemp = day['day']['mintemp_c'];
                  final condition = day['day']['condition']['text'];

                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                              colors: [
                                const Color(0xFF1A2344).withOpacity(0.5),
                                const Color(0xFF1A2344).withOpacity(0.2),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                iconUrl,
                                width: 50,
                                height: 50,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    color: Colors.white,
                                  );
                                },
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    date,
                                    style: GoogleFonts.lato(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    condition,
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    'Max: $maxTemp°C, Min: $minTemp°C',
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
