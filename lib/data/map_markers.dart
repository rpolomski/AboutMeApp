import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

Set<Marker> mapMarkers() {
  return {
    Marker(
      markerId: const MarkerId("Gliwice"),
      position: const LatLng(50.288989, 18.677298),
      infoWindow: InfoWindow(
        title: "map.gliwice".tr(),
        snippet: "map.a_gliwice".tr(),
      ),
    ),
    Marker(
      markerId: const MarkerId("Rydułtowy"),
      position: const LatLng(50.058143, 18.417265),
      infoWindow: InfoWindow(
        title: "map.rydultowy".tr(),
        snippet: "map.a_rydultowy".tr(),
      ),
    ),
    Marker(
      markerId: const MarkerId("Bytom"),
      position: const LatLng(50.351543, 18.913022),
      infoWindow: InfoWindow(
        title: "map.bytom".tr(),
        snippet: "map.a_bytom".tr(),
      ),
    ),
  };
}
