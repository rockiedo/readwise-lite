import 'package:feature/src/feed_filter/bloc/feed_filter_cubit.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_state.dart';
import 'package:feature/src/feed_filter/feed_filter_widget.dart';
import 'package:feature/src/feed/bloc/feed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit =
            FeedFilterCubit(GetIt.instance.get<GetLocalBooksUseCase>());
        cubit.loadSelectableOptions();
        return cubit;
      },
      child: Scaffold(
        body: GestureDetector(
          onPanDown: (_) {
            FocusScopeNode focusNode = FocusScope.of(context);
            if (!focusNode.hasPrimaryFocus) {
              focusNode.unfocus();
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                BlocBuilder<FeedFilterCubit, FeedFilterState>(
                  builder: (innerContext, state) {
                    return FeedFilterWidget(
                        innerContext.read<FeedFilterCubit>());
                  },
                ),
                const Divider(height: 1, thickness: 1.5),
                Expanded(
                  child: BlocProvider(
                    create: (_) {
                      final cubit = FeedCubit(
                          GetIt.instance.get<LoadHighlightFeedsUseCase>());
                      return cubit;
                    },
                    child: BlocBuilder<FeedFilterCubit, FeedFilterState>(
                      builder: (innerContext, state) {
                        return _PagedFeedsWidget(state.filter);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PagedFeedsWidget extends StatefulWidget {
  final HighlightFeedFilter _filter;

  const _PagedFeedsWidget(
    this._filter, {
    Key? key,
  }) : super(key: key);

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
  void didUpdateWidget(_PagedFeedsWidget oldWidget) {
    if (oldWidget._filter != widget._filter) {
      _pagingController.refresh();
    }
    super.didUpdateWidget(oldWidget);
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
            filter: widget._filter,
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
  final HighlightFeed _feed;

  const _FeedTileWidget(this._feed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(_feed.text),
          if (_feed.author != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _feed.author!,
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Divider(height: 1),
          ),
        ],
      ),
    );
  }
}
