import 'package:flutter/material.dart';
import 'package:recipes/dummy_data.dart';
import 'package:recipes/recipe_detail.dart';

import 'recipe.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  final theme = ThemeData.light();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.amber, secondary: Colors.deepPurple)),
      home: HomePage(title: 'Recipe Counter'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: // 4
            ListView.builder(
          // 5
          itemCount: DummyData.samples.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            // 7
            // TODO: Update to return Recipe card
            final recipe = DummyData.samples[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReceipeDetail(recipe: recipe)));
              },
              child: _buildRecipeItem(recipe),
            );
          },
        ),
        // child: Column(r
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     for (var item in DummyData.samples) Text(item.label),
        //     if (false) Text("Nurullah")
        //   ],
        // ),
      ),
    );
  }

  _buildRecipeItem(Recipe recipe) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(recipe.imageUrl),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    recipe.label,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Palatino',
                    ),
                  ),
                ],
              ),
            )),
      );
}
