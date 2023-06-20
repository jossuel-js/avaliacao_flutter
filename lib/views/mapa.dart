import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFPI MAPS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-5.088569, -42.810535);

  Set<Marker> _allMarkers = {
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.773972, -122.431297),
      infoWindow: InfoWindow(title: 'Marker 1'),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(37.774979, -122.419469),
      infoWindow: InfoWindow(title: 'Marker 2'),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(37.775555, -122.415526),
      infoWindow: InfoWindow(title: 'Marker 3'),
    ),
  };

  Set<Marker> _filteredMarkers = {};

  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _filterMarkers(String searchTerm) {
    setState(() {
      _filteredMarkers = _allMarkers.where((marker) {
        final title = marker.infoWindow!.title;
        return title!.toLowerCase().contains(searchTerm.toLowerCase());
      }).toSet();
    });

    if (_filteredMarkers.isNotEmpty) {
      final marker = _filteredMarkers.first;
      mapController.animateCamera(CameraUpdate.newLatLng(marker.position));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IFPI MAPS'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    String searchTerm = _searchController.text;
                    _filterMarkers(searchTerm);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 16.0,
              ),
              markers: _filteredMarkers.isNotEmpty ? _filteredMarkers : _allMarkers,
            ),
          ),
        ],
      ),
    );
  }
}