import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/foundersmodel.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<FoundersMod> founders = [
  FoundersMod(
    text:
    "Software Associate at Capgemini, 2+ years of experience in flutter (Dart), with certification in full stack .NET (C#) development with .NET MVC and Restful APIs, including the knowledge of kotlin and swift for native development as well as typescript (Node Js) for web APIs, further more I've worked with NoSQL document structures database as well and SQL table structures too including the basic knowledge of Python, Java. Academic background as Bachelor of Science focused in Information Technology.",
    occupation: "FOUNDER",
    personName: "HASSAN ANSARI",
    profilePhoto: "assets/hass.jpg",
  ),
  FoundersMod(
    text:
    "Experienced Operations Executive with a demonstrated history of working in the information technology and services industry. Skilled in Operations Management, Dart, Java, HTML and big data technologies. Current profile as Data engineer , apart from this love to build full stack android and iOS applications. Certified in SSRS, SSIS, Agile Developer,Business Intelligence engineer,Python Associate and Data Professional. Strong operations professional with a Bachelor of Science focused in Information Technology.",
    occupation: "CO-FOUNDER",
    personName: "ZAHEER AHMED ANSARI",
    profilePhoto: "assets/zaheer.jpg",
  )
];


class Founders extends StatelessWidget{
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
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FOUNDERS",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                        "Meet the root builders of our community..",
                        style: TextStyle(color: Colors.white, height: 1.8),
                      ),

                      TextSpan(
                        text: " \nThe People who will admire and appreciate you the most :-)",
                        style: TextStyle(color:PrimaryColor, height: 1.8),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                // Lets map
                children: founders.map((testimonial) {
                  return Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 1,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(bottom: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/quote.png",
                              width: 50.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            testimonial.text,
                            style: TextStyle(
                              color: CaptionColor,
                              height: 1.8,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  testimonial.profilePhoto,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonial.personName,
                                    style: GoogleFonts.oswald(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    testimonial.occupation,
                                    style: TextStyle(
                                      color: CaptionColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    ),
  );
}
