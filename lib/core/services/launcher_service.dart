import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherService {
  static Future<void> launcher(String path) async {
    try {
      Uri url = Uri.parse(path);
      if(await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    } catch(e){
      debugPrint('ERROR: $e');
    }
  }

  static Future<void> launcherApplication(String path) async {
    try {
      Uri url = Uri.parse(path);
      if(await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch(e) {
      debugPrint('ERROR: $e');
    }
  }
}