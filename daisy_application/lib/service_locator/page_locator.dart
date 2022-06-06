import 'package:daisy_application/pages/signup-page/controller/sign_up_page_controller.dart';
import 'package:daisy_application/pages/signup-page/model/sign_up_page_state.dart';
import 'package:daisy_application/service_locator/locator.dart';

class PageLocator {
  static void init() {
    _initController();
  }

  static void _initController() {
    locator.registerFactoryParam<SignUpPageController, SignUpPageState, void>(
        (state, _) => SignUpPageController(
            state, locator.get(), locator.get(), locator.get()));
  }
}
