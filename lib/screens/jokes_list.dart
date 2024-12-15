import 'package:flutter/material.dart';

import '../models/Joke.dart';
import '../services/api_services.dart';

class JokesListScreen extends StatelessWidget {
  final String type;

  JokesListScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiServices.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.deepPurple[200],
                  child: ListTile(
                    title: Text(snapshot.data![index].setup),
                    subtitle: Text(snapshot.data![index].line),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}