import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Map extends StatefulWidget {
  double? vido;
  double? kinhdo;
  Map( this.vido, this.kinhdo,{Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MapState(vido!,kinhdo!);
  }
}

class MapState extends State<Map>{
  double vido;
  double kinhdo;
MapState(this.vido,this.kinhdo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center:new LatLng(vido,kinhdo),
          zoom: 14,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/godxhand/ckzf95yst000c14nyeowvkmce/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ29keGhhbmQiLCJhIjoiY2t6ZjkxZDdzMmlhczJ2bW16ZGphemJtdiJ9.7EfFjkJVE13ZqGqRcp9FAA",
            additionalOptions: {
              'accessToken':'pk.eyJ1IjoiZ29keGhhbmQiLCJhIjoiY2t6ZjkxZDdzMmlhczJ2bW16ZGphemJtdiJ9.7EfFjkJVE13ZqGqRcp9FAA',
              'id' : 'mapbox.satellite'
            }
          ),
          // MarkerLayerOptions(
          //   markers: [
          //     Marker(
          //       width: 80.0,
          //       height: 80.0,
          //       point: latLng.LatLng(51.5, -0.09),
          //       builder: (ctx) =>
          //           Container(
          //             child: FlutterLogo(),
          //           ),
          //     ),
          //   ],
          // ),
        ],
      )
    );
  }
}