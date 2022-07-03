import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/discovery-designer/deps/contact_and_project_listener.dart';
import 'package:daisy_application/app/pages/discovery-designer/model/contact_and_project_state.dart';
import 'package:flutter/material.dart';

class ContactAndProjectFlowController extends AutoRouter {
  const ContactAndProjectFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _ContactAndProjectFlowControllerState();
}

class _ContactAndProjectFlowControllerState extends AutoRouterState
    implements ContactAndProjectListener<AutoRouter> {
  ContactAndProjectState? contactAndProjectState;
  @override
  void initState() {
    contactAndProjectState = ContactAndProjectState();
    super.initState();
  }

  @override
  void dispose() {
    contactAndProjectState = null;
    super.dispose();
  }
}
