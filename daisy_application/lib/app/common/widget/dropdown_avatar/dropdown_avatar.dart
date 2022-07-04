import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class AvatarDropdownMenu extends StatefulWidget {
  const AvatarDropdownMenu({Key? key}) : super(key: key);

  @override
  State<AvatarDropdownMenu> createState() => _AvatarDropdownMenuState();
}

class _AvatarDropdownMenuState extends State<AvatarDropdownMenu> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    ApplicationState appState = context.watch();
    UserModel currentUser = appState.currentUser;

    return PopupMenuButton<Menu>(
        child: CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage(currentUser.avatar!),
        ),
        // Callback that sets the selected popup menu item.
        onSelected: (Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black54),
                  ),
                  icon: const Icon(Icons.person_outline),
                  onPressed: _navigationListener.onBtnProfileDetailsClicked,
                  label: const Text('Trang cá nhân'),
                ),
              ),
              PopupMenuItem<Menu>(
                value: Menu.itemTwo,
                child: TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black54),
                  ),
                  icon: const Icon(Icons.settings),
                  onPressed: _navigationListener.onBtnProfileDetailsClicked,
                  label: const Text('Cài đặt'),
                ),
              ),
              PopupMenuItem<Menu>(
                value: Menu.itemThree,
                child: TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black54),
                  ),
                  icon: const Icon(Icons.logout),
                  onPressed: _authenticationListener.onBtnSignoutClicked,
                  label: const Text('Đăng xuất'),
                ),
              ),
            ]);
  }

  HeaderNavigationListener get _navigationListener =>
      context.findAncestorStateOfType()!;
  HeaderAuthenticationListener get _authenticationListener =>
      context.findAncestorStateOfType()!;
}
