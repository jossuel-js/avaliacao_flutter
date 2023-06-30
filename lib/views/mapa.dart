import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

import '../database/mongodb.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  List<Marker> markers = [     ];
  List<Marker> filteredMarkers = [];
    final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMapData();
  }

  Future<void> fetchMapData() async {
    
    final db = await MongoDb.connect();

    List <Map<String, Object?>> data = await db.find().toList();

    setState(() {
      markers = createMarkersFromData(data);
    });

    
  }

  List<Marker> createMarkersFromData(List<dynamic> data) {
    List<Marker> markers = [];

   for (var item in data) {
      final latitude = double.tryParse(item['latitude']);
      final longitude = double.tryParse(item['longitude']);

      if (latitude != null && longitude != null) {
        final marker = Marker(
          markerId: MarkerId(item['_id'].toString()),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(title: item['name']),
        );
        markers.add(marker);
      }
    }

    return markers;
  }
void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _moveToMarker(MarkerId markerId) {
    final marker = markers.firstWhere((m) => m.markerId == markerId);
    final position = marker.position;
    final cameraPosition = CameraPosition(target: position, zoom: 15.0);
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

void _searchMarkers(String query) {
  setState(() {
    if (query.isEmpty) {
      filteredMarkers = markers;
    } else {
      filteredMarkers = markers.where((marker) {
        final title = marker.infoWindow.title ?? '';
        return title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  });

  if (filteredMarkers.isNotEmpty) {
    final markerId = filteredMarkers.first.markerId;
    _moveToMarker(markerId);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextFormField(
                controller: _searchController,
                onFieldSubmitted: (value) {
                  _searchMarkers(value);
                },
                decoration: InputDecoration(
                  labelText: 'Pesquisar por título',
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(-5.104680, -42.758246),
                zoom: 10,
              ),
              markers: Set<Marker>.from(filteredMarkers),
            ),
          ),
        ],
      ),
    );
  }
}