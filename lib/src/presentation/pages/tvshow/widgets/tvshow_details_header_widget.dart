import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/pages/movie/bloc/movie_details_bloc.dart';

import '../bloc/tvshow_details_bloc.dart';

class TvshowDetailsHeaderWidget extends StatefulWidget {
  const TvshowDetailsHeaderWidget({
    super.key,
  });

  @override
  State<TvshowDetailsHeaderWidget> createState() => _TvshowDetailsHeaderWidgetState();
}

class _TvshowDetailsHeaderWidgetState extends State<TvshowDetailsHeaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // todo: Change this animation to implicit animations
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvshowDetailsBloc, TvshowDetailsState>(
      buildWhen: (previous, current) =>
          current is TvshowPrimaryDetailsLoadingState ||
          current is TvshowPrimaryDetailsFailedState ||
          current is TvshowPrimaryDetailsSuccessState,
      listener: (context, state) {
        if (state is TvshowPrimaryDetailsSuccessState) _animationController.forward();
      },
      builder: (context, state) {
        if (state is TvshowPrimaryDetailsLoadingState) return const CupertinoActivityIndicator();
        if (state is TvshowPrimaryDetailsSuccessState) {
          return SizedBox(
            width: double.infinity,
            height: 600,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60)),
                      image: DecorationImage(
                          image: NetworkImage(state.tvShow.psoterPath), fit: BoxFit.cover)),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: SlideTransition(
                      position: Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                          .animate(CurvedAnimation(
                              parent: _animationController, curve: Curves.bounceOut)),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 40),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: context.appTheme.shadowColor,
                                  blurRadius: 5,
                                  offset: const Offset(0, 4)),
                            ],
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)),
                            color: context.appTheme.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            VoteItemWidget(voteavg: state.tvShow.voteAvg.toString()),
                            VoteCountWidget(voteCount: state.tvShow.voteCount.toString()),
                            StateWidget(state: state.tvShow.status),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    left: 24,
                    top: 40,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                    )),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class StateWidget extends StatelessWidget {
  final String state;
  const StateWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/ic_films.png",
          width: 24,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(state, style: context.appTheme.textTheme.labelLarge),
      ],
    );
  }
}

class VoteCountWidget extends StatelessWidget {
  final String voteCount;
  const VoteCountWidget({
    Key? key,
    required this.voteCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/ic_fire.png",
          width: 24,
        ),
        const SizedBox(
          height: 4,
        ),
        Text("$voteCount+", style: context.appTheme.textTheme.labelLarge),
      ],
    );
  }
}

class VoteItemWidget extends StatelessWidget {
  final String voteavg;
  const VoteItemWidget({
    Key? key,
    required this.voteavg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/ic_star.png",
          width: 24,
        ),
        const SizedBox(
          height: 4,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(text: voteavg, style: context.appTheme.textTheme.labelLarge),
          TextSpan(text: "/10", style: context.appTheme.textTheme.labelMedium),
        ])),
      ],
    );
  }
}
