import 'package:flutter/material.dart';

class CategoriesPageModel with ChangeNotifier {
  List<String> labelSelectedCategories = [];

  void removeIfExisted(list, item) {
    if (list.contains(item)) {
      list.removeAt(list.indexOf(item));
    }
  }

  void updateSelectedCategoriesList(isSelected, label, parentLabelName) {
    if (!isSelected) {
      labelSelectedCategories.add(label);

      // if it is parent label, we will deselect all children label names
      if (label == parentLabelName) {
        if (parentLabelName == 'Logo & Identity') {
          for (var item in LogoIdentity.children) {
            removeIfExisted(labelSelectedCategories, item);
          }
        }
      }
      // if it is child label, we will deselect its parent label
      else {
        removeIfExisted(labelSelectedCategories, parentLabelName);
      }
    } else {
      var index = labelSelectedCategories.indexOf(label);
      labelSelectedCategories.removeAt(index);
    }
    print(labelSelectedCategories);
    notifyListeners();
  }
}

class LogoIdentity {
  static var parent = 'Logo & Identity';
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
  static var parent = 'Web & app design';
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
  static var parent = 'Business & advertising';
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
  static var parent = 'Clothing & merchandise';
  static List<String> children = [
    'T-shirt',
    'Clothing or apparel',
    'Merchandise',
    'Cup or mug',
    'Sticker',
  ];
}

class ArtIllustration {
  static var parent = 'Art & illustration';
  static List<String> children = [
    'Illustration or graphics',
    'Card or invitation',
    'Character or mascot',
    'Tattoo',
    '3D',
  ];
}

class PackagingLabel {
  static var parent = 'Packaging & label';
  static List<String> children = [
    'Product packaging',
    'Product label',
  ];
}

class BookMagazine {
  static var parent = 'Book & magazine';
  static List<String> children = [
    'Book cover',
    'Magazine cover',
    'Typesetting',
    'Typesetting with imagery',
  ];
}
