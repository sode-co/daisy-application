import 'package:daisy_application/pages/categories-page/model/categories-page-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BodyCategoriesPageWeb extends StatefulWidget {
  const BodyCategoriesPageWeb({Key? key}) : super(key: key);

  @override
  State<BodyCategoriesPageWeb> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BodyCategoriesPageWeb> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoriesPageModel>(
      create: (context) => CategoriesPageModel(),
      child: Column(
        children: [
          renderLabelCheckbox('Logo & identity', 'logo'),
          renderLabelCheckbox('Branding', 'branding'),
          renderLabelCheckbox('Fine Art', 'art'),
          renderLabelCheckbox('Ngoc', 'ngoc'),
        ],
      ),
    );
  }

  LabeledCheckbox renderLabelCheckbox(label, data) {
    return LabeledCheckbox(
      label: label,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      data: data,
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
  }) : super(key: key);

  final String label;
  final String data;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoriesPageModel>(context);
    var isSelected = context
        .watch<CategoriesPageModel>()
        .selectedCategoriesList
        .contains(data);
    return InkWell(
      onTap: () {
        provider.updateSelectedCategoriesList(isSelected, data);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: isSelected,
              onChanged: (bool? newValue) {
                provider.updateSelectedCategoriesList(isSelected, data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
