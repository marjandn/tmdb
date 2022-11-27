import 'package:flutter/cupertino.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

class PicturesListWidget extends StatelessWidget {
  final List<String> pictures;
  const PicturesListWidget({
    Key? key,
    required this.pictures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pictures.length,
        itemBuilder: (context, index) => PictureItemWidget(
          picture: pictures[index],
        ),
      ),
    );
  }
}

class PictureItemWidget extends StatelessWidget {
  final String picture;
  const PictureItemWidget({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: context.appTheme.shadowColor, blurRadius: 5, offset: const Offset(0, 4)),
          ],
          image: DecorationImage(
              image: NetworkImage(
                "${Constants.imageBasePath}$picture",
              ),
              fit: BoxFit.cover)),
    );
  }
}
