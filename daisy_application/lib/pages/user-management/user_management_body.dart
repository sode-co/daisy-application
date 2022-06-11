import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:daisy_application/pages/admin/constants.dart';
import 'package:daisy_application/pages/admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

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
      date: '01-03-2021',
      posts: '4',
    ),
    RecentUser(
      name: 'Phuong Anh',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      date: '27-02-2021',
      posts: '19',
    ),
    RecentUser(
      name: 'Dan Linh',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      date: '27-02-2021',
      posts: '19',
    ),
    RecentUser(
      name: 'Anh Ngoc',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'ChiPu',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      date: '21-02-2021',
      posts: '3',
    ),
    RecentUser(
      name: 'Bao Chau',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Vu Thanh Van',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      date: '23-02-2021',
      posts: '2',
    ),
    RecentUser(
      name: 'Tuyet Lan',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      date: '25-02-2021',
      posts: '3',
    ),
    RecentUser(
      name: 'Linh Le',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Xuan Anh',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Chau Duyen',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      date: '23-02-2021',
      posts: '32',
    ),
    RecentUser(
      name: 'Quynh Anh',
      role: 'Khách hàng',
      email: 'abc@gmail.com',
      date: '25-02-2021',
      posts: '34',
    ),
    RecentUser(
      name: 'Emma Le',
      role: 'Nhà thiết kế',
      email: 'abc@gmail.com',
      date: '23-02-2021',
      posts: '32',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          'Chức danh',
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
                    rows: List.generate(
                      recentUsers.length,
                      (index) => recentUserDataRow(recentUsers[index], context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentUser {
  final String? icon, name, date, posts, role, email;

  RecentUser(
      {this.icon, this.name, this.date, this.posts, this.role, this.email});
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
                                  const SizedBox(
                                    height: 30,
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
