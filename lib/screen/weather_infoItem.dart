import 'package:flutter/material.dart';

class WeatherInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherInfoItem({
    required this.icon,
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.grey[500], fontSize: 16),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}