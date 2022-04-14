import 'package:flutter/material.dart';
import 'package:portfolio/pages/Community.dart';
import 'package:portfolio/pages/Profile.dart';
import 'package:portfolio/pages/Work.dart';



 List navList(BuildContext context)=>[Navigator.pushNamed(context,Profile.id),Navigator.pushNamed(context, Work.id),Navigator.pushNamed(context,Community.id ),];

