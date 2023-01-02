import 'dart:collection';

import 'package:feature/src/feed_filter/bloc/feed_filter_chip.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_cubit.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_state.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_type.dart';
import 'package:feature/src/selection/bloc/selectable_option.dart';
import 'package:feature/src/selection/multi_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedFilterWidget extends StatelessWidget {
  const FeedFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = FeedFilterCubit();
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

    return Chip(
      label: Text(_chipContent.content),
      backgroundColor: backgroundColor,
      onDeleted: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => const MultiSelectionWidget(
            'Books',
            [
              SelectableOption(0, 'option 0'),
              SelectableOption(1, 'option 1'),
              SelectableOption(2, 'option 2'),
              SelectableOption(3, 'option 3'),
              SelectableOption(4, 'option 4'),
              SelectableOption(5, 'option 5'),
              SelectableOption(6, 'option 6'),
              SelectableOption(7, 'option 7'),
              SelectableOption(8, 'option 8'),
              SelectableOption(9, 'option 9'),
              SelectableOption(10, 'option 10'),
              SelectableOption(11, 'option 11'),
              SelectableOption(12, 'option 12'),
              SelectableOption(13, 'option 13'),
              SelectableOption(14, 'option 14'),
              SelectableOption(15, 'option 15'),
              SelectableOption(16, 'option 16'),
              SelectableOption(17, 'option 17'),
              SelectableOption(18, 'option 18'),
              SelectableOption(19, 'option 19'),
            ],
            <int>{1, 3, 5},
          ),
        );
      },
    );
  }
}
