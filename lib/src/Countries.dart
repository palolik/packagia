import 'package:flutter/material.dart';
import '/Data/Country.dart';
import '/Data/api_service.dart';

class CountryPack extends StatefulWidget {
  const CountryPack({super.key});

  @override
  State<CountryPack> createState() => _CountryPackState();
}

class _CountryPackState extends State<CountryPack> {
  List<Country> countries = [];

  @override
  void initState() {
    super.initState();
    _fetchCountries();
  }

  void _fetchCountries() async {
    try {
      List<Country> fetched = await fetchCountries();
      setState(() {
        countries = fetched;
      });
    } catch (e) {
      print('Error fetching countries: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return countries.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'From git package testing',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 325,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return Card(
                color: Colors.redAccent,
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          country.flag,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              country.name,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('Capital: ${country.capital}'),
                            Text('Region: ${country.region}'),
                            Text('Population: ${country.population}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
