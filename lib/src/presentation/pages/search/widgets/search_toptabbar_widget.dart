import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/context_extension.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

import '../bloc/search_bloc.dart';

class SearchTopTabbarWidget extends StatelessWidget {
  final Function? onChanged;
  const SearchTopTabbarWidget({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchTypes currentSearchTypeItemSelected = context
        .select<SearchBloc, SearchTypes>((SearchBloc bloc) => bloc.currentSearchTypeItemSelected);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context
                      .read<SearchBloc>()
                      .add(const SearchTopTabbarItemSelectedEvent(searchTypes: SearchTypes.movie));

                  if (onChanged != null) onChanged!();
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
                  context
                      .read<SearchBloc>()
                      .add(const SearchTopTabbarItemSelectedEvent(searchTypes: SearchTypes.tvshow));

                  if (onChanged != null) onChanged!();
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
                  context
                      .read<SearchBloc>()
                      .add(const SearchTopTabbarItemSelectedEvent(searchTypes: SearchTypes.people));

                  if (onChanged != null) onChanged!();
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
    );
  }
}
