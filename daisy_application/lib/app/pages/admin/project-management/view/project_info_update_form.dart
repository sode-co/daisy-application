import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/pages/admin/project-management/view/body.dart';
import 'package:flutter/material.dart';

class ProjectInfoUpdateForm extends StatefulWidget {
  const ProjectInfoUpdateForm({Key? key, required this.project})
      : super(key: key);
  final Project project;
  @override
  State<ProjectInfoUpdateForm> createState() =>
      _ProjectInfoUpdateFormState(project);
}

class _ProjectInfoUpdateFormState extends State<ProjectInfoUpdateForm> {
  late Project _project;
  _ProjectInfoUpdateFormState(Project project) {
    _project = project;
  }

  @override
  Widget build(BuildContext context) {
    const textfieldPadding = 25.0;
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Tên dự án',
                labelStyle: const TextStyle(
                  color: Color(BuiltinColor.blue_gradient_01),
                ),
                fillColor: Colors.black12,
                hintText: _project.name,
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(BuiltinColor.blue_gradient_01)
                          .withOpacity(0.7),
                      width: 0.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(BuiltinColor.blue_gradient_01), width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red.shade100, width: 0.5),
                ),
              ),
              initialValue: _project.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: textfieldPadding,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Thể loại',
                labelStyle: const TextStyle(
                  color: Color(BuiltinColor.blue_gradient_01),
                ),
                fillColor: Colors.black12,
                hintText: _project.category,
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(BuiltinColor.blue_gradient_01)
                          .withOpacity(0.7),
                      width: 0.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(BuiltinColor.blue_gradient_01), width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red.shade100, width: 0.5),
                ),
              ),
              initialValue: _project.category,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: textfieldPadding,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Ngôn ngữ',
                labelStyle: const TextStyle(
                  color: Color(BuiltinColor.blue_gradient_01),
                ),
                fillColor: Colors.black12,
                hintText: _project.preferredLanguage,
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(BuiltinColor.blue_gradient_01)
                          .withOpacity(0.7),
                      width: 0.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(BuiltinColor.blue_gradient_01), width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red.shade100, width: 0.5),
                ),
              ),
              initialValue: _project.preferredLanguage,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: textfieldPadding,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mô tả',
                labelStyle: const TextStyle(
                  color: Color(BuiltinColor.blue_gradient_01),
                ),
                fillColor: Colors.black12,
                hintText: _project.description,
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(BuiltinColor.blue_gradient_01)
                          .withOpacity(0.7),
                      width: 0.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(BuiltinColor.blue_gradient_01), width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red.shade100, width: 0.5),
                ),
              ),
              initialValue: _project.description,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: textfieldPadding,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Ngân sách',
                labelStyle: const TextStyle(
                  color: Color(BuiltinColor.blue_gradient_01),
                ),
                fillColor: Colors.black12,
                hintText: _project.budget.toString(),
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(BuiltinColor.blue_gradient_01)
                          .withOpacity(0.7),
                      width: 0.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(BuiltinColor.blue_gradient_01), width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red.shade100, width: 0.5),
                ),
              ),
              initialValue: _project.budget.toString(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: textfieldPadding),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Lần cập nhật cuối',
                labelStyle: const TextStyle(
                  color: Color(BuiltinColor.blue_gradient_01),
                ),
                fillColor: Colors.black12,
                hintText: _project.resolvedAt,
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(BuiltinColor.blue_gradient_01)
                          .withOpacity(0.7),
                      width: 0.5),
                ),
              ),
              initialValue: _project.resolvedAt,
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      border: Border.all(
                        color: const Color(BuiltinColor.blue_gradient_01),
                      ),
                    ),
                    child: SizedBox(
                      height: 40,
                      width: 100,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(BuiltinColor.blue_gradient_01),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      color: Color(BuiltinColor.blue_gradient_01),
                    ),
                    child: SizedBox(
                      height: 40,
                      width: 100,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
