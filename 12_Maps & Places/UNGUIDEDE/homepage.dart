import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  String? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Picker'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: PlacePicker(
              apiKey: "AIzaSyDnMSXHj0llqiRkJpJZpMzNEoYJ34f8FxM",
              onPlacePicked: (LocationResult result) {
                setState(() {
                  selectedAddress = result.formattedAddress;
                });
              },
              initialLocation:
                  const LatLng(-7.4350662019925515, 109.24915663879061),
              searchInputConfig: const SearchInputConfig(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                autofocus: false,
                textDirection: TextDirection.ltr,
              ),
              searchInputDecorationConfig: const SearchInputDecorationConfig(
                hintText: "Search for a building, street or ...",
              ),
              enableNearbyPlaces: true,
              showSearchInput: true,
            ),
          ),
          if (selectedAddress != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Selected Address: $selectedAddress',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
