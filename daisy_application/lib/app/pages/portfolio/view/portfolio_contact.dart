import 'package:daisy_application/app/common/design/design_style.dart';
import 'package:daisy_application/app/pages/portfolio/view/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension PortfolioContact on PortfolioPageState {
  Widget createContactTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.purple,
                  Colors.pinkAccent,
                ],
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Center(
            child: Text(
              screenState.portfolio?.freelancer?.displayName ??
                  'Barney Stinson',
              style: Design.textButton(
                textColor: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () async {
                    final Uri _url = Uri.parse(
                        'https://www.linkedin.com/in/ngoc-phan-thieu-856259128/');
                    await launchUrl(_url);
                  },
                  child: Text(
                    'Linkedin',
                    style: Design.textBody(),
                  )),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    //Call to launch email
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: screenState.portfolio?.freelancer?.email ??
                          'ptngoc22@gmail.com',
                    );
                    await launchUrl(emailLaunchUri);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Thêm liên lạc',
                        style: Design.textBody(textColor: Colors.white),
                      )
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: MediaQuery.of(context).size.width > 1200
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Experience',
                                style: Design.textSmallHeadline(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                                style: Design.textBody(),
                              ),
                              const Divider(),
                              Text(
                                'About Me',
                                style: Design.textSmallHeadline(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                screenState
                                        .portfolio?.freelancer?.description ??
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                                style: Design.textBody(),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 40),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Location',
                                          style: Design.textCaption(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.chevron_right,
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                              child: Text(
                                                screenState.portfolio
                                                        ?.freelancer?.address ??
                                                    '123 Main Street, New York, NY 10030',
                                                style: Design.textBody(),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Biography',
                                          style: Design.textCaption(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.chevron_right,
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                              child: Text(
                                                screenState
                                                        .portfolio?.biography ??
                                                    'Loremp was born into such wealth and privilege that her family inspired the phrase ‘keeping up with the Joneses',
                                                style: Design.textBody(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Email',
                                          style: Design.textCaption(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.chevron_right,
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                child: Text(
                                              screenState.portfolio?.freelancer
                                                      ?.email ??
                                                  'ptnngoc22@gmail.com',
                                              style: Design.textBody(),
                                            )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.launch,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Experience',
                              style: Design.textSmallHeadline(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              screenState.portfolio?.freelancer?.description ??
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                              style: Design.textBody(),
                            ),
                            const Divider(),
                            Text(
                              'About Me',
                              style: Design.textSmallHeadline(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              screenState.portfolio?.freelancer?.description ??
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                              style: Design.textBody(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          children: [
                            Card(
                              elevation: 2.0,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 15.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Location',
                                        style: Design.textCaption(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.chevron_right,
                                            size: 14,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Flexible(
                                            child: Text(
                                              screenState.portfolio?.freelancer
                                                      ?.address ??
                                                  '123 Main Street, New York, NY 10030',
                                              style: Design.textBody(),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Biography',
                                        style: Design.textCaption(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.chevron_right,
                                            size: 14,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Flexible(
                                            child: Text(
                                              screenState
                                                      .portfolio?.biography ??
                                                  'Loremp was born into such wealth and privilege that her family inspired the phrase ‘keeping up with the Joneses',
                                              style: Design.textBody(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Email',
                                        style: Design.textCaption(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.chevron_right,
                                            size: 14,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Flexible(
                                              child: Text(
                                            screenState.portfolio?.freelancer
                                                    ?.email ??
                                                'ptnngoc22@gmail.com',
                                            style: Design.textBody(),
                                          )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.launch,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
