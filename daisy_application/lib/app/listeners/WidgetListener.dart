import 'package:daisy_application/common/constants.dart'; // ignore: file_names
import 'package:daisy_application/core_services/common/response_handler.dart';

mixin WidgetListener {
  Future<Result> _defaultImplementation() =>
      throw UnsupportedError('This function is not implement yet');

  Future<void> onBtnSignupClicked(UserRole selectedRole) async =>
      _defaultImplementation();

  Future<void> onBtnSigninClicked() async => _defaultImplementation();

  Future<void> submitTextfieldForSelectingCategories() async =>
      _defaultImplementation();

  Future<void> onLoadMoreRequestEvent() async => _defaultImplementation();
}
