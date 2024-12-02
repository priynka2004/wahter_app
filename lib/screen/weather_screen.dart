import 'package:flutter/material.dart';
import 'package:wahter_app/screen/weather_infoItem.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Weather ',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),actions: [
        Icon(
          Icons.location_on,
          color: Colors.white,
        ), SizedBox(width: 10),
        Icon(
          Icons.search,
          color: Colors.white,
        ), SizedBox(width: 10),
      ],
        backgroundColor: Colors.black,
       // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                "City Name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Partly Cloudy",
              style: TextStyle(fontSize: 18, color: Colors.grey[500]),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.wb_sunny,
              size: 80,
              color: Colors.orangeAccent,
            ),
            SizedBox(height: 20),
            Text(
              "25°C",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Feels like 27°C",
              style: TextStyle(fontSize: 18, color: Colors.grey[500]),
            ), SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherInfoItem(
                  icon: Icons.air,
                  label: "Wind",
                  value: "15 km/h",
                ),
                WeatherInfoItem(
                  icon: Icons.opacity,
                  label: "Humidity",
                  value: "60%",
                ),
                WeatherInfoItem(
                  icon: Icons.thermostat,
                  label: "Pressure",
                  value: "1013 hPa",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
