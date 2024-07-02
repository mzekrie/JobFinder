import 'package:flutter/material.dart';
import 'package:gp_amit60_mary_zekrie/model/jobs_people_model.dart';
import 'package:gp_amit60_mary_zekrie/view/builder_item/Job_people_item.dart';
import '../../model/jobs_all_model.dart';
import '../../model/shared/cache_helper.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/enum.dart';
import '../../router/router.dart';
import '../widget/default_button.dart';
import '../widget/default_text_field.dart';

class BuilderJobDetails extends StatefulWidget {
  JobData item;
  BuilderJobDetails({super.key, required this.item});
  @override
  State<BuilderJobDetails> createState() => _BuilderJobDetailsState();
}

class _BuilderJobDetailsState extends State<BuilderJobDetails>
    with TickerProviderStateMixin {
  // make the object required
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    /// to control tabs
    TabController tabController = TabController(length: 3, vsync: this);

    return Container(
      decoration: const BoxDecoration(color: AppTheme.whiteGP),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
          child: Column(
            children: [
              Image.network(
                "${widget.item.image}",
                height: 0.1 * width,
                width: 0.1 * width,
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              DefaultText(
                text: ("${widget.item.name}"),
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              DefaultText(
                text: ("${widget.item.compName}. United States"),
                color: AppTheme.gray,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Row(
                children: [
                  Container(
                    height: height * 0.04,
                    width: width * 0.25,
                    margin: const EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.blueLightGP,
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: DefaultText(
                      text: ("${widget.item.jobType} "),
                      color: AppTheme.blueButtonGP,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Container(
                    height: height * 0.04,
                    width: width * 0.25,
                    margin: const EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.blueLightGP,
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: DefaultText(
                      text: ("${widget.item.jobTimeType} "),
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * height,
              ),

              /// tabs
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: tabController,
                    labelColor: AppTheme.blueButtonGP,
                    unselectedLabelColor: AppTheme.gray,
                    indicatorColor: AppTheme.blueButtonGP,
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        text: "Description",
                      ),
                      Tab(
                        text: "Company",
                      ),
                      Tab(text: "People")
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 0.45 * height,
                  child: TabBarView(controller: tabController, children: [
                    ///1st tab1
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DefaultText(
                          text: ("Job Description "),
                          color: AppTheme.blackGP,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 0.02 * height,
                        ),
                        DefaultText(
                          text: ("${widget.item.jobDescription} "),
                          color: AppTheme.blackGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 0.02 * height,
                        ),
                        const DefaultText(
                          text: ("Skills Required "),
                          color: AppTheme.blackGP,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 0.02 * height,
                        ),
                        DefaultText(
                          text: ("${widget.item.jobSkill} "),
                          color: AppTheme.blackGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),

                    ///2nd tab2
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DefaultText(
                          text: ("Contact Us "),
                          color: AppTheme.blackGP,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 0.02* height,),
                        Row(
                          children: [
                            Container(
                              width:0.4*width,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),

                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  const DefaultText(
                                    text: ("Email "),
                                    color: AppTheme.gray,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  DefaultText(
                                    text: ("${widget.item.compEmail} "),
                                    color: AppTheme.blackGP,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                              ),
                ]
                            ),),
                            SizedBox(width: width*0.01),
                            Container(
                              width:0.4*width,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),

                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const DefaultText(
                                    text: ("Website "),
                                    color: AppTheme.gray,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  DefaultText(
                                    text: ("${widget.item.compWebsite} "),
                                    color: AppTheme.blackGP,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.02* height,),

                        const DefaultText(
                          text: ("About the company "),
                          color: AppTheme.blackGP,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 0.02* height,),

                        DefaultText(
                          text: ("${widget.item.aboutComp} "),
                          color: AppTheme.blackGP,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),

                    ///3rd tab

                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 0.3 *width,
                              child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: ("6 employee for"),
                                  color: AppTheme.blackGP,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                DefaultText(
                                  text: ("UI/UX Designer "),
                                  color: AppTheme.gray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),),

                            OutlinedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 0.3* width,
                                    child: const DefaultText(
                                      text: "UI/UX Designer",
                                      color: AppTheme.grayGP,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const Image(
                                      image: AssetImage(
                                    'assets/images/arrow-down.png',
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return BuilderJobsPeople(
                                jobsPeopleModel: dataJobsPeople[index],
                              );
                            },
                            itemCount: dataJobsPeople.length,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              /// button
              SizedBox(
                  height: 0.07 * height,
                child: defaultButton(
                    text: 'Apply now',
                    width: 0.6 * width,
                    height: 0.04 * height,
                    radius: 25,
                    backGround: AppTheme.blueButtonGP,
                    function: () async {
                      await CacheHelper.putString(
                        key: SharedKeys.appliedJobID,
                        value:("${widget.item.id}"),
                      );
                      String appliedJOBID = CacheHelper.getString(key: SharedKeys.appliedJobID);
                      print ('ID of Job is : $appliedJOBID');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoute.applyToJobScreen, (route) => false);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
