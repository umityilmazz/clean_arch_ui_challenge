import '../../../../core/extensions/common_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/colors/app_colors.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/coomon/book_item_menu.dart';

class BookItemWidget extends StatelessWidget {
  const BookItemWidget({
    Key? key,
    required this.bookName,
    required this.authorName,
    required this.imagePath,
  }) : super(key: key);

  final String? bookName;
  final String? authorName;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return bookName != null && authorName != null && imagePath != null
        ? Container(
            margin: context.onlyRightPaddingNormal,
            padding: context.horizontalPaddingLow,
            width: context.highValue * 2.3,
            decoration: const BoxDecoration(
              color: AppColors.scafoldBackground,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookItemMenu(
                  bookItemWidget: Container(
                    height: context.highValue * 2.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imagePath!), fit: BoxFit.cover),
                        color: AppColors.cardBackground,
                        borderRadius: context.mediumBorderRadius,
                        border: Border.all(color: Colors.black, width: 2),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, offset: Offset(7, 7))
                        ]),
                  ),
                ),
                context.emptySizedHeightBoxNormal,
                Padding(
                  padding: context.onlyLeftPaddingLow,
                  child: Text(
                    bookName!,
                    overflow: TextOverflow.ellipsis,
                    style: TextConstants.instance.boldDarkMedium,
                  ),
                ),
                Padding(
                  padding: context.onlyLeftPaddingLow,
                  child: Text(
                    authorName!,
                    overflow: TextOverflow.ellipsis,
                    style: TextConstants.instance.lightBoldHeading,
                  ),
                )
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
