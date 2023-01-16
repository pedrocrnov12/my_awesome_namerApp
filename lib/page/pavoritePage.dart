import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Statemanager/my_app_state.dart';

class Favorites_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text('You have '
            '${appState.favorites.length} favorites:'),
      ),
      for (var pair in appState.favorites)
        ListTile(
          leading: IconButton(
            icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
            onPressed: () {
              appState.removeFavorite(pair);
            },
          ),
        ),
    ]);
  }
}
