import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/footer_items.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/mappin.png",
    title: "ADDRESS",
    text1: "House no 69 Zilani Building",
    text2: "Narpoli Bhiwandi 421305",
  ),
  FooterItem(
    iconPath: "assets/phone.png",
    title: "PHONE",
    text1: "+91 8446661935",
    text2: "+91 7558485149",
  ),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "zaheeransari763@gmail.com",
    text2: "zaheeransari763@outlook.com",
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP",
    text1: "+91 8446661935",
    text2: "+91 7558485149",
  )
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                      height: 120.0,
                      width: ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 2.0 - 10.0
                          : constraints.maxWidth / 4.0 - 20.0,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  footerItem.iconPath,
                                  width: 25.0,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  footerItem.title,
                                  style: GoogleFonts.oswald(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${footerItem.text1}\n",
                                    style: TextStyle(
                                      color: CaptionColor,
                                      height: 1.8,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${footerItem.text2}\n",
                                    style: TextStyle(
                                      color: CaptionColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2021 Ansari Zaheer Ahmed. All rights Reserved",
                      style: TextStyle(
                        color: CaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: CaptionColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "|",
                          style: TextStyle(
                            color: CaptionColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: CaptionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
