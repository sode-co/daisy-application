import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/common/design/design_style.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/app/dialogs/artwork_dialog.dart';
import 'package:daisy_application/app/pages/portfolio/view/portfolio.dart';
import 'package:flutter/material.dart';

extension PortfolioArtworks on PortfolioPageState {
  Widget createPortfolioTab() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 41, 180, 113)),
              ),
              onPressed: () {
                context.show(AddArtworkDialog(context, () {
                  listener.onAddArtworkBtnClick(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    'https://lh3.googleusercontent.com/a-/AOh14GjF4em_5pQS0cyjExgf0nb2opybohyK8FSLuN9YhNk=s96-c',
                  );
                  context.toastSuccess('Thêm addwork thành công');
                  Navigator.of(context, rootNavigator: true).pop();
                }));
              },
              child: SizedBox(
                width: 130.0,
                height: 50.0,
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Colors.white, size: 18.0),
                    const SizedBox(width: 10.0),
                    Text(
                      'Thêm artwork',
                      style: Design.textButtonSmall(textColor: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.8,
              child: GridView.count(
                crossAxisCount: Responsive.isDesktop(context) ? 3 : 2,
                children:
                    List.generate(screenState.artworks?.length ?? 0, (index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        screenState.artworks?[index].image ??
                            'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
