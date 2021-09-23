import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/components/Url.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

/*
final List<String> SocialLogo = [
  "assets/Datastage_logo.png",
  "assets/hadoop_logo.png",
  "assets/informatic_logo.png",
  "assets/microsoft-sql_logo.png",
  "assets/oracle_logo.png",
  "assets/power-bi_logo.png",
];
*/

class SocialContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
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
    child: ResponsiveWrapper(
      minWidth: width,
      maxWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Social Contact",
          style: GoogleFonts.oswald(
            color: PrimaryColor,
            fontWeight: FontWeight.w900,
            fontSize: 28.0,
            height: 1.3,
          ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [

              Divider(
                height: 3,
                color: ButtonColor,
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 10,
                children: [
                  Tooltip(
                    message: "Twitter",
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: (){
                           Url.openLink(url:'https://twitter.com/AnsariZaheerAh2?t=pgxi51MC4nSB0Ty2YHNvmg&s=08');
                          },
                            child: Image.asset("assets/twitter.png",height: 60,width: 60,)
                        )
                    ),
                  ),
                  Tooltip(
                    message: "Facebook",
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              Url.openLink(url:'https://www.facebook.com/zaheer.ansari.399');
                            },
                            child: Image.asset("assets/facebook.png",height: 60,width: 60,))),
                  ),
                  Tooltip(
                    message: "Instagram",
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              Url.openLink(url:'https://www.instagram.com/_flirty.insane/');
                            },
                            child: Image.asset("assets/instagram.png",height: 60,width: 60,))),
                  ),
                  Tooltip(
                    message: "LinkedIn",
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              Url.openLink(url:'https://www.linkedin.com/in/zaheer-ahmed-ansari-07a43215a/');
                            },
                            child: Image.asset("assets/linkedin.png",height: 60,width: 60,))),
                  ),
                  Tooltip(
                    message: "Github",
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              Url.openLink(url:'https://github.com/zaheeransari763');
                            },
                            child: Image.asset("assets/github.png",height: 60,width: 60,))),
                  ),

                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                height: 3,
                color: ButtonColor,
                thickness: 1,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
