import 'package:daisy_application/pages/categories-page/model/categories-page-model.dart';
import 'package:daisy_application/pages/landing-page/web.dart';
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
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: ChangeNotifierProvider<CategoriesPageModel>(
            create: (context) => CategoriesPageModel(),
            child: CategoriesPageComponent.renderCategoriesCheckbox(),
          ),
        ),
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 220, 220, 220)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.05, horizontal: size.width * 0.05),
            child: renderFooter(size.width),
          ),
        ),
      ],
    );
  }

  Column renderFooter(pageWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Footer.renderResourceFooter(),
        Row(
          children: [
            SizedBox(width: pageWidth * 0.41),
            Footer.renderCopyright(),
            Padding(
                padding: EdgeInsets.only(left: pageWidth * 0.05),
                child: Footer.renderSocialMediaButton()),
          ],
        ),
      ],
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

class CategoriesPageComponent {
  static SizedBox renderCategoriesCheckbox() {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
          renderExpansionCategory(LogoIdentity.parent),
          renderExpansionCategory(WebAppDesign.parent),
          renderExpansionCategory(BusinessAdvertising.parent),
          renderExpansionCategory(ClothingMerchandise.parent),
          renderExpansionCategory(ArtIllustration.parent),
          renderExpansionCategory(PackagingLabel.parent),
          renderExpansionCategory(BookMagazine.parent),
        ],
      ),
    );
  }

  static ExpansionTile renderExpansionCategory(categoryName) {
    List<String> categories = [];
    if (categoryName == LogoIdentity.parent) categories = LogoIdentity.children;
    if (categoryName == WebAppDesign.parent) categories = WebAppDesign.children;
    if (categoryName == BusinessAdvertising.parent) {
      categories = BusinessAdvertising.children;
    }
    if (categoryName == ClothingMerchandise.parent) {
      categories = ClothingMerchandise.children;
    }
    if (categoryName == ArtIllustration.parent) {
      categories = ArtIllustration.children;
    }
    if (categoryName == PackagingLabel.parent) {
      categories = PackagingLabel.children;
    }
    if (categoryName == BookMagazine.parent) categories = BookMagazine.children;
    return ExpansionTile(
      title: renderChildLabelCheckbox(categoryName, categoryName),
      controlAffinity: ListTileControlAffinity.leading,
      children: categories
          .map((item) => renderChildLabelCheckbox(item, categoryName))
          .toList(),
    );
  }

  static LabeledCheckbox renderChildLabelCheckbox(label, parentLabelName,
      {isParent = false}) {
    return LabeledCheckbox(
      label: label,
      parentLabelName: parentLabelName,
      isParent: isParent,
    );
  }
}
