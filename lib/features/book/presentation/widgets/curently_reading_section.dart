import '../blocs/article/remote/bloc/remote_book_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/coomon/animation_try.dart';
import '../../../../core/extensions/common_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/theme/colors/app_colors.dart';
import '../../../../core/constants/text_constants.dart';

class CurentlyReadingSection extends StatelessWidget {
  const CurentlyReadingSection({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state=context.watch<RemoteBookBloc>().state;
    if(state is RemoteBookLoaded || state is RemoteBookLoadedNewest || state is RemoteBookLoadedPopular){
      final bookItem=state.curentlyReadingBook;
        return bookItem != null
        ? _imageBox(context,
            imgPath: bookItem.volumeInfo?.imageLinks?.smallThumbnail)
        : _errorBox(context);
    }else{
      return _imageBox(context);
    }
  
  }

SliverToBoxAdapter _imageBox(BuildContext context, {String? imgPath}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.highValue * 2.7,
        child: Stack(
          children: [
            Positioned(
                right: 0,
                left: 0,
                bottom: 5,
                child: _bookAndAuthorName(context)),
            Positioned(
                right: 40,
                child: QuickRotateBox(
                  rotationChild: Container(
                    height: 185,
                    width: 140,
                    decoration: BoxDecoration(
                      image: imgPath != null
                          ? DecorationImage(
                              image: NetworkImage(imgPath), fit: BoxFit.cover)
                          : null,
                      color: AppColors.cardBackground,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: context.mediumBorderRadius,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

SliverToBoxAdapter _errorBox(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
          height: context.highValue * 2.7,
          child: const Center(
            child: Text("ERROR"),
          )),
    );
  }
}

Container _bookAndAuthorName(BuildContext context) {
  return Container(
    padding: context.paddingNormal,
    margin: context.paddingLow * 3,
    height: context.highValue * 2,
    decoration: BoxDecoration(
        borderRadius: context.mediumBorderRadius,
        border: Border.all(color: Colors.black, width: 2),
        gradient: const LinearGradient(colors: [
          Colors.white,
          AppColors.cardBackground,
        ]),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(4, 5))
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Curently Reading",
          style: TextStyle(
              letterSpacing: 1,
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        context.emptySizedHeightBoxLow,
        SizedBox(
          width: 100,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "To Kill a Mockingbird",
                  overflow: TextOverflow.ellipsis,
                  style: TextConstants.instance.boldDarkHeading
                      .copyWith(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
        context.emptySizedHeightBoxLow,
        const Text(
          "Harper Lee",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        context.emptySizedHeightBoxNormal,
        Container(
          height: context.lowValue,
          width: context.width * 0.45,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                width: context.width * 0.3,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
