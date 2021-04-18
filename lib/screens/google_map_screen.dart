import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async{
    mapMarker =await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/location-small.png",);
  }

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'),
            position:LatLng(-1.286389,36.817223),
            //icon: mapMarker,
            infoWindow: InfoWindow(
              title: 'Nyayo House',
              snippet: 'A Historical Place'
            )
        )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(-1.286389,36.817223),
      zoom: 15,
      ),),
    );
  }
}
