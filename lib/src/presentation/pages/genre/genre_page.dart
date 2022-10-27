import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/types/enums.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/bloc/genre_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/widgets/films_list_widget.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/widgets/genres_list_widget.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/widgets/genre_top_tabbar.component.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  /* 

      TODO: test bloc for fetching movies list
      TODO: Compelete Dashboard page

  */

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read<GenreBloc>()
        .add(const TopTabbarItemTappedEvent(genreParentItems: GenreParentItems.movie));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            TopTabbarWidget(),
            SizedBox(
              height: 24,
            ),
            SizedBox(height: 45, child: GenresListWidget()),
            Expanded(
              child: FilmsListWidget(),
            )
          ],
        ),
      ),
    );
  }
}
