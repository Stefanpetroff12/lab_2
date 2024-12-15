import 'package:flutter/material.dart';

import '../models/JokeType.dart';
import '../services/api_services.dart';
import 'jokes_list.dart';
import 'random_joke.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('213288'),
        actions: [
          IconButton(
            icon: Icon(Icons.shuffle_on_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomJokeScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<JokeType>>(
        future: ApiServices.getJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3/2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JokesListScreen(type: snapshot.data![index].type),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.deepPurple[200],
                    child: Center(
                      child: Text(
                        snapshot.data![index].type,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
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