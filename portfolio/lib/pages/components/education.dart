import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Animations/hover_extension.dart';
import 'package:portfolio/models/educationmodel.dart';
import 'package:portfolio/pages/Work.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<Education> educationList = [
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

final List<Education> ExperineceList = [
  Education(
    description:
    "Developing different source system , to get data from various API's ,and also support manual data upload . Performing various ETL transformations and implementing new integrity rules as per business requirements.Automating and Scheduling operations using Airflow DAG services. Preparing PowerBI reports to present the data trends to the data owners",
    period: "2022 Full Stack Developer @ Infosys - PRESENT",
  ),
  Education(
    description:
    "Handling job of making raw data usable to team and groups within an organization.Collecting Data from various Sources performing transformations according to business needs and reporting them to clients using numerous visual graphics.",
    period: "2021 Data Engineer @ Infosys ",
  ),
  Education(
    description:
    "Worked as Full Stack Native Developer being a Freelancer. Used Flutter SDK and Dart programming language along with Firebase to deliver quality systems. ",
    period: "2021 Flutter Hybrid Development @ Freelancer ",
  ),
  Education(
    description:
    "Worked as Full Stack Native Developer being a Freelancer, used Advanced Java , XML and Firebase as collaborative technologies to work on real-world business systems",
    period: "2017-2020 Android Native Development @ Freelancer ",
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

class ExperinceSection extends StatelessWidget {
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
              "EXPERIENCE",
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
                    "I think everyone should experience defeat at least once during their career. You learn a lot from it.!",
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
                    children: ExperineceList
                        .map(
                          (experience) => Container(
                        width: constraints.maxWidth / 2.0 - 30.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              experience.period,
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
                              experience.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: CaptionColor,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MouseRegion(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ButtonColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Work()),
                                    );
                                  },
                                  child: Text(
                                    "WORKING'S",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ).moveUpHover,
                            SizedBox(
                              height: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
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
