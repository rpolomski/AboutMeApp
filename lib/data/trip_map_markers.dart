import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

Set<Marker> tripMapMarkers() {
  return {
    Marker(
      markerId: const MarkerId("Florencja"),
      position: const LatLng(43.779929, 11.251951),
      infoWindow: InfoWindow(
        title: "trip.florencja".tr(),
        snippet: "trip.a_florencja".tr(),
      ),
    ),
    Marker(
      markerId: const MarkerId("San Marino"),
      position: const LatLng(43.937246, 12.447755),
      infoWindow: InfoWindow(
        title: "trip.san_marino".tr(),
        snippet: "trip.a_san_marino".tr(),
      ),
    ),
    Marker(
      markerId: const MarkerId("Azory"),
      position: const LatLng(37.743375, -25.672026),
      infoWindow: InfoWindow(
        title: "trip.azory".tr(),
        snippet: "trip.a_azory".tr(),
      ),
    ),
    Marker(
      markerId: const MarkerId("Malaga"),
      position: const LatLng(36.714115, -4.434223),
      infoWindow: InfoWindow(
        title: "trip.malaga".tr(),
        snippet: "trip.a_malaga".tr(),
      ),
    ),
    Marker(
      markerId: const MarkerId("Gibraltar"),
      position: const LatLng(36.148947, -5.349353),
      infoWindow: InfoWindow(
        title: "trip.gibraltar".tr(),
        snippet: "trip.a_gibraltar".tr(),
      ),
    ),
  };
}
