import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

class ReceipeDetail extends StatefulWidget {
  final Recipe recipe;

  const ReceipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _ReceipeDetailState createState() => _ReceipeDetailState();
}

class _ReceipeDetailState extends State<ReceipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        // 3
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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

            // 7
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // 9
                  // TODO: Add ingredient.quantity

                  return Text(
                      '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}');
                },
              ),
            ),

            Slider(
              // 10
              min: 1,
              max: 10,
              divisions: 10,
              // 11
              label: '${_sliderVal * widget.recipe.servings} servings',
              // 12
              value: _sliderVal.toDouble(),
              // 13
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              // 14
              activeColor: Colors.amber,
              inactiveColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
