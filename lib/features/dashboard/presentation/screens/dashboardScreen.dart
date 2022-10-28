import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trm/config/appColors.dart';
import 'package:trm/config/appLayout.dart';
import 'package:trm/features/dashboard/domain/entities/movieEntity.dart';

import '../../providers.dart';
import '../../widgets/itemListCard.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  static const String routeName = '/dashboardScreen';

  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final PagingController<int, Movie?> _pagingController = PagingController(firstPageKey: 1);

  late StreamSubscription _subscription;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      ref.read(repositoryProvider).add(pageKey);
      debugPrint("the page is $pageKey");
    });

    _subscription = ref.read(repositoryProvider).getStream().listen((state) {
      print('listen : ${state.itemList?.length}');
      _pagingController.value = PagingState(
        error: state.error,
        nextPageKey: state.nextPageKey,
        itemList: state.itemList,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = AppLayout.isPortrait(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Image.asset('assets/logo/logo.png', width: 50, height: 50),
        ),
        body: PagedListView<int, Movie?>(
          pagingController: _pagingController,
          padding: const EdgeInsets.all(12),
          builderDelegate: PagedChildBuilderDelegate<Movie?>(
            itemBuilder: (_, movie, index) {
              return ListItemWidget(isPortrait: isPortrait, movie: movie, index: index);
            },
          ),
        )

        // ListView.builder(
        //   // itemCount: 10,
        //   padding: const EdgeInsets.all(12),
        //   itemBuilder: (_, int index) {
        //     return ListItemWidget(isPortrait: isPortrait);
        //   },
        // ),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _pagingController.dispose();
    ref.read(repositoryProvider).dispose();
    super.dispose();
  }
}
