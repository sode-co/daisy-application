import 'package:android_intent_plus/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> redirect(String url) async {
  AndroidIntent intent = AndroidIntent(
    action: 'action_view',
    data: url,
  );

  await intent.launch();
}
