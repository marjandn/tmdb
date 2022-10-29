import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/presentation/components/shared_widgets.dart';

import 'bloc/people_list_bloc.dart';
import 'widgets/people_item_widget.dart';

class PeopleListPage extends StatefulWidget {
  final String title;
  const PeopleListPage({super.key, required this.title});

  @override
  State<PeopleListPage> createState() => _PeopleListPageState();
}

class _PeopleListPageState extends State<PeopleListPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  int _totalPage = 1;
  List<People> allPeople = [];
  int _currentPage = 0;

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

  _loadMore() {
    if (_currentPage < _totalPage) {
      _isLoading = true;
      context.read<PeopleListBloc>().add(PopularPeopleListRequestedEvent(page: ++_currentPage));
    } else {
      _isLoading = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
              _totalPage = state.people.first.totalPages ?? 1;
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 32),
                itemCount: _isLoading ? allPeople.length + 1 : allPeople.length,
                itemBuilder: (context, index) => (index < allPeople.length)
                    ? PeopleItemWidget(people: allPeople[index])
                    : (_isLoading)
                        ? const CupertinoActivityIndicator()
                        : const SizedBox(),
              );
            }
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
