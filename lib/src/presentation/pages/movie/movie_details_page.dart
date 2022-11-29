import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';
import 'package:tmdb_prj/src/presentation/components/shared_components/pictures_list_widget.dart';

import '../../components/shared_components/company_list_widget.dart';
import '../../components/shared_components/credits_list_widget.dart';
import '../../components/shared_components/tags_list_widget.dart';
import 'bloc/movie_details_bloc.dart';
import 'widgets/movie_details_header_widget.dart';
import 'widgets/movie_primary_details_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsBloc>().add(MoviePrimaryDetailsRequestEvent(widget.movieId));
    context.read<MovieDetailsBloc>().add(MoviePicturesRequestEvent(widget.movieId));
    context.read<MovieDetailsBloc>().add(MovieCreditsRequestEvent(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const MovieDetailsHeaderWidget(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              buildWhen: (previous, current) =>
                  current is MoviePrimaryDetailsFailedState ||
                  current is MoviePrimaryDetailsLoadingState ||
                  current is MoviePrimaryDetailsSuccessState,
              builder: (context, state) {
                if (state is MoviePrimaryDetailsFailedState) {
                  return const CupertinoActivityIndicator();
                }
                if (state is MoviePrimaryDetailsSuccessState) {
                  return MoviePrimaryDetailsPartWidget(movieDetails: state.movieDetails);
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                buildWhen: (previous, current) =>
                    current is MoviePicturesLoadingState ||
                    current is MoviePicturesFailedState ||
                    current is MoviePicturesSuccessState,
                builder: (context, state) {
                  if (state is MoviePicturesLoadingState) return const CupertinoActivityIndicator();
                  if (state is MoviePicturesSuccessState) {
                    return PicturesListWidget(pictures: state.pictures);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Cast & Crew",
                  style: context.appTheme.textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                buildWhen: (previous, current) =>
                    current is MovieCreditsLoadingState ||
                    current is MovieCreditsFailedState ||
                    current is MovieCreditsSuccessState,
                builder: (context, state) {
                  if (state is MovieCreditsLoadingState) return const CupertinoActivityIndicator();
                  if (state is MovieCreditsSuccessState) {
                    return CreditsListWidget(credits: state.credits);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Companies",
                  style: context.appTheme.textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                buildWhen: (previous, current) =>
                    current is MoviePrimaryDetailsFailedState ||
                    current is MoviePrimaryDetailsLoadingState ||
                    current is MoviePrimaryDetailsSuccessState,
                builder: (context, state) {
                  if (state is MoviePrimaryDetailsLoadingState) {
                    return const CupertinoActivityIndicator();
                  }
                  if (state is MoviePrimaryDetailsSuccessState) {
                    return CompanyListWidget(companies: state.movieDetails.productionCompanies);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
