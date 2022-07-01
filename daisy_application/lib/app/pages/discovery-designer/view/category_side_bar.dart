import 'package:flutter/material.dart';

class AutocompleteBasic extends StatelessWidget {
  const AutocompleteBasic({Key? key}) : super(key: key);

  static const List<String> _kOptions = <String>[
    'Logo design',
    'Brand identity pack',
    'Social media pack',
    'Hosted website',
    'Business card',
    'Brand guide',
    'Stationery',
    'Product packaging',
    'Web page design',
    'WordPress theme design',
    'Landing page design',
    'Icon or button',
    'App design',
    'Facebook cover',
    'Social media page',
    'Banner ad',
    'Postcard, flyer or print',
    'Poster',
    'Infographic',
    'Brochure',
    'Car, truck or van wrap',
    'Signage',
    'Email',
    'PowerPoint template',
    'Menu',
    'Album Cover',
    'Podcast',
    'T-shirt',
    'Clothing or apparel',
    'Merchandise',
    'Cup or mug',
    'Sticker',
    'Illustration or graphics',
    'Card or invitation',
    'Character or mascot',
    'Tattoo',
    '3D',
    'Product packaging',
    'Product label',
    'Book cover',
    'Magazine cover',
    'Typesetting',
    'Typesetting with imagery',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tìm kiếm theo thể loại:',
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 5.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          width: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _kOptions.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                debugPrint('You just selected $selection');
              },
            ),
          ),
        ),
      ],
    );
  }
}
