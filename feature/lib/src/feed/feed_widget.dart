import 'package:feature/src/feed_filter/feed_filter_widget.dart';
import 'package:feature/src/feed/bloc/feed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lib_use_case/lib_use_case.dart';

class HighlightFeedWidget extends StatelessWidget {
  const HighlightFeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit =
            FeedCubit(GetIt.instance.get<LoadHighlightFeedsUseCase>());
        return cubit;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: const [
              FeedFilterWidget(),
              Divider(),
              Expanded(child: _PagedFeedsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

class _PagedFeedsWidget extends StatefulWidget {
  const _PagedFeedsWidget({Key? key}) : super(key: key);

  @override
  State<_PagedFeedsWidget> createState() => _PagedFeedsWidgetState();
}

class _PagedFeedsWidgetState extends State<_PagedFeedsWidget> {
  static const _pageSize = 50;

  final PagingController<int, HighlightFeed> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, HighlightFeed>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<HighlightFeed>(
        itemBuilder: (listContext, feed, index) {
          return _FeedTileWidget(feed);
        },
      ),
    );
  }

  Future _fetchPage(int pageKey) async {
    try {
      final feeds = await context.read<FeedCubit>().loadFeeds(
            _pageSize,
            pageKey: pageKey,
            filter: HighlightFeedFilter(
                bookIds: List.empty(),
                authors: List.empty(),
                searchTerm: 'sutra'),
          );
      final isLastPage = feeds.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(feeds);
      } else {
        _pagingController.appendPage(feeds, pageKey + feeds.length);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}

class _FeedTileWidget extends StatelessWidget {
  final HighlightFeed feed;

  const _FeedTileWidget(this.feed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(feed.text),
          SizedBox.fromSize(size: const Size.fromHeight(16)),
          if (feed.author != null)
            Text(
              feed.author!,
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
        ],
      ),
    );
  }
}
