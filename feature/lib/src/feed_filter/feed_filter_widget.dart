import 'dart:async';

import 'package:feature/src/feed_filter/bloc/feed_filter_chip.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_cubit.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_state.dart';
import 'package:feature/src/feed_filter/bloc/feed_filter_type.dart';
import 'package:feature/src/selection/bloc/selectable_option.dart';
import 'package:feature/src/selection/multi_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedFilterWidget extends StatelessWidget {
  final FeedFilterCubit cubit;

  const FeedFilterWidget(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: _SearchTextField(),
          ),
          _ChipContainer(),
        ],
      ),
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
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: chips ?? List.empty(),
            ),
          ),
        );
      },
    );
  }
}

class _SearchTextField extends StatefulWidget {
  const _SearchTextField({Key? key}) : super(key: key);

  @override
  State<_SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<_SearchTextField> {
  final _controller = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(8),
        hintText: 'Search by content',
        suffixIcon: Visibility(
          visible: _controller.value.text.trim().isNotEmpty,
          child: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              _onSearchChanged('');
            },
          ),
        ),
      ),
      maxLines: 1,
      controller: _controller,
      onChanged: (value) {
        _onSearchChanged(value);
      },
    );
  }

  void _onSearchChanged(String term) {
    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 300),
      () {
        context.read<FeedFilterCubit>();
      },
    );

    setState(() {});
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

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: _isCategoryChip()
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
                context
                    .read<FeedFilterCubit>()
                    .deleteChip(_chipContent.id, _chipContent.type);
              },
            ),
    );
  }

  bool _isCategoryChip() {
    return _chipContent.type == FeedFilterType.defaultBook ||
        _chipContent.type == FeedFilterType.defaultAuthor;
  }

  void _onSelected(FeedFilterCubit cubit, Set<Object> selected) {
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
          .entries
          .map((e) => SelectableOption(e.key, e.value))
          .toList();
    }

    return cubit
        .getSelectableAuthors()
        .map((e) => SelectableOption(e, e))
        .toList();
  }

  Set<Object> _getPreselected(FeedFilterCubit cubit) {
    if (_chipContent.type == FeedFilterType.defaultBook) {
      return cubit.state.filter.bookIds?.toSet() ?? <Object>{};
    }

    return cubit.state.filter.authors?.toSet() ?? <Object>{};
  }
}
