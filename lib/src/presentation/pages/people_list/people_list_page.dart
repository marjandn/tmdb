import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/presentation/components/shared_widgets.dart';

import 'bloc/people_list_bloc.dart';
import 'widgets/people_item_widget.dart';
import 'widgets/people_list_widget.dart';

class PeopleListPage extends StatefulWidget {
  final String title;
  const PeopleListPage({super.key, required this.title});

  @override
  State<PeopleListPage> createState() => _PeopleListPageState();
}

class _PeopleListPageState extends State<PeopleListPage> {
  final ScrollController _scrollController = ScrollController();

  List<People> allPeople = [];
  @override
  void initState() {
    super.initState();
    _loadMore();

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        _loadMore();
      }
    });
  }

  _loadMore() => context.read<PeopleListBloc>().add(const PopularPeopleListRequestedEvent());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    context.read<PeopleListBloc>().dispose();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context: context, title: widget.title),
      body: Center(
        child: BlocBuilder<PeopleListBloc, PeopleListState>(
          buildWhen: (previous, current) =>
              current is PeopleFetchRequestFailedState || current is PeopleFetchRequestSuccessState,
          builder: (context, state) {
            if (state is PeopleFetchRequestSuccessState) {
              allPeople.addAll(state.people);
              return PeopleListWidget(
                  scrollController: _scrollController,
                  isLoading: state.showLazyLoading,
                  allPeople: allPeople);
            }
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}

 