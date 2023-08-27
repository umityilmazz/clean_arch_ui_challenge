import '../blocs/article/remote/bloc/remote_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/colors/app_colors.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/extensions/common_extensions.dart';

class BookListCard extends StatelessWidget {
  const BookListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = context
        .watch<RemoteBookBloc>()
        .state
        .curentlyReadingBook
        ?.volumeInfo
        ?.imageLinks
        ?.smallThumbnail;
    return SliverToBoxAdapter(
      child: Container(
        margin: context.paddingMedium,
        height: context.highValue * 2.3,
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: context.mediumBorderRadius),
        child: Row(
          children: [
            Container(
              margin: context.paddingLow,
              width: context.highValue * 1.7,
              decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  image: imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover)
                      : null),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // cards
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: context.lowValue,
                      children: [
                        _buildSmallCategoryCard(context, "Classic"),
                        _buildSmallCategoryCard(context, "Popular"),
                      ],
                    ),
                    Text(
                      "Tales Of Surspunse",
                      overflow: TextOverflow.ellipsis,
                      style: TextConstants.instance.boldDarkSmall,
                    ),
                    Text(
                      "4 Authors",
                      overflow: TextOverflow.ellipsis,
                      style: TextConstants.instance.lightBoldHeading,
                    ),
                  ],
                ),
                Text.rich(TextSpan(
                    text: "13",
                    style: TextConstants.instance.boldDarkHeading,
                    children: [
                      TextSpan(
                          text: " Books",
                          style: TextConstants.instance.boldDarkSmall
                              .copyWith(fontSize: 16))
                    ])),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSmallCategoryCard(BuildContext context, String categoryName) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.cardBackground,
            alignment: Alignment.center,
            padding: context.horizontalPaddingLow,
            maximumSize: const Size(60, 20),
            minimumSize: const Size(40, 20),
            side: const BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
                borderRadius: context.mediumBorderRadius)),
        onPressed: () {},
        child: Text(
          categoryName,
          style: const TextStyle(
              fontSize: 11, color: Colors.black, fontWeight: FontWeight.bold),
        ));
  }
}
