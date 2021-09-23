import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/educationmodel.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<Education> educationList = [
  Education(
    description:
    "Handling job of making raw data usable to team and groups within an organization.Collecting Data from various Sources performing transformations according to business needs and reporting them to clients using numerous visual graphics.",
    period: "2021 Data Engineer @ Infosys - PRESENT",
  ),
  Education(
    description:
    "Holding a graduate level degree with duration of 3 years where I have acquired IT professional skills such as Problem-Solving skills and Critical-Thinking skills ",
    period: "2017 - 2020 - Bachelors in IT",
  ),
  Education(
    description:
    "A stream specific course of 2 years of duration where I opted for Science with Information Technology stream ",
    period: "2015 - 2017 - HSC",
  ),
  Education(
    description:
    "An entry level course for being eligible to apply for high school courses or various diploma",
    period: "2014 - 2015 - SSC",
  ),
];

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "EDUCATION",
              style: GoogleFonts.oswald(
                color: PrimaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 600.0),
                  child: Text(
                    "An investment in knowledge pays the best interest and change is the end result of all true learning.\nBachelors in Information Technology with required skills you are searching for !",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: educationList
                        .map(
                          (education) => Container(
                        width: constraints.maxWidth / 2.0 - 30.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              education.period,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              education.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: CaptionColor,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            )
                          ],
                        ),
                      ),
                    )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
