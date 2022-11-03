import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/presentation/pages/search/bloc/search_bloc.dart';

import 'widgets/movies_search_result_list_widget.dart';
import 'widgets/people_search_result.dart';
import 'widgets/search_toptabbar_widget.dart';
import 'widgets/tvshow_search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

////- todo: implement search for three types of Movie , Tv Show, People
// todo: implement Custom Image Slider for home page
// todo: implement details page for Movie
// todo: implement details page for Tvshow
// todo: implement details page for People

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        _loadMoreData();
      }
    });
  }

  _loadMoreData() {
    switch (context.read<SearchBloc>().currentSearchTypeItemSelected) {
      case SearchTypes.movie:
        _laodMoreMovies();
        break;
      case SearchTypes.tvshow:
        _loadMoreTvshows();
        break;
      default:
        _loadMorePeople();
        break;
    }
  }

  _laodMoreMovies() {
    context
        .read<SearchBloc>()
        .add(MovieSeachRequestedEvent(query: _searchTextController.text.toString().trim()));
  }

  _loadMoreTvshows() {
    context
        .read<SearchBloc>()
        .add(TvShowSeachRequestedEvent(query: _searchTextController.text.toString().trim()));
  }

  _loadMorePeople() {
    context
        .read<SearchBloc>()
        .add(PeopleSeachRequestedEvent(query: _searchTextController.text.toString().trim()));
  }

  @override
  void didChangeDependencies() {
    context.read<SearchBloc>().dispose();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    EasyDebounce.cancelAll();
    super.dispose();
  }

  final List<Movie> allMovies = [];
  final List<TvShow> allTvshows = [];
  final List<People> allPeople = [];

  _resetLocalLists() {
    allMovies.clear();
    allTvshows.clear();
    allPeople.clear();
    _searchTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: _searchTextController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                fillColor: Colors.grey[200],
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.grayColor,
                ),
                hintText: "Search...",
                hintStyle:
                    context.appTheme.textTheme.labelMedium?.copyWith(color: AppColors.grayColor)),
            cursorColor: context.appTheme.secondaryHeaderColor,
            onChanged: (value) => EasyDebounce.debounce(
                'search_input_debounce', const Duration(milliseconds: 1000), () {
              if (_searchTextController.text.length > 2) _loadMoreData();
            }),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SearchTopTabbarWidget(
          onChanged: () {
            _resetLocalLists();
          },
        ),
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is MoviesFetchSuccessState) {
              allMovies.addAll(state.movies);
              return MoviesSearchResultListWidget(
                  scrollController: _scrollController,
                  showLazyLoading: state.showLazyLoading,
                  allMovies: allMovies);
            } else if (state is TvshowsFetchSuccessState) {
              allTvshows.addAll(state.tvshows);
              return TvshowsSearchResultListWidget(
                  scrollController: _scrollController,
                  showLazyLoading: state.showLazyLoading,
                  allTvShows: allTvshows);
            } else if (state is PeopleFetchSuccessState) {
              allPeople.addAll(state.people);
              return PeopleSearchResultListWidget(
                  scrollController: _scrollController,
                  showLazyLoading: state.showLazyLoading,
                  allPeople: allPeople);
            } else if (state is CenterLoadingStateState) {
              return const CupertinoActivityIndicator();
            }

            return const SizedBox();
          },
        ))
      ],
    ));
  }
}
