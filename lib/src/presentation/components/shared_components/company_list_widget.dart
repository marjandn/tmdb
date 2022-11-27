import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

import '../../../domain/entities/movie_details.dart';

class CompanyListWidget extends StatelessWidget {
  final List<ProductionCompany> companies;
  const CompanyListWidget({
    Key? key,
    required this.companies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: companies.length,
        itemBuilder: (context, index) => CompanyItemWidget(comapany: companies[index]),
      ),
    );
  }
}

class CompanyItemWidget extends StatelessWidget {
  final ProductionCompany comapany;
  const CompanyItemWidget({
    Key? key,
    required this.comapany,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            width: 300,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(comapany.logoPath), fit: BoxFit.contain)),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            comapany.name,
            style: context.appTheme.textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
