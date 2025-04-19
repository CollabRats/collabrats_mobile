// ignore_for_file: use_build_context_synchronously

import 'package:collabrats_mobile/utils/presenters.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _address = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Presenters.showSnackBar(context, "Location permissions are denied");
      }
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      Presenters.showSnackBar(
        context,
        "'Location permissions are permanently denied, we cannot request permissions.'",
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    setState(() {
      _address.text =
          "${placemarks[0].locality ?? ""}, ${placemarks[0].country ?? ""}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRegisterHeader(
        imgPath: "assets/vectors/location.svg",
        progressValue: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Where do you stay?",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: ScreenUtils.screenWidth * 0.5,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: getLocation,
                child: Row(
                  children: [
                    Icon(IconsaxPlusLinear.location),
                    const SizedBox(width: 5),
                    Text(
                      "Use my current location",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormfield(
                    keyboardType: TextInputType.streetAddress,
                    headText: "",
                    hintText: "Enter your current location",
                    validator:
                        (val) => Validators.validateEmptyField(
                          val ?? "",
                          "Location",
                        ),
                    controller: _address,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                Icon(IconsaxPlusLinear.eye),
                const SizedBox(width: 5),
                Text(
                  "Always visible on profile",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: CustomButton(
        text: "Continue",
        function: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/gender');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
