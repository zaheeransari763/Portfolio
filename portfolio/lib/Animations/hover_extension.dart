import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:portfolio/Animations/translate_on_hover.dart';

extension HoverExtensions on Widget{
  static final appContainer=html.window.document.getElementById('app-container');



  Widget get moveUpHover{
    return TranslateOnHover(
      key: null,
      child:this,
    );
  }

}