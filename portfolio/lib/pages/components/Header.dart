import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/header_items.dart';
import 'package:portfolio/pages/Blog.dart';
import 'package:portfolio/pages/Community.dart';
import 'package:portfolio/pages/Work.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:portfolio/Animations/hover_extension.dart';

import '../Profile.dart';

List <HeaderItem> headerItems(BuildContext context, Function onTap)=>[
HeaderItem(
    title:"PROFILE",
    onTap: (){
      Navigator.pushNamed(context,Profile.id);
    }
    ),
  HeaderItem(
      title:"WORK",
      onTap: (){
        Navigator.pushNamed(context, Work.id);
      }
  ),
  HeaderItem(
      title:"CONTACT",
      onTap: (){
        onTap();
      }
  ),
  HeaderItem(
      title:"COMMUNITY",
      onTap: (){
        Navigator.pushNamed(context, Community.id);
      }
  ),
  HeaderItem(
      title:"BLOG",
      onTap: (){
        Navigator.pushNamed(context, Blog.id);
      }
  ),
  HeaderItem(
      title:"LETS WORK TOGETHER",
      onTap: (){
        print('Link to download Resume');
      },
      isButton: true,
  ),
];

class HeaderLogo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap:() {},
          child: RichText(
          text: TextSpan(
          children: [
          TextSpan(
          text: "Work",
          style: GoogleFonts.oswald(
          color: Colors.white,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          ),
          ),
          TextSpan(
          text: "SPACE",
          style: GoogleFonts.oswald(
          color: PrimaryColor,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          ),
          )
          ],
          ),
        ),
      ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  final Function onTap;
  HeaderRow(this.onTap);
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems(context, onTap)
            .map(
              (item) => item.isButton
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
                    horizontal: 20.0, vertical: 5.0),
                child: TextButton(
                  onPressed: item.onTap,
                  child: Text(
                    item.title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
              : MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.only(right: 30.0),
              child: GestureDetector(
                onTap: item.onTap,
                child: Text(
                  item.title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ).moveUpHover,
        )
            .toList(),
      ),
    );
  }
}


class Header extends StatelessWidget{
  final GlobalKey<ScaffoldState>? sKey;
  final Function onTap;
  Header(this.onTap,{ Key? key,this.sKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        // We will make this in a bit
        mobile: buildMobileHeader(sKey),
        tablet: buildHeader(),
      ),
    );
  }

  Widget buildMobileHeader(GlobalKey<ScaffoldState>? key) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                key!.currentState!.openEndDrawer();
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(
                  Icons.apps,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget buildHeader (){
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(onTap),
        ],
      ),

    );
  }

}