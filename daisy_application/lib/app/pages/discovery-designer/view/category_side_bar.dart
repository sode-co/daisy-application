// Checkbox with text
import 'package:daisy_application/app/pages/discovery-designer/model/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
