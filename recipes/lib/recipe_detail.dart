import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

class ReceipeDetail extends StatefulWidget {
  final Recipe recipe;

  const ReceipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _ReceipeDetailState createState() => _ReceipeDetailState();
}

class _ReceipeDetailState extends State<ReceipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 4
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            // TODO: Add Expanded

            // TODO: Add Slider() here
          ],
        ),
      ),
    );
  }
}
