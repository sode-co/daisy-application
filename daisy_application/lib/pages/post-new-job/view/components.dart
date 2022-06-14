import 'package:daisy_application/pages/common/style.dart';
import 'package:flutter/material.dart';

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
  String dropdownValue = 'One';
  List<String> categories = ['One', 'Two', 'Three', 'Four'];
  final _formKey = GlobalKey<FormState>();
  List<Widget> requestChildren = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 3000,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/post-new-job/general.png',
                    width: size.width * 0.18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Việc cần tuyển designer', style: Style.h6Bold),
                    renderDropdownList(
                        'Chọn lĩnh vực cần tuyển', categories, size),
                    const CustomTextField(
                      fieldName: 'Đặt tên cụ thể cho công việc bạn cần tuyển',
                      label: 'Tên dự án',
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/post-new-job/description.png',
                    width: size.width * 0.2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.8,
                      child: Flexible(
                        child: Text('Thông tin đầy đủ về yêu cầu tuyển dụng',
                            style: Style.h6Bold),
                      ),
                    ),
                    const CustomTextField(
                      fieldName:
                          'Nội dung chi tiết, và các đầu việc cần Designer thực hiện (càng chi tiết designer càng có đầy đủ thông tin để hoàn thiện sản phẩm)',
                      label: 'Mô tả dự án',
                      maxLines: 12,
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
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(
                  () => {requestChildren.add(const ChildRequestForm())},
                );
              },
            ),
            Column(
              children: requestChildren,
            ),
            ElevatedButton(
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
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Column renderDropdownList(String label, List<String> categoris, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Style.stringText),
        SizedBox(
          width: size.width * 0.8,
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
                items: categories.map<DropdownMenuItem<String>>(
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
            width: size.width * 0.8,
            child: Flexible(child: Text(fieldName, style: Style.stringText))),
        SizedBox(
          width: size.width * 0.8,
          height: 100,
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
  const ChildRequestForm({Key? key}) : super(key: key);

  @override
  State<ChildRequestForm> createState() => _ChildRequestFormState();
}

class _ChildRequestFormState extends State<ChildRequestForm> {
  @override
  Widget build(BuildContext context) {
    return const Text('ChildRequestFormState');
  }
}
