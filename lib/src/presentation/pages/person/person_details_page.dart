import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/components/shared_components/pictures_list_widget.dart';

import 'bloc/person_details_bloc.dart';
import 'widgets/person_details_header_widget.dart';
import 'widgets/person_primary_details_widget.dart';

class PersonDetailsPage extends StatefulWidget {
  final int personId;
  const PersonDetailsPage({super.key, required this.personId});

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PersonDetailsBloc>().add(PersonPrimaryDetailsRequestEvent(widget.personId));
    context.read<PersonDetailsBloc>().add(PersonPicturesRequestEvent(widget.personId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PersonDetailsHeaderWidget(),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<PersonDetailsBloc, PersonDetailsState>(
                buildWhen: (previous, current) =>
                    current is PersonPrimaryDetailsFailedState ||
                    current is PersonPrimaryDetailsLoadingState ||
                    current is PersonPrimaryDetailsSuccessState,
                builder: (context, state) {
                  if (state is PersonPrimaryDetailsFailedState) {
                    return const CupertinoActivityIndicator();
                  }
                  if (state is PersonPrimaryDetailsSuccessState) {
                    return PersonPrimaryDetailsPartWidget(personDetails: state.personDetails);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Pictures",
                style: context.appTheme.textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<PersonDetailsBloc, PersonDetailsState>(
              buildWhen: (previous, current) =>
                  current is PersonPicturesLoadingState ||
                  current is PersonPicturesFailedState ||
                  current is PersonPicturesSuccessState,
              builder: (context, state) {
                if (state is PersonPicturesLoadingState) return const CupertinoActivityIndicator();
                if (state is PersonPicturesSuccessState) {
                  return PicturesListWidget(pictures: state.pictures);
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
