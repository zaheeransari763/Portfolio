import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/Animations/hover_extension.dart';
import 'components/Header.dart';
import 'components/SocialContact.dart';
import 'components/footer.dart';
import 'components/projects.dart';

class Work extends StatefulWidget {
  static const id = "/work";

  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  GlobalKey<ScaffoldState> workkey=GlobalKey<ScaffoldState>();

  final controller=ScrollController();

  void ontapheader(){
    controller.animateTo(controller.position.maxScrollExtent, duration: Duration(seconds: 1), curve:Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: workkey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems(context,(){})[index].isButton
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
                              onPressed: headerItems(context,(){})[index].onTap,
                              child: Text(
                                headerItems(context,(){})[index].title!,
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
                              headerItems(context,(){})[index].title!,
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
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header(ontapheader,sKey: workkey,),
              ),
              Projects(),
              SizedBox(
                height: 30,
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
