import 'package:flutter/cupertino.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';

import 'people_item_widget.dart';

class PeopleListWidget extends StatelessWidget {
  const PeopleListWidget({
    Key? key,
    required ScrollController scrollController,
    required bool isLoading,
    required this.allPeople,
  })  : _scrollController = scrollController,
        _isLoading = isLoading,
        super(key: key);

  final ScrollController _scrollController;
  final bool _isLoading;
  final List<People> allPeople;

  @override
  Widget build(BuildContext context) {
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
}
