import 'package:flutter/cupertino.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/presentation/pages/people_list/widgets/people_item_widget.dart';

class PeopleSearchResultListWidget extends StatelessWidget {
  const PeopleSearchResultListWidget({
    Key? key,
    required ScrollController scrollController,
    required this.showLazyLoading,
    required this.allPeople,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final bool showLazyLoading;
  final List<People> allPeople;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: _scrollController,
      itemCount: showLazyLoading ? allPeople.length + 1 : allPeople.length,
      itemBuilder: (context, index) => (index < allPeople.length)
          ? PeopleItemWidget(
              people: allPeople[index],
            )
          : showLazyLoading
              ? const CupertinoActivityIndicator()
              : const SizedBox(),
    );
  }
}
