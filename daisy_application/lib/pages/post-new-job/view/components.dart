import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/domain-services/category_service.dart';
import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreateNewJobMobileBtn extends StatelessWidget {
  const CreateNewJobMobileBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: const Color(0xff262626),
      backgroundColor: Colors.white,
      tooltip: 'Find your new talent',
      onPressed: () {
        Navigator.pushNamed(context, '/post-new-job');
      },
      child: const Icon(Icons.add, size: 28),
    );
  }
}

class PostNewJobForm extends StatefulWidget {
  const PostNewJobForm({Key? key}) : super(key: key);

  @override
  State<PostNewJobForm> createState() => _PostNewJobFormState();
}

class _PostNewJobFormState extends State<PostNewJobForm> {
  List<dynamic> _categories = [];

  @override
  initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    CategoryService _categoryService = locator.get();
    Result result = await _categoryService.getAllParentCategories();
    setState(() {
      _categories = result.data.parentCategories;
    });
  }

  List<String> categories = [
    'Web & app design',
    'Logo & identity',
    'Business & advertising',
    'Clothing & merchandise',
    'Book & magazine',
    'Packaging & label',
  ];
  String dropdownValue = 'Web & app design';

  final _formKey = GlobalKey<FormState>();
  List<Widget> requestChildren = [];
  int indexRequestChild = 0;

  String datetimedisplay = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    Debug.log('---------------------hkjbkgdjnbkgd----');

    print(_categories);
    Size size = MediaQuery.of(context).size;
    double imgWidth =
        Responsive.isDesktop(context) ? size.width * 0.05 : size.width * 0.18;
    double childItemPadding =
        Responsive.isDesktop(context) ? size.width * 0.028 : size.width * 0.08;
    double formPaddingHorizontal =
        Responsive.isDesktop(context) ? size.width * 0.15 : size.width * 0.005;
    double formPaddingVertical =
        Responsive.isDesktop(context) ? size.width * 0.02 : size.width * 0.08;
    return SizedBox(
      width: size.width,
      height: 3000,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
              left: formPaddingHorizontal, top: formPaddingVertical),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: Responsive.isDesktop(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/post-new-job/general.png',
                      width: imgWidth),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Việc cần tuyển designer', style: Style.h6Bold),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                        fieldName: 'Đặt tên cụ thể cho công việc cần tuyển',
                        label: 'Tên dự án',
                        maxLines: 1,
                        validation: (value) {
                          if (value == null) {
                            return 'Giá trị nhập vào phải là số thập phân???';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      DropdownList(
                        categories: categories,
                        label: 'Chọn lĩnh vực cụ thể',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: Responsive.isDesktop(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/post-new-job/description.png',
                      width: imgWidth * 0.95),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Text('Thông tin đầy đủ về yêu cầu tuyển dụng',
                            style: Style.h6Bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const CustomTextField(
                        fieldName:
                            'Nội dung chi tiết, và các đầu việc cần Designer thực hiện (càng chi tiết designer càng có đầy đủ thông tin để hoàn thiện sản phẩm)',
                        label: 'Mô tả dự án ...',
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                        fieldName: 'Ngân sách dự án',
                        label: 'Ngân sách',
                        maxLines: 1,
                        validation: (value) {
                          if (value == null) {
                            return 'Giá trị nhập vào phải là số thập phân???';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        height: 50.0,
                        width: 700.0,
                        child: TextButton(
                            onPressed: () {
                              DatePicker.showDateTimePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2025, 6, 7, 05, 09),
                                  onChanged: (date) {
                                // print('abc');
                              }, onConfirm: (date) {
                                print('confirm $date');
                                setState(() {
                                  datetimedisplay = date.toString();
                                });
                              }, locale: LocaleType.vi);
                            },
                            child: SizedBox(
                              width: size.width * 0.5,
                              height: 300.0,
                              child: Row(
                                children: [
                                  const Icon(Icons.schedule,
                                      color: Colors.black),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Chọn thời hạn dự án:',
                                    style: Style.stringText,
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    datetimedisplay,
                                    style: const TextStyle(
                                      fontSize: 15.5,
                                      color:
                                          Color(BuiltinColor.blue_gradient_01),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: childItemPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: requestChildren.map(
                    (child) {
                      var index = requestChildren.indexOf(child);
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            tooltip: 'Xóa đầu việc này',
                            onPressed: () {
                              setState(() => {
                                    requestChildren.removeAt(index),
                                  });
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Color(BuiltinColor.blue_gradient_01),
                            ),
                          ),
                          child,
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: Responsive.isDesktop(context)
                        ? size.width * 0.665
                        : size.width * 0.33),
                child: TextButton.icon(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(
                      () => {
                        indexRequestChild++,
                        requestChildren.add(
                          ChildRequestForm(
                            index: indexRequestChild,
                          ),
                        )
                      },
                    );
                  },
                  label: const Text('Thêm đầu việc'),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: Responsive.isDesktop(context) ? 80.0 : 70.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(140.0, 60.0),
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        // Cancel post job.
                      },
                      child: const Text(
                        'Hủy bỏ',
                        style: TextStyle(
                          fontSize: 16.5,
                          color: Color(BuiltinColor.blue_gradient_01),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: Responsive.isDesktop(context) ? 50.0 : 0.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(140.0, 60.0),
                        primary: const Color(BuiltinColor.blue_gradient_01),
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text(
                        'Đăng việc',
                        style: TextStyle(fontSize: 16.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownList extends StatefulWidget {
  const DropdownList({Key? key, required this.label, required this.categories})
      : super(key: key);
  final String label;
  final List<String> categories;

  @override
  State<DropdownList> createState() => _DropdownListState(label, categories);
}

class _DropdownListState extends State<DropdownList> {
  late String _label;
  late List<String> _categories;
  late String dropdownValue;
  _DropdownListState(label, categories) {
    _label = label;
    _categories = categories;
    dropdownValue = _categories[0];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_label, style: Style.stringText),
        const SizedBox(height: 5.0),
        SizedBox(
          width: Responsive.isDesktop(context)
              ? size.width * 0.6
              : size.width * 0.7,
          height: 50,
          child: InputDecorator(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.expand_more),
                elevation: 16,
                style: Style.placeHolderText,
                onChanged: (String? newValue) {
                  setState(
                    () {
                      dropdownValue = newValue!;
                    },
                  );
                },
                items: _categories.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
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

class CustomTextField extends StatelessWidget {
  final String fieldName;
  final String label;
  final int maxLines;
  final String? Function(String?)? validation;

  const CustomTextField({
    Key? key,
    required this.fieldName,
    required this.label,
    required this.maxLines,
    this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.5,
          // child: Flexible(
          child: Text(fieldName, style: Style.stringText),
          // ),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          width: Responsive.isDesktop(context)
              ? size.width * 0.6
              : size.width * 0.7,
          child: TextFormField(
            validator: validation,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
            ),
          ),
        ),
      ],
    );
  }
}

class ChildRequestForm extends StatefulWidget {
  const ChildRequestForm({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ChildRequestForm> createState() => _ChildRequestFormState(index);
}

class _ChildRequestFormState extends State<ChildRequestForm> {
  late int _index;
  _ChildRequestFormState(int index) {
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Logo design',
      'Brand guide',
      'Business card',
      'Postcard, flyer or print',
      'Car, truck or van wrap',
      'PowerPoint template',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Đầu việc thứ $_index:',
          style: TextStyle(
            fontSize: 17.5,
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        DropdownList(
          categories: categories,
          label: 'Chọn lĩnh vực cụ thể cho đầu việc',
        ),
        const SizedBox(
          height: 5.0,
        ),
        CustomTextField(
          fieldName: 'Đặt tên cụ thể cho item $_index',
          label: 'Tên đầu việc',
          maxLines: 1,
          validation: (value) {
            if (value == null) {
              return 'Giá trị nhập vào phải là số thập phân???';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 5.0,
        ),
        const CustomTextField(
          fieldName: 'Nội dung chi tiết',
          label: 'Mô tả đầu việc',
          maxLines: 3,
        ),
        const SizedBox(height: 10.0),
        Container(
          color: Colors.grey.shade500,
          child: const SizedBox(height: 1.0, width: 200.0),
        ),
        const SizedBox(height: 25.0),
      ],
    );
  }
}
