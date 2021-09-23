import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/profile.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/Animations/hover_extension.dart';


List<CarouselItemModel> carouselItems(Function(bool) onTapkey) => List.generate(
  5,
      (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "FULL STACK DEVELOPER",
            style: GoogleFonts.oswald(
              color: PrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "ANSARI\nZAHEER AHMED",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Wrap(
            children: [
              Text(
                "Versatile developer, based in ",
                style: TextStyle(
                  color: CaptionColor,
                  fontSize: 15.0,
                  height: 1.0,
                ),
              ),
              Text(
                "India.",
                style: TextStyle(
                  color: ButtonColor,
                  fontSize: 15.0,
                  height: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Wrap(
              children: [
                Text(
                  "Need a service ?",
                  style: TextStyle(
                    color: CaptionColor,
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
                Text(
                  " Got a project ? ",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onTapkey(true);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      " Let's talk.",
                      style: TextStyle(
                        height: 1.5,
                        color: PrimaryColor,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 48.0,
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              child: TextButton(
                onPressed: () {
                  onTapkey(false);
                },
                child: Text(
                  "MY SKILLS !",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ).moveUpHover,
        ],
      ),
    ),
    image: Container(
      child: Image.asset(
        "assets/profile.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
);
