import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/components/shared_components/pictures_list_widget.dart';

import '../../components/shared_components/company_list_widget.dart';
import '../../components/shared_components/credits_list_widget.dart';
import 'bloc/tvshow_details_bloc.dart';
import 'widgets/tvshow_details_header_widget.dart';
import 'widgets/tvshow_primary_details_widget.dart';

// todo: Implement Sessions List according to UI

class TvshowDetailsPage extends StatefulWidget {
  final int tvshowId;
  const TvshowDetailsPage({super.key, required this.tvshowId});

  @override
  State<TvshowDetailsPage> createState() => _TvshowDetailsPageState();
}

class _TvshowDetailsPageState extends State<TvshowDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TvshowDetailsBloc>().add(TvshowPrimaryDetailsRequestEvent(widget.tvshowId));
    context.read<TvshowDetailsBloc>().add(TvshowPicturesRequestEvent(widget.tvshowId));
    context.read<TvshowDetailsBloc>().add(TvshowCreditsRequestEvent(widget.tvshowId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const TvshowDetailsHeaderWidget(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<TvshowDetailsBloc, TvshowDetailsState>(
              buildWhen: (previous, current) =>
                  current is TvshowPrimaryDetailsFailedState ||
                  current is TvshowPrimaryDetailsLoadingState ||
                  current is TvshowPrimaryDetailsSuccessState,
              builder: (context, state) {
                if (state is TvshowPrimaryDetailsFailedState) {
                  return const CupertinoActivityIndicator();
                }
                if (state is TvshowPrimaryDetailsSuccessState) {
                  return TvshowPrimaryDetailsPartWidget(tvshowDetails: state.tvShow);
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
              BlocBuilder<TvshowDetailsBloc, TvshowDetailsState>(
                buildWhen: (previous, current) =>
                    current is TvshowPicturesLoadingState ||
                    current is TvshowPicturesFailedState ||
                    current is TvshowPicturesSuccessState,
                builder: (context, state) {
                  if (state is TvshowPicturesLoadingState) {
                    return const CupertinoActivityIndicator();
                  }
                  if (state is TvshowPicturesSuccessState) {
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
              BlocBuilder<TvshowDetailsBloc, TvshowDetailsState>(
                buildWhen: (previous, current) =>
                    current is TvshowCreditsLoadingState ||
                    current is TvshowCreditsFailedState ||
                    current is TvshowCreditsSuccessState,
                builder: (context, state) {
                  if (state is TvshowCreditsLoadingState) return const CupertinoActivityIndicator();
                  if (state is TvshowCreditsSuccessState) {
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
              BlocBuilder<TvshowDetailsBloc, TvshowDetailsState>(
                buildWhen: (previous, current) =>
                    current is TvshowPrimaryDetailsFailedState ||
                    current is TvshowPrimaryDetailsLoadingState ||
                    current is TvshowPrimaryDetailsSuccessState,
                builder: (context, state) {
                  if (state is TvshowPrimaryDetailsLoadingState) {
                    return const CupertinoActivityIndicator();
                  }
                  if (state is TvshowPrimaryDetailsSuccessState) {
                    return CompanyListWidget(companies: state.tvShow.productionCompanies);
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
