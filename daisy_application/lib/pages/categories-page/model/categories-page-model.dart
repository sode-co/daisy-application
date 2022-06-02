import 'package:flutter/material.dart';

class CategoriesPageModel with ChangeNotifier {
  List<String> labelSelectedCategories = [];

  void removeIfExisted(list, item) {
    if (list.contains(item)) {
      list.removeAt(list.indexOf(item));
    }
  }

  void updateSelectedCategoriesList(isSelected, categoryName, parentLabelName) {
    if (!isSelected) {
      labelSelectedCategories.add(categoryName);

      // if it is parent label, we will deselect all children label names

      if (categoryName == parentLabelName) {
        List<String> childrenCategoriesList = [];
        if (categoryName == LogoIdentity.parent) {
          childrenCategoriesList = LogoIdentity.children;
        }
        if (categoryName == WebAppDesign.parent) {
          childrenCategoriesList = WebAppDesign.children;
        }
        if (categoryName == BusinessAdvertising.parent) {
          childrenCategoriesList = BusinessAdvertising.children;
        }
        if (categoryName == ClothingMerchandise.parent) {
          childrenCategoriesList = ClothingMerchandise.children;
        }
        if (categoryName == ArtIllustration.parent) {
          childrenCategoriesList = ArtIllustration.children;
        }
        if (categoryName == PackagingLabel.parent) {
          childrenCategoriesList = PackagingLabel.children;
        }
        if (categoryName == BookMagazine.parent) {
          childrenCategoriesList = BookMagazine.children;
        }

        for (var item in childrenCategoriesList) {
          removeIfExisted(labelSelectedCategories, item);
        }
      }
      // if it is child label, we will deselect its parent label
      else {
        removeIfExisted(labelSelectedCategories, parentLabelName);
      }
    } else {
      var index = labelSelectedCategories.indexOf(categoryName);
      labelSelectedCategories.removeAt(index);
    }
    print(labelSelectedCategories);
    notifyListeners();
  }
}

class LogoIdentity {
  static String parent = 'Logo & Identity';
  static List<String> children = [
    'Logo design',
    'Brand identity pack',
    'Social media pack',
    'Hosted website',
    'Business card',
    'Brand guide',
    'Stationery',
    'Product packaging'
  ];
}

class WebAppDesign {
  static String parent = 'Web & app design';
  static List<String> children = [
    'Web page design',
    'WordPress theme design',
    'Landing page design',
    'Icon or button',
    'App design',
    'Facebook cover',
    'Social media page',
    'Banner ad'
  ];
}

class BusinessAdvertising {
  static String parent = 'Business & advertising';
  static List<String> children = [
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
  ];
}

class ClothingMerchandise {
  static String parent = 'Clothing & merchandise';
  static List<String> children = [
    'T-shirt',
    'Clothing or apparel',
    'Merchandise',
    'Cup or mug',
    'Sticker',
  ];
}

class ArtIllustration {
  static String parent = 'Art & illustration';
  static List<String> children = [
    'Illustration or graphics',
    'Card or invitation',
    'Character or mascot',
    'Tattoo',
    '3D',
  ];
}

class PackagingLabel {
  static String parent = 'Packaging & label';
  static List<String> children = [
    'Product packaging',
    'Product label',
  ];
}

class BookMagazine {
  static String parent = 'Book & magazine';
  static List<String> children = [
    'Book cover',
    'Magazine cover',
    'Typesetting',
    'Typesetting with imagery',
  ];
}
