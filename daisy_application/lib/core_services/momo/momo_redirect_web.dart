import 'package:url_launcher/url_launcher.dart';

Future<void> redirect(String url) async {
  launchUrl(Uri.parse(url));
}
