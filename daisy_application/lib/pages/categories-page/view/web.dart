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
          LabeledCheckbox(
            label: 'This is the label text',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            data: 'test',
          ),
        ],
      ),
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
    List<String> cateList = context.watch().selectedCategoriesList;
    var isSelected = cateList.indexOf(label) > -1;
    return Consumer<CategoriesPageModel>(
      builder: (context, mymodel, child) {
        return InkWell(
          onTap: () {
            mymodel.updateSelectedCategoriesList(isSelected, label);
          },
          child: Padding(
            padding: padding,
            child: Row(
              children: <Widget>[
                Expanded(child: Text(label)),
                Checkbox(
                  value: isSelected,
                  onChanged: (bool? newValue) {
                    mymodel.updateSelectedCategoriesList(isSelected, label);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
