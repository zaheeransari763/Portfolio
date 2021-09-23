import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/components/profileOverItems.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ProfileOver extends StatefulWidget {
  final Function(bool) onTap;
  ProfileOver(this.onTap);

  @override
  _ProfileOverState createState() => _ProfileOverState();
}

class _ProfileOverState extends State<ProfileOver> {
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double profileOverContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(
      height: profileOverContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: NeverScrollableScrollPhysics(),
                height: profileOverContainerHeight,
                viewportFraction: 1,
              ),
              items: List.generate(
                  5,
                  (index) => Builder(builder: (BuildContext context) {
                        return Container(
                          constraints: BoxConstraints(
                              maxHeight: profileOverContainerHeight),
                          child: ScreenHelper(
                            // Responsive views
                            desktop: _buildDesktop(
                              context,
                              carouselItems(widget.onTap)[index].text,
                              carouselItems(widget.onTap)[index].image,
                            ),
                            tablet: _buildTablet(
                              context,
                              carouselItems(widget.onTap)[index].text,
                              carouselItems(widget.onTap)[index].image,
                            ),
                            mobile: _buildMobile(
                              context,
                              carouselItems(widget.onTap)[index].text,
                              carouselItems(widget.onTap)[index].image,
                            ),
                          ),
                        );
                      })).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Big screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kDesktopMaxWidth,
      minWidth: kDesktopMaxWidth,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

// Mid screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kTabletMaxWidth,
      minWidth: kTabletMaxWidth,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

// SMall Screens

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMobileMaxWidth(context),
    ),
    width: double.infinity,
    child: text,
  );
}
