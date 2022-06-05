import 'package:daisy_application/pages/landing-page/listener/landing_page_listener.dart';
import 'package:daisy_application/pages/landing-page/model/landing_page_state.dart';

class LandingPageController implements LandingPageListener {
  // ignore: unused_field
  final LandingPageState _landingPageState;

  LandingPageController(this._landingPageState);

  @override
  void submitTextfieldForSelectingCategories() {
    // implement code
    // _landingPageState.addSelectedCategory();
  }
}
