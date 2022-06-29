import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/style.dart';
import 'package:daisy_application/app/common/widget/badge/custom_badge.dart';
import 'package:daisy_application/app/pages/update-profile/model/update_profile_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationState appState = context.watch();
    UserModel currentUser = appState.currentUser;

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
    // return CircleAvatar(
    //   radius: 60.0,
    //   backgroundImage: NetworkImage(currentUser.avatar!),
    // );
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

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({Key? key}) : super(key: key);

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ApplicationState appState = context.watch();
    UserModel currentUser = appState.currentUser;
    final _formKey = GlobalKey<FormState>();

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
                    initialValue: currentUser.firstName,
                    isShortenForm: true,
                  ),
                  const SizedBox(width: 20.0),
                  CustomTextField(
                    fieldName: 'Tên của bạn',
                    maxLines: 1,
                    initialValue: currentUser.lastName,
                    isShortenForm: true,
                  ),
                ],
              ),
            ),
            CustomTextField(
              fieldName: 'Tên hiển thị',
              maxLines: 1,
              initialValue: currentUser.displayName,
            ),
            CustomTextField(
              fieldName: 'Địa chỉ email của bạn',
              maxLines: 1,
              initialValue: currentUser.email,
            ),
            CustomTextField(
              fieldName: 'Số điện thoại',
              maxLines: 1,
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
                      onPressed: () {},
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

  const CustomTextField({
    Key? key,
    required this.fieldName,
    required this.maxLines,
    this.validation,
    this.index,
    this.isShortenForm,
    this.initialValue,
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
            initialValue: initialValue,
            onChanged: (value) {},
            validator: validation,
            maxLines: maxLines,
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
