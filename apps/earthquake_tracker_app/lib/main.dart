import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import '/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<Map<String, String>> _earthquakes = [];
  int _lowValue = 0;
  int _highValue = 10;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {});
    final response = await http
        .get(Uri.parse('https://deprem.afad.gov.tr/last-earthquakes.html'));
    final document =
        parse(utf8.decode(response.bodyBytes, allowMalformed: true));
    final rows = document.querySelectorAll('table tr');
    _earthquakes.clear();
    for (final row in rows) {
      final cells = row.querySelectorAll('td');
      if (cells.isNotEmpty) {
        final time = cells[0].text.trim();
        final magnitude =
            double.tryParse(cells[5].text.trim().replaceAll(',', '.'));
        final location = cells[6].text.trim();
        _earthquakes.add({
          'time': time,
          'magnitude': magnitude!.toStringAsFixed(1),
          'location': location,
        });
      }
    }
    setState(() {});
  }

  List<Map<String, String>> _getFilteredEarthquakes() {
    return _earthquakes.where((earthquake) {
      final magnitude =
          double.tryParse(earthquake['magnitude']!.replaceAll(',', '.'));
      return magnitude != null &&
          magnitude >= _lowValue &&
          magnitude <= _highValue;
    }).toList();
  }

  void _updateRangeValues(RangeValues values) {
    setState(() {
      _lowValue = values.start.toInt();
      _highValue = values.end.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredEarthquakes = _getFilteredEarthquakes();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          elevation: 2,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appBarTitle),
        ),
        body: RefreshIndicator(
          onRefresh: _fetchData,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: filteredEarthquakes.length,
                  itemBuilder: (context, index) {
                    final earthquake = filteredEarthquakes[index];
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                        leading: Text(
                          earthquake['magnitude']!,
                          style: const TextStyle(
                            fontSize: 40,
                            color: textColor,
                          ),
                        ),
                        title: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              earthquake['location']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            )),
                        subtitle: Align(
                            heightFactor: 1.7,
                            alignment: Alignment.bottomRight,
                            child: Text(
                              (earthquake['time'])!.substring(5, 16),
                              style: const TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: sliderBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$_lowValue'),
                    Expanded(
                      child: RangeSlider(
                        activeColor: sliderActiveColor,
                        inactiveColor: sliderInactiveColor,
                        values: RangeValues(
                          _lowValue.toDouble(),
                          _highValue.toDouble(),
                        ),
                        min: sliderMinRange,
                        max: sliderMaxRange,
                        onChanged: _updateRangeValues,
                        labels: RangeLabels('$_lowValue', '$_highValue'),
                      ),
                    ),
                    Text('$_highValue'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
