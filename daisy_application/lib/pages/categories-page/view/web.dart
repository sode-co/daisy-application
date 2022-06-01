import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BodyCategoriesPageWeb extends StatefulWidget {
  const BodyCategoriesPageWeb({Key? key}) : super(key: key);

  @override
  State<BodyCategoriesPageWeb> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BodyCategoriesPageWeb> {
  List<Map<String, bool>> categoriesList = [
    {'logo': true}
  ];
  static List<String> requestCategories = [];

  @override
  Widget build(BuildContext context) {
    var _isSelected = true;
    return Column(
      children: [
        LabeledCheckbox(
          label: 'This is the label text',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
          data: 'test',
        ),
        LabeledCheckbox(
          label: 'This is the abc text',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
          data: 'abc',
        )
      ],
    );
  }
}

// Checkbox with text
class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.data,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final String data;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
                if (newValue!) {
                  _MyWidgetState.requestCategories.add(data);
                } else {
                  var idx = _MyWidgetState.requestCategories.indexOf(data);
                  _MyWidgetState.requestCategories.removeAt(idx);
                }
                print(_MyWidgetState.requestCategories);
              },
            ),
          ],
        ),
      ),
    );
  }
}
