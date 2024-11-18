import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

import '../homePage/homepage.dart';

class DeletedContactsPage extends StatelessWidget {
  const DeletedContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delete Contacts",
        ),
        leading: IconButton(
          onPressed: () {
            Flexify.goRemove(
              HomePage(),
              animation: FlexifyRouteAnimations.blur,
              duration: Durations.medium1,
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
    );
  }
}
