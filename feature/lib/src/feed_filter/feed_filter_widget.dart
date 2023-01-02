import 'package:feature/src/feed_filter/bloc/feed_filter_chip.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_cubit.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_state.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_type.dart';
import 'package:feature/src/selection/bloc/selectable_option.dart';
import 'package:feature/src/selection/multi_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';

class FeedFilterWidget extends StatelessWidget {
  const FeedFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = FeedFilterCubit(
          GetIt.instance.get<GetLocalBooksUseCase>(),
        );

        cubit.loadSelectableOptions();
        return cubit;
      },
      child: const _ChipContainer(),
    );
  }
}

class _ChipContainer extends StatelessWidget {
  const _ChipContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedFilterCubit, FeedFilterState>(
      builder: (innerContext, state) {
        final chips = state.chips
            ?.map(
              (content) => _FilterChip(content),
            )
            .toList();
        return Wrap(
          spacing: 8,
          children: chips ?? List.empty(),
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  final FeedFilterChip _chipContent;

  const _FilterChip(this._chipContent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    if (_chipContent.type == FeedFilterType.book) {
      backgroundColor = Colors.blueAccent;
    }
    if (_chipContent.type == FeedFilterType.author) {
      backgroundColor = Colors.deepOrange;
    }

    return _isCategoryChip()
        ? ActionChip(
            label: Text(_chipContent.content),
            onPressed: () {
              _showMultiSelection(context);
            },
            pressElevation: 0,
          )
        : Chip(
            label: Text(_chipContent.content),
            backgroundColor: backgroundColor,
            onDeleted: () {
              context.read<FeedFilterCubit>().deleteBookChip(_chipContent.id!);
            },
          );
  }

  bool _isCategoryChip() {
    return _chipContent.type == FeedFilterType.defaultBook ||
        _chipContent.type == FeedFilterType.defaultAuthor;
  }

  void _onSelected(FeedFilterCubit cubit, Set<int> selected) {
    if (_chipContent.type == FeedFilterType.defaultBook) {
      cubit.onBookSelectionChanged(selected);
      return;
    }
    cubit.onAuthorSelectionChanged(selected);
  }

  void _showMultiSelection(BuildContext context) {
    final cubit = context.read<FeedFilterCubit>();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return MultiSelectionWidget(
          _chipContent.type == FeedFilterType.defaultBook ? 'Books' : 'Authors',
          _getSelectableOptions(cubit),
          _getPreselected(cubit),
          onSelected: (ids) {
            _onSelected(cubit, ids);
          },
        );
      },
    );
  }

  List<SelectableOption> _getSelectableOptions(FeedFilterCubit cubit) {
    if (_chipContent.type == FeedFilterType.defaultBook) {
      return cubit
          .getSelectableBooks()
          .map((e) => SelectableOption(e.key, e.value))
          .toList();
    }

    return cubit
        .getSelectableAuthors()
        .map((e) => SelectableOption(e.key, e.value))
        .toList();
  }

  Set<int> _getPreselected(FeedFilterCubit cubit) {
    if (_chipContent.type == FeedFilterType.defaultBook) {
      return cubit.state.filter.bookIds?.toSet() ?? <int>{};
    }

    final selectableAuthors = cubit.getSelectableAuthors();
    return cubit.state.filter.authors
            ?.map(
              (author) => selectableAuthors
                  .firstWhere((entry) => entry.value == author)
                  .key,
            )
            .toSet() ??
        <int>{};
  }
}
