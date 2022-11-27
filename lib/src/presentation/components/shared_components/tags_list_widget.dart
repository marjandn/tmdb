import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

class TagsListWidget extends StatelessWidget {
  final List<String> tags;
  const TagsListWidget({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: tags
            .map(
              (e) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: context.appTheme.primaryColorLight),
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                ),
                child: Text(
                  e,
                  style: context.appTheme.textTheme.labelLarge,
                ),
              ),
            )
            .toList());
  }
}
