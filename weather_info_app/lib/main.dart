import 'dart:math';  // For generating random values
import 'package:flutter/material.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = '';
  String weatherCondition = 'Unknown';
  String temperature = '--';

  final TextEditingController cityController = TextEditingController();

  // Function to simulate fetching weather data
  void fetchWeather() {
    setState(() {
      // Get the entered city name
      cityName = cityController.text;

      // Generate a random temperature between 15°C and 30°C
      Random random = Random();
      int randomTemp = 15 + random.nextInt(16); // Generates a random int between 15 and 30
      temperature = '$randomTemp°C';

      // Randomly select a weather condition from sunny, cloudy, and rainy
      List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];
      weatherCondition = weatherConditions[random.nextInt(weatherConditions.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field for city name
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Button to fetch weather data
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 32),
            // Displaying the fetched weather data
            Text(
              'City: $cityName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Temperature: $temperature',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Weather Condition: $weatherCondition',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
