import 'package:daisy_application/common/safety_utils.dart';

extension StringValidation on String? {
  bool isEmail() {
    if (this == null || isNone()) return false;

    int atSignIndex = this!.indexOf('@');
    if (atSignIndex == -1) return false;

    int dotSignIndex = this!.lastIndexOf('.');
    if (dotSignIndex == -1 || dotSignIndex < atSignIndex) return false;

    String emailName = this!.substring(0, atSignIndex);
    if (emailName.isNone()) return false;

    String orgName = this!.substring(atSignIndex + 1, dotSignIndex);
    if (orgName.isNone()) return false;

    String domainName = this!.substring(dotSignIndex + 1);
    if (domainName.isNone()) return false;

    return true;
  }

  bool isPhoneNumber() {
    if (isNone()) return false;

    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(this!);
  }
}
