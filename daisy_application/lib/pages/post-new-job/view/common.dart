import 'package:daisy_application/pages/post-new-job/model/post_new_job_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateJobForm extends StatefulWidget {
  const CreateJobForm({Key? key}) : super(key: key);

  @override
  State<CreateJobForm> createState() => _CreateJobFormState();
}

class _CreateJobFormState extends State<CreateJobForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var model = context.watch<PostNewJobState>();
    final _createJobForm = GlobalKey<FormState>();
    TextEditingController jobNameController = TextEditingController();

    return SizedBox(
      width: size.width * 0.5,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.0),
              border: Border.all(color: Colors.grey, style: BorderStyle.solid)),
          child: Column(
            children: [
              const Text('Post new job'),
              const Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _createJobForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Give a name for your job'),
                      TextFormField(
                        controller: jobNameController,
                        decoration: InputDecoration(
                          hintText: 'Daisy...',
                          focusedBorder: renderFocusedBorder(),
                          enabledBorder: renderEnabledBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          model.title = value;
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            model.title = jobNameController.text;
                            if (_createJobForm.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(model.title),
                                ),
                              );
                            }
                          },
                          child: const Text('Submit'))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  OutlineInputBorder renderEnabledBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    );
  }

  OutlineInputBorder renderFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(1.0),
      borderSide: const BorderSide(color: Colors.lightBlue, width: 1.0),
    );
  }
}

class MobileCreateJobBtn extends StatelessWidget {
  const MobileCreateJobBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Color(0xff262626),
      backgroundColor: Colors.white,
      tooltip: 'Find your new talent',
      onPressed: () {
        Navigator.pushNamed(context, '/postnewjob');
      },
      child: const Icon(Icons.add, size: 28),
    );
  }
}
