import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/domain/entities/movie_credits.dart';
import 'package:tmdb_prj/src/presentation/pages/movie/bloc/movie_details_bloc.dart';

class CreditsListWidget extends StatelessWidget {
  final List<MovieCredits> credits;
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
  final MovieCredits credit;
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
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: context.appTheme.shadowColor,
                      blurRadius: 5,
                      offset: const Offset(0, 4)),
                ],
                image: DecorationImage(image: NetworkImage(credit.profilePath), fit: BoxFit.cover)),
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
