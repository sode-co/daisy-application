import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:daisy_application/app/pages/admin/constants.dart';
import 'package:daisy_application/app/pages/admin/responsive.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

class CandidateListBody extends StatefulWidget {
  const CandidateListBody({Key? key}) : super(key: key);

  @override
  State<CandidateListBody> createState() => _CandidateListBodyState();
}

class _CandidateListBodyState extends State<CandidateListBody> {
  List recentUsers = [
    UserModel(
        1,
        'firstName',
        'lastName',
        'Truc Linh',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
    UserModel(
        1,
        'firstName',
        'lastName',
        'Minh Trang',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
    UserModel(
        1,
        'firstName',
        'lastName',
        'Phuong Linh',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
    UserModel(
        1,
        'firstName',
        'lastName',
        'Xuan Hoa',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
    UserModel(
        1,
        'firstName',
        'lastName',
        'Khanh Huyen',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
    UserModel(
        1,
        'firstName',
        'lastName',
        'Dao Anh',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
    UserModel(
        1,
        'firstName',
        'lastName',
        'Lan Anh',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
    UserModel(
        1,
        'firstName',
        'lastName',
        'Dao Anh',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
    UserModel(
        1,
        'firstName',
        'lastName',
        'Nguyen Anh',
        'truclinhnguyen@gmail.com',
        'Designer',
        'settings',
        'avatar',
        '149 Do Dang Tuyen, Thu Duc, Ho Chi Minh',
        '0868 123 987'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: DataTable(
                        horizontalMargin: 0,
                        columnSpacing: defaultPadding,
                        columns: [
                          DataColumn(
                            label: Text(
                              'Họ tên',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Vai trò',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'E-mail',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Số điện thoại',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Địa chỉ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Số điện thoại',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          const DataColumn(
                            label: Text(''),
                          ),
                        ],
                        rows: recentUsers
                            .map((user) => recentUserDataRow(user, context))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(UserModel userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            TextAvatar(
              size: 35,
              backgroundColor: Colors.white,
              textColor: Colors.white,
              fontSize: 14,
              upperCase: true,
              numberLetters: 1,
              shape: Shape.Rectangle,
              text: userInfo.displayName!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                userInfo.displayName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      DataCell(
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.role).withOpacity(.2),
            border: Border.all(color: getRoleColor(userInfo.role)),
            borderRadius: const BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: Text(
            userInfo.role!,
            style: const TextStyle(fontFamily: 'Roboto'),
          ),
        ),
      ),
      DataCell(
        Text(
          userInfo.email!,
        ),
      ),
      DataCell(
        Text(
          userInfo.phone!,
        ),
      ),
      DataCell(
        Text(userInfo.address!),
      ),
      DataCell(
        Text(userInfo.phone!),
      ),
      DataCell(
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.withOpacity(0.5),
              ),
              icon: const Icon(
                Icons.edit,
                size: 14,
              ),
              onPressed: () {},
              // Edit
              label: const Text('Duyệt'),
            ),
            const SizedBox(
              width: 6,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green.withOpacity(0.5),
              ),
              icon: const Icon(
                Icons.visibility,
                size: 14,
              ),
              onPressed: () {},
              //View
              label: const Text('View'),
            ),
            const SizedBox(
              width: 6,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.red.withOpacity(0.5),
              ),
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return Theme(
                        data: Theme.of(context)
                            .copyWith(dialogBackgroundColor: Colors.white),
                        child: AlertDialog(
                            title: const Center(
                              child: Text(
                                'Xác nhận từ chối người dùng',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            content: Container(
                              color: secondaryColor,
                              height: 90,
                              child: Column(
                                children: [
                                  Text(
                                      "Xác nhận từ chối người dùng '${userInfo.displayName}'?"),
                                  SizedBox(
                                    height:
                                        Responsive.isDesktop(context) ? 30 : 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                          icon: const Icon(
                                            Icons.close,
                                            size: 14,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey.shade400,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          label: const Text('Cancel')),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton.icon(
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 14,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () {},
                                          label: const Text('Từ chối'))
                                    ],
                                  )
                                ],
                              ),
                            )),
                      );
                    });
              },
              // Delete
              label: const Text('Từ chối'),
            ),
          ],
        ),
      ),
    ],
  );
}

Color getRoleColor(String? role) {
  if (role == 'Khách hàng') {
    return Colors.green;
  } else if (role == 'Software Architect') {
    return Colors.red;
  } else if (role == 'Software Engineer') {
    return Colors.blueAccent;
  } else if (role == 'Customer') {
    return Colors.amberAccent;
  } else if (role == 'Project Manager') {
    return Colors.cyanAccent;
  } else if (role == 'Nhà thiết kế') {
    return Colors.orange;
  } else if (role == 'UI/UX Designer') {
    return Colors.indigoAccent;
  }
  return Colors.black38;
}
