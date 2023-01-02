import 'package:feature/src/selection/bloc/selectable_option.dart';
import 'package:flutter/material.dart';

typedef OnSelected = void Function(Set<int> selected);
typedef _OnSelectionChanged = void Function(int id, bool isChecked);

class MultiSelectionWidget extends StatefulWidget {
  final String title;
  final List<SelectableOption> options;
  final Set<int> preselected;
  final OnSelected? onSelected;

  const MultiSelectionWidget(
    this.title,
    this.options,
    this.preselected, {
    Key? key,
    this.onSelected,
  }) : super(key: key);

  @override
  State<MultiSelectionWidget> createState() => _MultiSelectionWidgetState();
}

class _MultiSelectionWidgetState extends State<MultiSelectionWidget> {
  final Set<int> selected = <int>{};

  @override
  void initState() {
    super.initState();
    selected.addAll(widget.preselected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: widget.options.length,
              itemBuilder: (_, index) {
                final option = widget.options[index];
                return _OptionTile(
                  option,
                  _onCheck,
                  initiallyChecked: selected.contains(option.id),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                widget.onSelected?.call(selected);
                Navigator.pop(context);
              },
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }

  void _onCheck(int id, bool isChecked) {
    if (!isChecked && selected.contains(id)) {
      selected.remove(id);
      return;
    }

    if (isChecked && !selected.contains(id)) {
      selected.add(id);
    }
  }
}

class _OptionTile extends StatefulWidget {
  final SelectableOption option;
  final _OnSelectionChanged onSelectionChanged;
  final bool initiallyChecked;

  const _OptionTile(
    this.option,
    this.onSelectionChanged, {
    Key? key,
    this.initiallyChecked = false,
  }) : super(key: key);

  @override
  State<_OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<_OptionTile> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initiallyChecked;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.option.content),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          widget.onSelectionChanged(widget.option.id, value == true);
          setState(() {
            isChecked = value == true;
          });
        },
      ),
    );
  }
}
