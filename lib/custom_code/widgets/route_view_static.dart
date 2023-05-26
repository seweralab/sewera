// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' show cos, sqrt, asin;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;

class RouteViewStatic extends StatefulWidget {
  const RouteViewStatic({
    Key? key,
    this.width,
    this.height,
    required this.startCoordinate,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    this.startAddress,
  }) : super(key: key);

  final double? height;
  final double? width;

  final LatLng startCoordinate;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final String? startAddress;

  @override
  _RouteViewStaticState createState() => _RouteViewStaticState();
}

class DadataSuggestion {
  final String value;
  final String latitude;
  final String longitude;

  DadataSuggestion({
    required this.value,
    required this.latitude,
    required this.longitude,
  });
}

class _RouteViewStaticState extends State<RouteViewStatic> {
  late final CameraPosition _initialLocation;
  GoogleMapController? _mapController;
  // LatLng startLocation = LatLng(27.6602292, 85.308027);
  Set<Marker> markers = {};
  bool _isFocused = false;

  TextEditingController _addressTextController = TextEditingController();
  late FocusNode _addressFocusNode;
  List<DadataSuggestion> _suggestions = [];
  // LatLng _center = LatLng(37.7749, -122.4194);
  void _onTextChanged(String value) async {
    final suggestions = await _getAddressSuggestions(value);
    FFAppState().currentQuizAddr = value;
    setState(() {
      _suggestions = suggestions;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onMapTap(latlng.LatLng location) {
    setState(() {
      // _pickedLocation = location;
      _suggestions.clear();
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
        ),
      );
    });
    print(location);
    LatLng latlngloc = LatLng(
      location.latitude,
      location.longitude,
    );
    _getAddressFromLatLng(latlngloc);
    // _getAddressFromLatLng(location);
  }

  void _onSuggestionTap(String latitude, String longitude) {
    print(latitude);
    print(longitude);
    final location = latlng.LatLng(
      double.parse(latitude),
      double.parse(longitude),
    );
    setState(() {
      // _pickedLocation = location;
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
        ),
      );
    });

    // Устанавливаем камеру по центру выбранной точки с увеличением масштаба
    final cameraPosition = CameraPosition(
      target: latlng.LatLng(
        double.parse(latitude),
        double.parse(longitude),
      ),
      zoom: 15.0,
    );
    final cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);
    _mapController?.animateCamera(cameraUpdate);
  }

  Future<void> _getAddressFromLatLng(LatLng location) async {
    print('start');
    final response = await http.post(
      Uri.parse(
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token f56cc3f687783cefeac0624f8b0896741a2834a5',
      },
      body: jsonEncode({
        'lat': location.latitude,
        'lon': location.longitude,
        'count': 1,
      }),
    );
    print('get response');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final suggestions = data['suggestions'] as List<dynamic>;
      if (suggestions.isNotEmpty) {
        final address = suggestions[0]['value'] as String;
        setState(() {
          // Обновляем значение текстового поля
          print('get address');
          print(address);
          FFAppState().currentQuizAddr = address;
          _addressTextController.text = address;
        });
        // return address;
      }
    }

    throw Exception('Failed to get address for location: $location');
  }

  Future<List<DadataSuggestion>> _getAddressSuggestions(String text) async {
    final response = await http.post(
      Uri.parse(
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token f56cc3f687783cefeac0624f8b0896741a2834a5',
      },
      body: jsonEncode({
        'query': text,
        'count': 5,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final suggestions = (data['suggestions'] as List<dynamic>)
          .map((suggestion) => DadataSuggestion(
              value: suggestion['value'] as String,
              latitude: suggestion['data']['geo_lat'] as String,
              longitude: suggestion['data']['geo_lon'] as String))
          .toList();
      return suggestions;
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  @override
  void initState() {
    final startCoordinate = latlng.LatLng(
      widget.startCoordinate.latitude,
      widget.startCoordinate.longitude,
    );
    _initialLocation = CameraPosition(
      target: startCoordinate,
      zoom: 14,
    );
    markers.add(
      Marker(
        markerId: MarkerId(startCoordinate.toString()),
        position: startCoordinate,
      ),
    );
    _getAddressFromLatLng(LatLng(
      widget.startCoordinate.latitude,
      widget.startCoordinate.longitude,
    ));
    super.initState();
    _addressFocusNode = FocusNode();
    _addressFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _addressFocusNode.removeListener(_onFocusChange);
    _addressFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _addressFocusNode.hasFocus;
    });
  }
  // bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              onTap: _onMapTap,
              markers: markers,
              initialCameraPosition: _initialLocation,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _isFocused ? 0 : 338,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 16,
                height: 90,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Укажите адрес',
                    hintStyle: FlutterFlowTheme.of(context).bodySmall,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF3F4F5),
                    suffixIcon: _addressTextController.text.isNotEmpty
                        ? InkWell(
                            onTap: () async {
                              _addressTextController.clear();
                              // setState(() {
                              //   _model.showInputError = false;
                              // });
                              // setState(() {});
                            },
                            child: Icon(
                              Icons.clear,
                              color: Colors.black,
                              size: 16,
                            ),
                          )
                        : null,
                  ),
                  controller: _addressTextController,
                  onChanged: _onTextChanged,
                  onSubmitted: (String value) {
                    FFAppState().currentQuizAddr = value;
                    _suggestions.clear();
                  },
                  focusNode: _addressFocusNode,
                  autofocus: false,
                  onTap: () {
                    setState(() {
                      print('iSFOCEUS');
                      _isFocused = true;
                    });
                  },
                ),
              ),
            ),
          ),
          if (_suggestions.isNotEmpty)
            Positioned(
              left: 8.0,
              top: 58.0,
              right: 8.0,
              bottom: 8.0,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_suggestions[index].value),
                      onTap: () {
                        _addressTextController.text = _suggestions[index].value;
                        // print(_suggestions[index]);
                        FFAppState().currentQuizAddr =
                            _suggestions[index].value;
                        _addressFocusNode.requestFocus();
                        _onSuggestionTap(_suggestions[index].latitude,
                            _suggestions[index].longitude);
                        _suggestions.clear();
                        // FFAppState().currentQuizAddr = _suggestions[index].value;
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
