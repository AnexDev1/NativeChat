import 'package:flutter/services.dart';

Future<void> copyToClipboard(content) async {
  await Clipboard.setData(ClipboardData(text: content));
}
