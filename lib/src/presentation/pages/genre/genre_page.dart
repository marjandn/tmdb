import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/context_extension.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  final bool isMovieSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          isMovieSelected = true;
                        }),
                        child: Text(
                          "Movie",
                          textAlign: TextAlign.center,
                          style: context.appTheme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          isMovieSelected = false;
                        }),
                        child: Text(
                          "Tv Show",
                          textAlign: TextAlign.center,
                          style: context.appTheme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ],
                ), */
                SizedBox(
                  height: 30,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        curve: Curves.easeInOutBack,
                        top: 10,
                        left: isMovieSelected
                            ? context.quarterWidthSize
                            : context.halfWidthSize + context.quarterWidthSize,
                        duration: const Duration(seconds: 1),
                        child: const Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 10,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
