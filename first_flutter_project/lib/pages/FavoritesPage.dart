import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FavoritesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final tema = Theme.of(context);
    final estilo = tema.textTheme.displayMedium!.copyWith(
      color: Colors.white,
      fontSize: 20,
    );

    if(appState.favorites.isEmpty){
      return Center(
        child: Text(
          'No favorites yet...',
          style: estilo,
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'You have ${appState.favorites.length} favorites:',
            style: estilo.copyWith(fontSize: 25,),
          ),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: IconButton(
              icon : Icon(Icons.delete_outline_outlined, color: Colors.redAccent,),
              onPressed: (){
                appState.removeFavorite(pair);
              },
            ),
            title: Text(
              pair.asLowerCase,
              style: estilo,
            ),
          ),
      ],
    );
  }
}