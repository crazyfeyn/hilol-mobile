import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<bool> shareUri(BuildContext context, String path) async {
    try {
      final box = context.findRenderObject() as RenderBox?;
      Uri url = Uri.parse(path);
      final params = ShareParams(uri: url, sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
      final result = await SharePlus.instance.share(params);
      return result.status == ShareResultStatus.success;
    } catch(e) {
      debugPrint('ERROR: $e');
      return false;
    }
  }

  static Future<bool> shareText(BuildContext context, String text) async {
    try {
      final box = context.findRenderObject() as RenderBox?;
      final params = ShareParams(text: text, sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
      final result = await SharePlus.instance.share(params);
      return result.status == ShareResultStatus.success;
    } catch(e) {
      debugPrint('ERROR: $e');
      return false;
    }
  }
}