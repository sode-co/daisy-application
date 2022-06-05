import 'package:daisy_application/pages/landing-page/listener/LandingPageListener.dart';
import 'package:daisy_application/pages/landing-page/model/LandingPageState.dart';

class LandingPageController implements LandingPageListener {
  final LandingPageState _landingPageState;

  LandingPageController(this._landingPageState);

  @override
  void submitTextfieldForSelectingCategories() {
    // implement code
    // _landingPageState.addSelectedCategory();
  }
}
