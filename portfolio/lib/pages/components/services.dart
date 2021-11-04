import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/servicesmodel.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<ServiceProcess> serviceProcesses = [
  ServiceProcess(
    title: "DESIGN",
    imagePath: "assets/design.png",
    subtitle:
    designString
  ),
  ServiceProcess(
    title: "DEVELOP",
    imagePath: "assets/develop.png",
    subtitle:
    developmentString
  ),
  ServiceProcess(
    title: "EDIFY",
    imagePath: "assets/write.png",
    subtitle:
    teachString
  ),
  ServiceProcess(
    title: "PROMOTE",
    imagePath: "assets/promote.png",
    subtitle:
    promoteString
  ),
];


class Services extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(

            children: [
              Text(
                "SERVICES",
                style: GoogleFonts.oswald(
                  color: PrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 28.0,
                  height: 1.3,                ),
              ),

            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            child: LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                        ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 2.0
                        : 250.0,
                    // Hack to adjust child height
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                serviceProcesses[index].imagePath,
                                width: 40.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                serviceProcesses[index].title,
                                style: GoogleFonts.oswald(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            serviceProcesses[index].subtitle,
                            style: TextStyle(
                              color: CaptionColor,
                              height: 1.5,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: serviceProcesses.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
