
import 'package:url_launcher/url_launcher.dart';

class Url{
  static Future openLink({
   String url,
})=>
      _launchUrl(url);
  static Future _launchUrl(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }
  }

}