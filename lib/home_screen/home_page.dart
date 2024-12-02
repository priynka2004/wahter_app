import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wahter_app/home_screen/forcast_screen.dart';

import '../services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService weatherService = WeatherService();
  String city = 'Bhiwani';
  Map<String, dynamic>? currentWeather;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      final weatherData = await weatherService.fetchCurrentWeather(city);
      setState(() {
        currentWeather = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  void showCitySelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter City Name'),
          content: TypeAheadField(
            suggestionsCallback: (pattern) async {
              return await weatherService.fetchCitySuggestions(pattern);
            },
            builder: (context, controller, focusNode) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                ),
              );
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion['name']),
              );
            },
            onSelected: (city) {
              setState(() {
                city = city['name'];
              });
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  fetchWeather();
                },
                child: const Text('Submit')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentWeather == null
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
                )),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(20),
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
                )),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: showCitySelectionDialog,
                      child: Text(
                        city,
                        style: GoogleFonts.lato(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Image.network(
                            'http:${currentWeather!['current']['condition']['icon']}',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            '${currentWeather!['current']['temp_c'].round()}C',
                            style: GoogleFonts.lato(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${currentWeather!['current']['condition']['text']}',
                            style: GoogleFonts.lato(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          currentWeather == null
                              ? const CircularProgressIndicator()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Max: ${currentWeather!['forecast']?['forecastday'][0]['day']['maxtemp_c'].round() ?? 'N/A'}C',
                                      style: GoogleFonts.lato(
                                        fontSize: 22,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Min: ${currentWeather!['forecast']?['forecastday'][0]['day']['mintemp_c'].round() ?? 'N/A'}C',
                                      style: GoogleFonts.lato(
                                        fontSize: 22,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildWeatherDetail(
                            'Sunrise',
                            Icons.wb_sunny,
                            currentWeather!['forecast']['forecastday'][0]
                                ['astro']['sunrise']),
                        buildWeatherDetail(
                            'Sunset',
                            Icons.brightness_3,
                            currentWeather!['forecast']['forecastday'][0]
                                ['astro']['sunset'])
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildWeatherDetail(
                          'Humidity',
                          Icons.opacity,
                          currentWeather!['current']['humidity'],
                        ),
                        buildWeatherDetail(
                          'Wind (KPH)',
                          Icons.wind_power,
                          currentWeather!['current']['wind_kph'],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForcastScreen(
                                  city: city,
                                ),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A2344)),
                        child: const Text(
                          'Next 7 Days Forecast',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }

  Widget buildWeatherDetail(String label, IconData icon, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
          child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 110,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    const Color(0xFF1A2344).withOpacity(0.5),
                    const Color(0xFF1A2344).withOpacity(0.2),
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                label,
                style: GoogleFonts.lato(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                value is String ? value : value.toString(),
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
