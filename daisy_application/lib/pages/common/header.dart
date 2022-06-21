import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/http/category/category_rest_api.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:daisy_application/pages/landing-page/view/common.dart';
import 'package:daisy_application/pages/listeners/WidgetListener.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ApplicationState appState = context.watch();
    final isLoggedIn = appState.isLoggedIn;
    WidgetListener listener = context.read();
    return AppBar(
      title: (Responsive.isDesktop(context))
          ? Row(
              children: <Widget>[
                const SizedBox(width: 150),
                Image.asset('assets/images/weblogo.png', width: 100),
                TextButton(
                    child: const Text('Danh mục', style: Style.stringBold),
                    onPressed: () {
                      Navigator.pushNamed(context, '/categories');
                    }),
                TextButton(
                    child: const Text('Đăng tin', style: Style.stringBold),
                    onPressed: () {
                      Navigator.pushNamed(context, '/post-new-job');
                    }),
                TextButton(
                  child:
                      const Text('Tìm kiếm designer', style: Style.stringBold),
                  onPressed: () {},
                ),
                TextButton(
                  child:
                      const Text('Tìm việc freelance', style: Style.stringBold),
                  onPressed: () {
                    Navigator.pushNamed(context, '/find-freelance-job');
                  },
                ),
                TextButton(
                  child: const Text('Test api call all parents category',
                      style: Style.stringBold),
                  onPressed: () async {
                    CategoryRestApi _categoryClient = locator.get();
                    Result result =
                        await _categoryClient.getParentCategories().Value();
                    Debug.log(result.data.parentCategories[0]['name']);
                    String parentName = 'Nhận diện thương hiệu';
                    result = await (_categoryClient
                        .getChildrenCategoriesByParentName(parentName)
                        .Value());
                    Debug.log(result.data.childCategories);
                  },
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset('assets/images/weblogo.png', width: 100)),
      actions: <Widget>[
        if (Responsive.isDesktop(context)) const SizedBox(width: 5),
        const SizedBox(width: 1),
        if (!isLoggedIn) ...[
          const SignUpButton(),
          if (Responsive.isDesktop(context)) const SizedBox(width: 10),
          const Center(child: Text('  ')),
          TextButton(
              onPressed: () => listener.onBtnSigninClicked(),
              child: const Text('Đăng nhập', style: Style.mediumStringBold)),
        ],
        if (isLoggedIn)
          TextButton(
              child: const Text('Đăng xuất', style: Style.mediumStringBold),
              onPressed: () async {
                appState.isLoggedIn = false;
                await Hive.box(AuthenticationPersistent.BOX_NAME).clear();
              }),
        if (Responsive.isDesktop(context)) SizedBox(width: size.width * 0.1),
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
