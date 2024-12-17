import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:f_my_app/widets/app_drawer.dart';
import 'package:f_my_app/widets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/map_markers.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();

const CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(50.288691, 18.677579),
  zoom: 9,
);

class _MapPageState extends State<MapPage> {
  final int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "drawer.map".tr()),
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
      ),
      body: GoogleMap(
        markers: mapMarkers(),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
