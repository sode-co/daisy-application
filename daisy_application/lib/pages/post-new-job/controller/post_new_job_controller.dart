import 'package:daisy_application/pages/post-new-job/listener/post_new_job_listener.dart';
import 'package:daisy_application/pages/post-new-job/model/post_new_job_state.dart';

class PostNewJobController implements PostNewJobListener {
  // ignore: unused_field
  final PostNewJobState _postNewJobState;

  PostNewJobController(this._postNewJobState);
}
