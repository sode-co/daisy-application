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

    return SizedBox(
      width: size.width * 0.5,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey, style: BorderStyle.solid)),
          child: Column(
            children: [
              const Text('Post new job'),
              const Divider(color: Colors.grey),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Give a name for your job'),
                  TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Daisy...',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        model.title = value;
                      }),
                ],
              )
            ],
          )),
    );
  }
}
