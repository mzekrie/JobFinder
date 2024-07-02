import 'package:flutter/material.dart';
import '../../control/cubit/profile/profile__cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_phone_field.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AppRoute.profileScreen);
            },
            icon: Image.asset(
              "assets/images/arrow-left.png",
            )),
        centerTitle: true,
        title: const Text(
          "Change Phone Number ",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKeyPhone,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                    DefaultPhoneField(
                    controller: handPhoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "phone number must not be empty ";
                      }
                      return null;
                    },
                    labelText: "Phone Number",
                    onChange: (countryCode) {
                      myCountry = countryCode;
                    },
                    hintText: "Contact Phone Number",
                  ),

                  /// password
                  SizedBox(
                    height: 0.04 * height,
                  ),

                  ///button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: defaultButton(
                        text: 'Save',
                        radius: 25,
                        backGround: AppTheme.blueButtonGP,
                        function: () async {
                          if (formKeyProfile.currentState!.validate()) {
                            await ProfileCubit.get(context).editProfile(
                                mobile:
                                "${myCountry.dialCode}${handPhoneController.text}");

                            handPhoneController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Successfully edit profile'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoute.profileScreen, (route) => false);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

// end of statlessWidget
