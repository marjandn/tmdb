import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/styles.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/domain/entities/credits.dart';
import 'package:tmdb_prj/src/presentation/pages/movie/bloc/movie_details_bloc.dart';

class CreditsListWidget extends StatelessWidget {
  final List<Credits> credits;
  const CreditsListWidget({
    Key? key,
    required this.credits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: credits.length,
          itemBuilder: (context, index) => CreditItemWidget(
            credit: credits[index],
          ),
        ));
  }
}

class CreditItemWidget extends StatelessWidget {
  final Credits credit;
  const CreditItemWidget({
    Key? key,
    required this.credit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            width: 150,
            decoration: AppStyles(context).imageOvalContainerDecoration,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: credit.profilePath,
                placeholder: (context, url) =>
                    Image.asset("assets/images/film_placeholder.png", fit: BoxFit.cover),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            credit.name,
            style: context.appTheme.textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          credit.knownFor,
          style: context.appTheme.textTheme.bodySmall,
        ),
      ]),
    );
  }
}
