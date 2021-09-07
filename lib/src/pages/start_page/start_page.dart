import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as stacked;

import 'start_page_viewmodel.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return stacked.ViewModelBuilder<StartPageViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          key: model.key,
          appBar: AppBar(
            title: Text("Ampersand"),
          ),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    model.startSwap(context);
                  },
                  child: Text("Start Battery Swap"),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => StartPageViewModel(),
      fireOnModelReadyOnce: false,
    );
  }
}
