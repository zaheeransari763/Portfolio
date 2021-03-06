import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/Community.dart';
import 'package:portfolio/pages/Profile.dart';
import 'package:portfolio/pages/Work.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization =Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Dashboard',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: BackgroundColor,
        primaryColor: PrimaryColor,
        canvasColor: BackgroundColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),

      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: "4K"),
        ],
        background: Container(
          color: BackgroundColor,
        ),
      ),
      routes: {
        Profile.id: (context) => Profile(),
        Community.id: (context) => Community(),
        Work.id: (context) => Work(),
      },

      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot){
            if (snapshot.hasError){
              return CircularProgressIndicator();
            }
            if(snapshot.connectionState == ConnectionState.done){
              return Profile();
            }
            return CircularProgressIndicator();
          },
      ),
    );
  }
}





