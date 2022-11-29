import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/presentation/components/shared_components/tags_list_widget.dart';

class PersonPrimaryDetailsPartWidget extends StatelessWidget {
  final People personDetails;
  const PersonPrimaryDetailsPartWidget({Key? key, required this.personDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Biography",
          style: context.appTheme.textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Born in ${personDetails.placeOfBirth}",
          style: context.appTheme.textTheme.labelMedium,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          personDetails.biography ?? "",
          style: context.appTheme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
