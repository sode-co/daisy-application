import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/style.dart';
import 'package:daisy_application/app/common/widget/badge/custom_badge.dart';
import 'package:daisy_application/app/pages/update-profile/model/update_profile_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/access_utils.dart';
import 'package:daisy_application/common/string_validation.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daisy_application/common/safety_utils.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationState appState = context.watch();
    UserModel currentUser = appState.currentUser!;

    return CustomizedBadge(
        badge: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(style: BorderStyle.solid)),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: SizedBox(
              width: 40.0,
              child: Row(
                children: const [
                  Icon(Icons.edit, size: 13.0),
                  Text(
                    'Edit',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottom: 0.0,
        left: 5.0,
        color: Colors.transparent,
        child: CircleAvatar(
          radius: 60.0,
          backgroundImage: NetworkImage(currentUser.avatar!),
        ));
  }
}

class UpdateProfileTitle extends StatelessWidget {
  const UpdateProfileTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 100,
      width: size.width * 0.8,
      child: Row(
        children: [
          Image.asset('assets/images/update_profile.png', width: 100),
          Text(
            'Profile Detail',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

String validateMessage(String? fieldName) =>
    '${fieldName ?? ''} không thể bỏ trống';

class UpdateProfileForm extends StatefulWidget {
  final VoidCallback? onSubmitted;
  const UpdateProfileForm({super.key, this.onSubmitted});

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ApplicationState appState = context.watch();
    UserModel currentUser = appState.currentUser!;
    final _formKey = GlobalKey<FormState>();
    var model = context.watch<UpdateProfileState>();
    model.updatedProfile = currentUser;

    return SizedBox(
      width: size.width * 0.65,
      height: 3000,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Row(
                children: [
                  CustomTextField(
                    fieldName: 'Họ của bạn',
                    maxLines: 1,
                    validation: (value) =>
                        value.isNone().thenReturn(validateMessage('Họ và tên')),
                    initialValue: currentUser.lastName,
                    isShortenForm: true,
                  ),
                  const SizedBox(width: 20.0),
                  CustomTextField(
                    fieldName: 'Tên của bạn',
                    maxLines: 1,
                    initialValue: currentUser.firstName,
                    isShortenForm: true,
                  ),
                ],
              ),
            ),
            CustomTextField(
              fieldName: 'Tên hiển thị',
              validation: (value) =>
                  value.isNone().thenReturn(validateMessage('Tên hiển thị')),
              maxLines: 1,
              initialValue: currentUser.displayName,
            ),
            CustomTextField(
              fieldName: 'Địa chỉ email của bạn',
              validation: (value) => (!value.isEmail())
                  .thenReturn('Địa chỉ email của bạn không hợp lệ'),
              maxLines: 1,
              initialValue: currentUser.email,
            ),
            CustomTextField(
              fieldName: 'Số điện thoại',
              keyboardType: TextInputType.phone,
              maxLines: 1,
              validation: (value) => (!value.isPhoneNumber())
                  .thenReturn('Số điện thoại không hợp lệ'),
              initialValue: currentUser.phone,
            ),
            CustomTextField(
              fieldName: 'Địa chỉ của bạn',
              maxLines: 1,
              initialValue: currentUser.address,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: Responsive.isDesktop(context) ? 0.0 : 70.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(110.0, 50.0),
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Hủy bỏ',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(BuiltinColor.blue_gradient_01),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Responsive.isDesktop(context) ? 20.0 : 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: Responsive.isDesktop(context) ? 50.0 : 0.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(110.0, 50.0),
                        primary: const Color(BuiltinColor.blue_gradient_01),
                      ),
                      onPressed: () => _formKey.currentState!
                          .validate()
                          .then(() => widget.onSubmitted!()),
                      child: const Text(
                        'Cập nhật',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String fieldName;
  final int maxLines;
  final String? Function(String?)? validation;
  final int? index;
  final bool? isShortenForm;
  final String? initialValue;
  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.fieldName,
    required this.maxLines,
    this.validation,
    this.index,
    this.isShortenForm,
    this.initialValue,
    this.formKey,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var model = context.watch<UpdateProfileState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isShortenForm ?? false ? size.width * 0.3 : size.width * 0.5,
          child: Text(fieldName, style: Style.stringText),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          width: Responsive.isDesktop(context)
              ? (isShortenForm ?? false ? size.width * 0.3 : size.width * 0.615)
              : size.width * 0.7,
          child: TextFormField(
            key: formKey,
            controller: controller,
            onChanged: (value) {
              if (fieldName == 'Họ của bạn') {
                model.updatedProfile.lastName = value;
              }
              if (fieldName == 'Tên của bạn') {
                model.updatedProfile.firstName = value;
              }
              if (fieldName == 'Tên hiển thị') {
                model.updatedProfile.displayName = value;
              }
              if (fieldName == 'Địa chỉ email của bạn') {
                model.updatedProfile.email = value;
              }
              if (fieldName == 'Số điện thoại') {
                model.updatedProfile.phone = value;
              }
              if (fieldName == 'Địa chỉ của bạn') {
                model.updatedProfile.address = value;
              }
            },
            initialValue: initialValue,
            validator: validation,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
