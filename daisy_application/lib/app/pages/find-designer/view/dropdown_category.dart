import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/style.dart';
import 'package:daisy_application/app/pages/find-designer/deps/find_designer_page_deps.dart';
import 'package:daisy_application/app/pages/find-designer/model/find_designer_page_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/http/category/category_rest_api.dart';
import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownList extends StatefulWidget {
  const DropdownList({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  State<DropdownList> createState() => _DropdownListState(label);
}

class _DropdownListState extends State<DropdownList> {
  List<CategoryModel> _categories = [];

  @override
  initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    CategoryRestApi _categoryClient = locator.get();
    Result result = await _categoryClient.getParentCategories().Value();
    setState(() {
      _categories = result.data.parentCategories;
      dropdownValue = _categories[0];
    });
  }

  late String _label;
  CategoryModel dropdownValue = CategoryModel.init()..name = '';
  FindDesignerListener get listener => context.findAncestorStateOfType()!;

  _DropdownListState(
    label,
  ) {
    _label = label;
  }

  @override
  Widget build(BuildContext context) {
    var model = context.watch<FindDesigneScreenState>();
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_label, style: Style.stringText),
        const SizedBox(height: 5.0),
        SizedBox(
          width: Responsive.isDesktop(context)
              ? size.width * 0.2
              : size.width * 0.7,
          height: 50,
          child: InputDecorator(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CategoryModel>(
                value: dropdownValue,
                icon: const Icon(Icons.expand_more),
                elevation: 16,
                style: Style.placeHolderText,
                onChanged: (CategoryModel? newValue) {
                  model.parentCategory = newValue!;
                  listener.onSearchDesignersByCategoryId(newValue.id ?? 1);
                  Debug.log('model.designers', model.designers);
                  setState(
                    () {
                      dropdownValue = newValue;
                    },
                  );
                },
                items: _categories.map<DropdownMenuItem<CategoryModel>>(
                  (CategoryModel value) {
                    return DropdownMenuItem<CategoryModel>(
                      value: value,
                      child: Text(value.name!),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownChildrenList extends StatefulWidget {
  const DropdownChildrenList(
      {Key? key,
      required this.label,
      required this.parentName,
      required this.index})
      : super(key: key);
  final String label;
  final String parentName;
  final int index;
  @override
  State<DropdownChildrenList> createState() => _DropdownChildrenListState();
}

class _DropdownChildrenListState extends State<DropdownChildrenList> {
  List<CategoryModel> _categories = [];

  @override
  initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    CategoryRestApi _categoryClient = locator.get();
    Result result = await _categoryClient
        .getChildrenCategoriesByParentName(widget.parentName)
        .Value();
    setState(() {
      _categories = result.data.childCategories;
      dropdownValue = _categories[0];
    });
  }

  CategoryModel dropdownValue = CategoryModel.init()..name = '';

  @override
  Widget build(BuildContext context) {
    var model = context.watch<FindDesigneScreenState>();
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Style.stringText),
        const SizedBox(height: 5.0),
        SizedBox(
          width: Responsive.isDesktop(context)
              ? size.width * 0.2
              : size.width * 0.7,
          height: 50,
          child: InputDecorator(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CategoryModel>(
                value: dropdownValue,
                icon: const Icon(Icons.expand_more),
                elevation: 16,
                style: Style.placeHolderText,
                onChanged: (CategoryModel? newValue) {
                  model.childCategory = newValue;
                  setState(
                    () {
                      dropdownValue = newValue!;
                    },
                  );
                },
                items: _categories.map<DropdownMenuItem<CategoryModel>>(
                  (CategoryModel value) {
                    return DropdownMenuItem<CategoryModel>(
                      value: value,
                      child: Text(value.name!),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
