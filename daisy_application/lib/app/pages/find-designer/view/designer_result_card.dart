import 'package:daisy_application/app/pages/find-designer/view/find_designer.dart';
import 'package:flutter/material.dart';

extension DesignerInfoCard on FindDesignerPageState {
  @override
  Widget createDesignerCard() {
    return Center(
      child: Card(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                width: 500,
                child: Row(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
