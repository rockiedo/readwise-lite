import 'package:feature/src/feed_filter/bloc/feed_filter_chip.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_cubit.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_state.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_type.dart';
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
      onDeleted: () {},
    );
  }
}
