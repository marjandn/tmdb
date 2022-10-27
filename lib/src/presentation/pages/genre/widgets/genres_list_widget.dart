import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/app/types/enums.dart';
import 'package:tmdb_prj/src/domain/entities/genre.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/bloc/genre_bloc.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreBloc, GenreState>(
      buildWhen: (previous, current) =>
          current is GenresListFetchLoadingState ||
          current is GenresListFetchFailedState ||
          current is GenresListFetchSuccessState,
      builder: (context, state) {
        print("GenresList builder: $state");
        if (state is GenresListFetchSuccessState) {
          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.genres.length,
              itemBuilder: (context, index) {
                return GenreListItemWidget(genre: state.genres[index]);
              });
        }
        return const CupertinoActivityIndicator();
      },
    );
  }
}

class GenreListItemWidget extends StatelessWidget {
  final Genre genre;
  const GenreListItemWidget({
    required this.genre,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Genre? bSelectedGenre =
        context.select<GenreBloc, Genre?>((GenreBloc bloc) => bloc.selectedGenre);
    return GestureDetector(
      onTap: () => context.read<GenreBloc>().add(GenreItemTappedEvent(genre: genre)),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bSelectedGenre == genre
              ? context.appTheme.secondaryHeaderColor
              : context.appTheme.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(80)),
          border: bSelectedGenre != genre
              ? Border.all(color: context.appTheme.dividerColor, width: 1)
              : null,
        ),
        child: Text(
          genre.name ?? "-",
          style: context.appTheme.textTheme.titleMedium?.copyWith(
              color: bSelectedGenre == genre
                  ? context.appTheme.primaryColor
                  : context.appTheme.secondaryHeaderColor),
        ),
      ),
    );
  }
}
