import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/context_extension.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/pages/search/bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchTypes currentSearchTypeItemSelected = context
        .select<SearchBloc, SearchTypes>((SearchBloc bloc) => bloc.currentSearchTypeItemSelected);
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 60,
        ),
        TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              fillColor: Colors.grey[200],
              filled: true,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.grayColor,
              ),
              hintText: "Search...",
              hintStyle:
                  context.appTheme.textTheme.labelMedium?.copyWith(color: AppColors.grayColor)),
          cursorColor: context.appTheme.secondaryHeaderColor,
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<SearchBloc>().add(
                          const SearchTopTabbarItemSelectedEvent(searchTypes: SearchTypes.movie));
                    },
                    child: Text(
                      "Movie",
                      textAlign: TextAlign.center,
                      style: context.appTheme.textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<SearchBloc>().add(
                          const SearchTopTabbarItemSelectedEvent(searchTypes: SearchTypes.tvshow));
                    },
                    child: Text(
                      "Tv Show",
                      textAlign: TextAlign.center,
                      style: context.appTheme.textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<SearchBloc>().add(
                          const SearchTopTabbarItemSelectedEvent(searchTypes: SearchTypes.people));
                    },
                    child: Text(
                      "People",
                      textAlign: TextAlign.center,
                      style: context.appTheme.textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
              child: Stack(children: [
                AnimatedPositioned(
                  curve: Curves.easeInOutBack,
                  top: 10,
                  left: currentSearchTypeItemSelected == SearchTypes.movie
                      ? context.halfThirdWidthSize
                      : currentSearchTypeItemSelected == SearchTypes.tvshow
                          ? context.halfThirdWidthSize * 3
                          : context.halfThirdWidthSize * 5,
                  duration: const Duration(seconds: 1),
                  child: const Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 10,
                  ),
                ),
              ]),
            ),
          ],
        )
      ],
    ));
  }
}
