import 'package:daisy_application/app/common/style.dart';
import 'package:flutter/material.dart';

class DropDownItem<T> {
  final T value;
  final String name;

  DropDownItem(this.value, this.name);
}

class DropdownList<T> extends StatefulWidget {
  final List<DropDownItem<T>> items;
  final Function(dynamic)? onItemSelected;
  final double? height;

  const DropdownList(
      {Key? key, this.onItemSelected, required this.items, this.height})
      : super(key: key);

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState<T> extends State<DropdownList<T>> {
  late DropDownItem<T> dropdownValue;

  @override
  initState() {
    dropdownValue = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDecorator(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(),
          ),
          child: SizedBox(
            height: widget.height,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<DropDownItem<T>>(
                  value: dropdownValue,
                  icon: const Icon(Icons.expand_more),
                  elevation: 16,
                  style: Style.placeHolderText,
                  onChanged: (DropDownItem<T>? newValue) {
                    setState(
                      () {
                        dropdownValue = newValue!;
                      },
                    );
                  },
                  items: widget.items.map<DropdownMenuItem<DropDownItem<T>>>(
                    (DropDownItem<T> value) {
                      return DropdownMenuItem<DropDownItem<T>>(
                        value: value,
                        child: Text(value.name),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
