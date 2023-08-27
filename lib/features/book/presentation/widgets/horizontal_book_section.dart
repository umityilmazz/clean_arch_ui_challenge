// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architechture_temp/core/constants/asset_constants.dart';
import 'package:clean_architechture_temp/core/extensions/common_extensions.dart';
import 'package:clean_architechture_temp/features/book/presentation/blocs/article/remote/bloc/remote_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_item.dart';

class HorizonralBookSection extends StatefulWidget {
  const HorizonralBookSection({super.key});

  @override
  State<HorizonralBookSection> createState() => _HorizonralBookSectionState();
}

class _HorizonralBookSectionState extends State<HorizonralBookSection>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteBookBloc, RemoteBookState>(
      builder: (context, state) => switch (state) {
        RemoteBookInitial() => const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        RemoteBookLoading() => const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        RemoteBookLoaded() ||
        RemoteBookLoadedNewest() ||
        RemoteBookLoadedPopular() =>
          _buildBody(context, state),
      },
    );
  }

  SliverToBoxAdapter _buildBody(BuildContext context, RemoteBookState state) {
    return SliverToBoxAdapter(
      child: Container(
        padding: context.onlyLeftPaddingLow * 2,
        height: context.highValue * 3.7,
        width: context.highValue,
        child: Row(
          children: [
            _buildVerticalTabBar(_tabController, context),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final book = state.bookInfos?[index];
                    return  BookItemWidget(
                        authorName: book?.authors?.first,
                        bookName: book?.title,
                        imagePath: book?.imageLinks?.smallThumbnail,
                    );
                  },
                  itemCount: state.bookInfos?.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_buildVerticalTabBar(TabController tabController, BuildContext context) {
  return RotatedBox(
    quarterTurns: 3,
    child: DefaultTabController(
      length: 3,
      child: TabBar(
          labelColor: Colors.black,
          labelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          indicator: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage(
                  AssetConstants.instance.tabIcon5,
                ),
                fit: BoxFit.fitWidth),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.black,
          indicatorPadding:
              const EdgeInsets.only(left: 12, top: 10, bottom: 0, right: 10),
          indicatorWeight: 0,
          controller: tabController,
          onTap: (int) {
            switch (int) {
              case 0:
                context
                    .read<RemoteBookBloc>()
                    .add(RemoteLoadNewestBooksEvent());

                break;
              case 1:
                context.read<RemoteBookBloc>().add(RemoteLoadBooksEvent());
                break;
              case 2:
                context
                    .read<RemoteBookBloc>()
                    .add(RemoteLoadPopularBooksEvent());

                break;
            }
          },
          tabs: const [
            Tab(
              text: "Popular",
            ),
            Tab(
              text: "BestSellers",
            ),
            Tab(
              text: "Newest",
            ),
          ]),
    ),
  );
}
