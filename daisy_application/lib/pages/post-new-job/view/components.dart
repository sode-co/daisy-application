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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        width: 800,
        height: 3000,
        child: Column(
          children: [
            Row(
              verticalDirection: VerticalDirection.up,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Việc cần tuyển designer', style: Style.h6Bold),
                    renderDropdownList(
                        'Chọn lĩnh vực cần tuyển', categories, size),
                    renderTitleTextField(
                        'Đặt tên cụ thể cho công việc bạn cần tuyển',
                        'Tên dự án',
                        size),
                  ],
                ),
              ],
            ),
            Row(),
          ],
        ));
  }

  Column renderTitleTextField(String fieldName, String label, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: Style.stringText),
        SizedBox(
          width: size.width * 0.8,
          height: 100,
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
            ),
          ),
        ),
      ],
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
