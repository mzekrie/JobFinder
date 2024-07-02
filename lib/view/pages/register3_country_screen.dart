//https://www.youtube.com/watch?v=p0jeEVLcE1E
import 'package:flutter/material.dart';
import '../../model/shared/colors_theme.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_text_field.dart';

class RegisterWorkLocationScreen extends StatefulWidget {
  const RegisterWorkLocationScreen({super.key});

  @override
  State<RegisterWorkLocationScreen> createState() =>
      _RegisterWorkLocationScreenState();
}

class _RegisterWorkLocationScreenState
    extends State<RegisterWorkLocationScreen>  with TickerProviderStateMixin {
    bool isSelected1 = false;
    bool isSelected2 = false;
    bool isSelected3 = false;
    bool isSelected4 = false;
    bool isSelected5 = false;
    bool isSelected6 = false;
    bool isSelected7 = false;
    bool isSelected8 = false;
    bool isSelected9 = false;
    bool isSelected10 = false;
    bool isSelected11 = false;
    bool isSelected12 = false;
    bool isSelected13 = false;
    /// to control tabs

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TabController tabController2 = TabController(length: 2, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 20.0,
                top: 20.0,
                child: Image.asset(
                  'assets/images/Logo_small.png',
                )),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const DefaultText(
                        text: "Where are you preferred Location?",
                        color: AppTheme.blackGP,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      const DefaultText(
                        text:
                            "Let us know, where is the work location you want at this time, so we can adjust it.",
                        color: AppTheme.grayGP,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      /// tab
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            controller: tabController2,
                            labelColor: AppTheme.blueButtonGP,
                            unselectedLabelColor: AppTheme.gray,
                            indicatorColor: AppTheme.blueButtonGP,
                            isScrollable: true,
                            tabs: const [
                              Tab(text: "Work From Office",),
                              Tab(text: "Remote Work", )
                            ],
                          ),
                        ),
                      ),
                      /// tab controller
                  SizedBox(
                    width: double.infinity,
                    height: 0.4 * height,
                    child: TabBarView(
                      controller: tabController2,
                      children:
                      [
                        /// list of choices items
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container (child: const DefaultText(
                            text:
                            " There is no available jobs right now try remote work",
                            color: AppTheme.grayGP,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ), ),
                        ),
                        Wrap(
                          spacing: 0.02 * width,
                          children:[
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_us.png'),
                                label: const Text('United States'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected13,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected13 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_mal.png'),
                                label: const Text('Malaysia'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected1,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected1 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_sing.png'),
                                label: const Text('Singapore'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected2,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected2 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_indo.png'),
                                label: const Text('Indonesia'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected3,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected3 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_phili.png'),
                                label: const Text('Philiphines'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected4,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected4 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_poland.png'),
                                label: const Text('Polandia'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected5,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected5 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_india.png'),
                                label: const Text('India'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected6,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected6 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_viet.png'),
                                label: const Text('Vietnam'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected7,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected7 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_china.png'),
                                label: const Text('China'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected8,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected8 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_canda.png'),
                                label: const Text('Canada'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected9,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected9 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_ksa.png'),
                                label: const Text('Saudi Arabia'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected10,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected10 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_argenti.png'),
                                label: const Text('Argentina'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected11,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected11 = newBoolValue;
                                  });
                                }),
                            ChoiceChip(
                                avatar:
                                Image.asset('assets/images/country_braz.png'),
                                label: const Text('Brazil'),
                                backgroundColor: AppTheme.grayLightGP , // Color to be used for the unselected, enabled chip's background.
                                selectedColor: AppTheme.blueLightGP,
                                showCheckmark:false,
                                selected: isSelected12,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    isSelected12 = newBoolValue;
                                  });
                                }),
                          ],
                        ),

                      ]),),

                      ///// button
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: defaultButton(
                            text: 'Next',
                            width: 0.8 * width,
                            height: 0.08 * height,
                            radius: 40,
                            backGround: AppTheme.blueButtonGP,
                            function: () async {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoute.registerSucessScreen, (route) => false);
                            }),
                      ),
                    ],
                ),
              ),
            ),),
             ],
        ),
      ),
    );
  }
}
