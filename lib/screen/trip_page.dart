import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:f_my_app/widets/app_drawer.dart';
import 'package:f_my_app/widets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/trip_map_markers.dart';
import '../widets/trip_listview.dart';

class TripPage extends StatefulWidget {
  const TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

final Completer<GoogleMapController> _controller = Completer();
const int _selectedIndex = 2;

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: "drawer.trip".tr()),
        drawer: const AppDrawer(
          selectedIndex: _selectedIndex,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: (GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: tripMapMarkers(),
                  mapType: MapType.normal,
                  initialCameraPosition: const CameraPosition(
                    zoom: 3,
                    target: LatLng(45.006104, -0.406465),
                  ))),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: (ListView(
                  children: [
                    TripListview(
                      images: const [
                        AssetImage('lib/assets/images/azory/azory0.jpg'),
                        AssetImage('lib/assets/images/azory/azory1.jpg'),
                        AssetImage('lib/assets/images/azory/azory2.jpg'),
                      ],
                      text: "places.azory".tr(),
                      place: "trip.azory".tr(),
                    ),
                    const SizedBox(height: 10,),
                    TripListview(
                      images: const [
                        AssetImage(
                            'lib/assets/images/florencja/florencja0.jpg'),
                        AssetImage(
                            'lib/assets/images/florencja/florencja1.jpg'),
                        AssetImage(
                            'lib/assets/images/florencja/florencja2.jpg'),
                      ],
                      text: "places.florencja".tr(),
                      place: "trip.florencja".tr(),
                    ),
                    const SizedBox(height: 10,),
                    TripListview(
                      images: const [
                        AssetImage(
                            'lib/assets/images/san_marino/san_marino0.jpg'),
                        AssetImage(
                            'lib/assets/images/san_marino/san_marino1.jpg'),
                        AssetImage(
                            'lib/assets/images/san_marino/san_marino2.jpg'),
                      ],
                      text: "places.san_marino".tr(),
                      place: "trip.san_marino".tr(),
                    ),
                    const SizedBox(height: 10,),
                    TripListview(
                      images: const [
                        AssetImage(
                            'lib/assets/images/gibraltar/gibraltar0.jpg'),
                        AssetImage(
                            'lib/assets/images/gibraltar/gibraltar1.jpg'),
                        AssetImage(
                            'lib/assets/images/gibraltar/gibraltar2.jpg'),
                      ],
                      text: "places.gibraltar".tr(),
                      place: "trip.gibraltar".tr(),
                    ),
                    const SizedBox(height: 10,),
                    TripListview(
                      images: const [
                        AssetImage('lib/assets/images/malaga/malaga0.jpg'),
                        AssetImage('lib/assets/images/malaga/malaga1.jpg'),
                        AssetImage('lib/assets/images/malaga/malaga2.jpg'),
                      ],
                      text: "places.malaga".tr(),
                      place: "trip.malaga".tr(),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ));
  }
}
