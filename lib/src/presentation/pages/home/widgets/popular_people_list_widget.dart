import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

import '../bloc/home_bloc.dart';

class PopularPeopleListWidget extends StatelessWidget {
  const PopularPeopleListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is PopularPeopleFetchFailedState ||
          current is PopularPeopleFetchLoadingState ||
          current is PopularPeopleFetchSuccessState,
      builder: (context, state) {
        if (state is PopularPeopleFetchSuccessState) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: state.people.length,
            itemBuilder: (context, index) => SizedBox(
              width: 160,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: context.appTheme.shadowColor,
                                blurRadius: 5,
                                offset: const Offset(0, 4)),
                            BoxShadow(
                                color: context.appTheme.shadowColor,
                                blurRadius: 5,
                                offset: const Offset(0, -1)),
                          ],
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${Constants.imageBasePath}${state.people[index].profilePath}"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        state.people[index].name ?? "",
                        textAlign: TextAlign.center,
                        style: context.appTheme.textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const CupertinoActivityIndicator();
      },
    );
  }
}
