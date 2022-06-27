import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:daisy_application/app/pages/admin/constants.dart';
import 'package:daisy_application/app/pages/admin/responsive.dart';
import 'package:daisy_application/app/pages/admin/screens/dashboard/components/header.dart';
import 'package:daisy_application/app/pages/admin/user-management/model/user_management_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserManagementBody extends StatefulWidget {
  const UserManagementBody({Key? key}) : super(key: key);

  @override
  State<UserManagementBody> createState() => _UserManagementBodyState();
}

class _UserManagementBodyState extends State<UserManagementBody> {
  List recentUsers = [
    RecentUser(
      name: 'My Nguyen',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '01-03-2021',
      posts: '4',
    ),
    RecentUser(
      name: 'Phuong Anh',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '27-02-2021',
      posts: '19',
    ),
    RecentUser(
      name: 'Dan Linh',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '27-02-2021',
      posts: '19',
    ),
    RecentUser(
      name: 'Anh Ngoc',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'ChiPu',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '21-02-2021',
      posts: '3',
    ),
    RecentUser(
      name: 'Bao Chau',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Vu Thanh Van',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '23-02-2021',
      posts: '2',
    ),
    RecentUser(
      name: 'Tuyet Lan',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '25-02-2021',
      posts: '3',
    ),
    RecentUser(
      name: 'Linh Le',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Xuan Anh',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Chau Duyen',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Quynh Anh',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '25-02-2021',
      posts: '34',
    ),
    RecentUser(
      name: 'Emma Le',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Quynh Anh',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '25-02-2021',
      posts: '34',
    ),
    RecentUser(
      name: 'Emma Le',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      phone: '0898234567',
      date: '23-02-2021',
      posts: '32',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var paddingTable = Responsive.isDesktop(context) ? 50.0 : 0.0;
    var model = context.watch<UserManagementState>();
    var firstIndex = model.pageCount * 13 <= recentUsers.length - 12
        ? model.pageCount * 13
        : recentUsers.length - 12;
    var secondIndex = (model.pageCount * 13) + 12 <= recentUsers.length - 1
        ? (model.pageCount * 13) + 12
        : recentUsers.length - 1;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingTable),
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingTable),
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
                              'Ngày đăng kí',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Lượt thích',
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
                            .sublist(firstIndex, secondIndex)
                            .map((user) => recentUserDataRow(user, context))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: Responsive.isMobile(context)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      model.previousPage();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.black),
                    onPressed: () {
                      model.nextPage();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentUser {
  final String? icon, name, phone, date, posts, role, email;

  RecentUser({
    this.icon,
    this.name,
    this.phone,
    this.date,
    this.posts,
    this.role,
    this.email,
  });
}

DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
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
              text: userInfo.name!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                userInfo.name!,
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
            borderRadius: const BorderRadius.all(const Radius.circular(5.0) //
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
        Text(userInfo.date!),
      ),
      DataCell(
        Text(userInfo.posts!),
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
              label: const Text('Edit'),
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
                                'Xác nhận xóa người dùng',
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
                                      "Are you sure want to delete '${userInfo.name}'?"),
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
                                          label: const Text('Delete'))
                                    ],
                                  )
                                ],
                              ),
                            )),
                      );
                    });
              },
              // Delete
              label: const Text('Delete'),
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
