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
          ExpansionTile(
            title:
                renderChildLabelCheckbox('Logo & Identity', 'Logo & Identity'),
            controlAffinity: ListTileControlAffinity.leading,
            children: LogoIdentityCategories.children
                .map((item) => renderChildLabelCheckbox(
                    item, LogoIdentityCategories.parent))
                .toList(),
          ),
        ],
      ),
    );
  }

  LabeledCheckbox renderChildLabelCheckbox(label, parentLabelName,
      {isParent = false}) {
    return LabeledCheckbox(
      label: label,
      parentLabelName: parentLabelName,
      isParent: isParent,
    );
  }
}

// Checkbox with text
class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.parentLabelName,
    required this.isParent,
  }) : super(key: key);

  final String label;
  final bool isParent;
  final String? parentLabelName;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoriesPageModel>(context);
    var isSelected = context
        .watch<CategoriesPageModel>()
        .labelSelectedCategories
        .contains(label);
    return InkWell(
      onTap: () {
        provider.updateSelectedCategoriesList(
            isSelected, label, parentLabelName);
      },
      child: Padding(
        padding: (label == parentLabelName)
            ? const EdgeInsets.symmetric(horizontal: 15)
            : const EdgeInsets.only(left: 80, right: 30),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: isSelected,
              onChanged: (bool? newValue) {
                provider.updateSelectedCategoriesList(
                    isSelected, label, parentLabelName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
