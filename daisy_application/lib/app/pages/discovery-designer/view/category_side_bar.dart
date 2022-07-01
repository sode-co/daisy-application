import 'package:flutter/material.dart';

class AutocompleteBasic extends StatelessWidget {
  const AutocompleteBasic({Key? key}) : super(key: key);

  static const List<String> _categoriesListOption = <String>[];

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
                return _categoriesListOption.where((String option) {
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
