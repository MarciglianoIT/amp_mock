import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as stacked;

import '../app_theme.dart';
import './start_page_viewmodel.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return stacked.ViewModelBuilder<StartPageViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          key: model.key,
          appBar: AppTopBar(model, model.lottery, model.fields),
          body: Text("Hello Ampersand"),
        );
      },
      viewModelBuilder: () => StartPageViewModel(),
      onModelReady: (model) => model.initialize(),
      fireOnModelReadyOnce: false,
    );
  }
}
