import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      appBar:  AppBar(
        title: Text('地图示例'),
      ),
      body: _mapViewWidget(context), 
      // drawer: 
    );
  }

  Widget _mapViewWidget(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoibHVjeTIzMjMiLCJhIjoiY2p5ZWRiNGY3MDFqbzNubnliN2o2Nm44biJ9.YEVELbl8wMzHNE4KQj2keQ',
            'id': 'mapbox.streets',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 40.0,
              height: 40.0,
              point: new LatLng(51.5, -0.09),
              builder: (ctx) =>
              new Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}