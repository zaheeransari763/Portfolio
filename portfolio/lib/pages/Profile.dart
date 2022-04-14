import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/Animations/hover_extension.dart';
import 'components/Header.dart';
import 'components/education.dart';
import 'components/SocialContact.dart';
import 'components/footer.dart';
import 'components/profileStats.dart';
import 'components/profileover.dart';
import 'components/skills.dart';

class Profile extends StatefulWidget{
  static const id = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<ScaffoldState> profilekey=GlobalKey<ScaffoldState>();
  final controller=ScrollController();

  void ontapheader(){
    controller.animateTo(controller.position.maxScrollExtent, duration: Duration(seconds: 1), curve:Curves.easeIn);
  }

  void ontap(bool val){
    if(val)

    controller.animateTo(controller.position.maxScrollExtent, duration: Duration(seconds: 1), curve:Curves.easeIn);

    else
      controller.animateTo(controller.position.maxScrollExtent-MediaQuery.of(context).size.height*0.5, duration: Duration(seconds: 1), curve:Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: profilekey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems(context,ontapheader)[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Tooltip(
                          message: "Download Resume",
                          child: Container(
                            decoration: BoxDecoration(
                              color: ButtonColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                            child: TextButton(
                              onPressed: headerItems(context,ontapheader)[index].onTap,
                              child: Text(
                                headerItems(context,ontapheader)[index].title!,
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
                            onTap: (){
                              headerItems(context,ontapheader)[index].onTap!();
                            },
                            child: Text(
                              headerItems(context,ontapheader)[index].title!,
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
              itemCount: headerItems(context,ontapheader).length,
            ),
          ),
        ),
      ),

      body:
          Container(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Header(ontapheader,sKey: profilekey,),
                  ),
                  ProfileOver(ontap),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28.0),
                    child: ProfileStats(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      ExperinceSection(),
                      EducationSection(),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SkillsSection(),
                  SizedBox(
                    height: 20,
                  ),
                  SocialContact(),
                  SizedBox(
                    height: 20,
                  ),
                  Footer(),

                ],
              ),
            ),
          ),
    );
  }
}