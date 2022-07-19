import 'package:daisy_application/app/common/design/design_style.dart';
import 'package:daisy_application/app/common/responsive.dart';
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
              onPressed: () {},
              child: SizedBox(
                width: 120.0,
                height: 40.0,
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
