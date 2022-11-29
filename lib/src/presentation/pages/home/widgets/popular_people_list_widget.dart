import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/styles.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/presentation/pages/person/bloc/person_details_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/person/person_details_page.dart';

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
            itemBuilder: (context, index) => PersonItemWidget(person: state.people[index]),
          );
        }
        return const CupertinoActivityIndicator();
      },
    );
  }
}

class PersonItemWidget extends StatelessWidget {
  final People person;
  const PersonItemWidget({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => injector<PersonDetailsBloc>(),
            child: PersonDetailsPage(
              personId: person.id,
            ),
          ),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  width: 170,
                  decoration: AppStyles(context).imageOvalContainerDecoration,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: person.profilePath,
                      placeholder: (context, url) =>
                          Image.asset("assets/images/film_placeholder.png", fit: BoxFit.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  person.name ?? "",
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
}
