import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Animations/hover_extension.dart';
import 'package:portfolio/utils/constant.dart';

import 'components/Header.dart';

class Community extends StatefulWidget {
  static const id = "/community";

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  GlobalKey<ScaffoldState> commumitykey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: commumitykey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems(context, (){})[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Tooltip(
                          message: "Download Resume",
                          child: Container(
                            decoration: BoxDecoration(
                              color: ButtonColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: TextButton(
                              onPressed: headerItems(context, (){})[index].onTap,
                              child: Text(
                                headerItems(context, (){})[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Text(
                              headerItems(context, (){})[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ).moveUpHover,
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems(context,(){}).length,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header((){},sKey: commumitykey,),
              ),
              /*Carousel(),
              SizedBox(
                height: 20.0,
              ),
              CvSection(),
              IosAppAd(),
              SizedBox(
                height: 70.0,
              ),
              WebsiteAd(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: PortfolioStats(),
              ),
              SizedBox(
                height: 50.0,
              ),
              EducationSection(),
              SizedBox(
                height: 50.0,
              ),
              SkillSection(),
              SizedBox(
                height: 50.0,
              ),
              Sponsors(),
              SizedBox(
                height: 50.0,
              ),
              TestimonialWidget(),
              Footer(),*/
            ],
          ),
        ),
      ),
    );
  }
}
