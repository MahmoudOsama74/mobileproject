import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class CompanyMapView extends StatefulWidget {
  final List<LatLng> companyLocations;

  CompanyMapView({required this.companyLocations});

  @override
  _CompanyMapViewState createState() => _CompanyMapViewState();
}

class _CompanyMapViewState extends State<CompanyMapView> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: widget.companyLocations.isNotEmpty
              ? widget.companyLocations.first
              : const LatLng(0, 0),
          zoom: 10.0,
        ),
        markers: widget.companyLocations
            .map((latLng) => Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
        ))
            .toSet(),
      ),
    );
  }
}
class companiesInMapView extends StatelessWidget {
   List<LatLng> companyLocations = [
    const LatLng(37.7749, -122.4194),
    const LatLng(30.7749, -122.4194),// Example coordinates, replace with your own
    const LatLng(40.7128, -74.0060),
    const LatLng(43.7128, -74.0060),
    const LatLng(41.7128, -74.0060),
    const LatLng(42.7128, -74.0060),
    const LatLng(51.5074, -0.1278),
    const LatLng(29.5074, -0.1278),
  ];

  companiesInMapView({required this.companyLocations,super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF04342A)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(children:  const [
            Text('Companies in MapView',
              style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xFF04342A), ),
            ),
          ],)
      ),
      body: CompanyMapView(companyLocations: companyLocations),
    );
  }
}