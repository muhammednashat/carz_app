import 'package:carz_app/config/dependecy/reposotry_provider.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:carz_app/ui/core/ui/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  bool _isTapped = false;
  double lat = 29.979857;
  double lon = 31.255055;
  String address = 'Loading.......';
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState

    _getAddressName(lat, lon);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            onMapReady: () {
              setState(() {
                _isLoading = false;
              });
            },
            onTap: _ontap,
            initialCenter: LatLng(lat, lon),
          ),

          children: [
            TileLayer(
              urlTemplate:
                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', // Example OpenStreetMap XYZ URL
              subdomains: ['a', 'b', 'c'], // Required for OpenStreetMap
              userAgentPackageName: 'com.muslim.carz.carz_app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(lat, lon),
                  child: Icon(Icons.location_on, color: Colors.red, size: 40),
                ),
              ],
            ),
          ],
        ),

        Positioned(
          top: 30.0,
          left: 20.0,
          child: IconButton(
            onPressed: () {
              _showYesNoDialog();
            },
            icon: Icon(Icons.arrow_back, size: 30.0),
          ),
        ),

        Positioned(
          bottom: 30.0,
          right: 0.0,
          left: 0.0,

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CustomElevatedButton(
                onPressed: () {
                  _showYesNoDialog();
                },
                text: address,
              ),
            ),
          ),
        ),

        if (_isLoading)
          Positioned.fill(
            child: Container(child: Center(child: CircularProgressIndicator())),
          ),
      ],
    );
  }

  void _getAddressName(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          address = "${place.street}, ${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void _ontap(TapPosition point, LatLng latlong) async {
    setState(() {
      _isTapped = true;
      lat = latlong.latitude;
      lon = latlong.longitude;
    });

    _getAddressName(lat, lon);
  }

  void _showYesNoDialog() async {
    await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Do you want to save this address?"),
            content: Text("$address"),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                  context.pop();
                }, // No
                child: Text("No"),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                  _enterAddressNameDialog();
                }, // Yes
                child: Text("Yes"),
              ),
            ],
          ),
    );
  }

  void _enterAddressNameDialog() async {
    final controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (cotext) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Cancel'),
            ),

            TextButton(
              onPressed: () {
                context.pop();
                saveUserAddress(address, controller.text);
              },
              child: Text('Ok'),
            ),
          ],
          title: Text("Please enter a title for this address"),
          content: TextField(controller: controller),
        );
      },
    );
  }

  void saveUserAddress(String address, String title) async {
   setState(() {
     _isLoading = true;
   });   
    final addressRepo = ref.read(addressRepoProvider);
    await addressRepo.addAddress(title, address, "31");
     setState(() {
     _isLoading = false;
     context.pop();
   }); 
  }
}
