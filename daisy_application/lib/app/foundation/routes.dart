import 'package:daisy_application/app/pages/landing-page/view/landing.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final router = FluroRouter();

  static void setupRouter() {
    // router.define(
    //   PostNewJob.RouteName,
    //   handler: PostNewJob.routeHandler,
    // );
    // router.define(LandingPage.RouteName, handler: LandingPage.routeHandler);
  }
}
