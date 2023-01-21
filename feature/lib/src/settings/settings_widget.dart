import 'package:core_data/core_data.dart';
import 'package:feature/src/data_sync_v2/data_sync_v2_widget.dart';
import 'package:feature/src/settings/bloc/settings_cubit.dart';
import 'package:feature/src/settings/bloc/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        FocusScopeNode focusNode = FocusScope.of(context);
        if (!focusNode.hasPrimaryFocus) {
          focusNode.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close),
          ),
          title: const Text(
            'Settings',
          ),
        ),
        body: SafeArea(
          child: BlocProvider(
            create: (_) {
              final cubit = SettingsCubit(
                GetIt.instance.get<AccessTokenRepository>(),
              );

              cubit.loadAccessToken();
              return cubit;
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<SettingsCubit, SettingsState>(
                builder: (innerContext, state) {
                  if (state.token?.isNotEmpty == true) {
                    return _SettingsWithAccessTokenWidget(state.token!);
                  }
                  return const _SettingsWithoutAccessTokenWidget();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsWithoutAccessTokenWidget extends StatefulWidget {
  const _SettingsWithoutAccessTokenWidget({Key? key}) : super(key: key);

  @override
  State<_SettingsWithoutAccessTokenWidget> createState() =>
      _SettingsWithoutAccessTokenWidgetState();
}

class _SettingsWithoutAccessTokenWidgetState
    extends State<_SettingsWithoutAccessTokenWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Token XYZ',
            label: const Text('Access token'),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
                setState(() {});
              },
            ),
          ),
          controller: _controller,
          onChanged: (_) {
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _controller.text.isEmpty
              ? null
              : () {
                  context
                      .read<SettingsCubit>()
                      .saveAccessToken(_controller.text);
                },
          child: const Text('Save'),
        ),
        Expanded(flex: 1, child: Container()),
      ],
    );
  }
}

class _SettingsWithAccessTokenWidget extends StatefulWidget {
  final String token;

  const _SettingsWithAccessTokenWidget(
    this.token, {
    Key? key,
  }) : super(key: key);

  @override
  State<_SettingsWithAccessTokenWidget> createState() =>
      _SettingsWithAccessTokenWidgetState();
}

class _SettingsWithAccessTokenWidgetState
    extends State<_SettingsWithAccessTokenWidget> {
  bool _isTokenVisible = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.token;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _isTokenVisible ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(
                  () {
                    _isTokenVisible = !_isTokenVisible;
                  },
                );
              },
            ),
          ),
          obscureText: !_isTokenVisible,
          controller: _controller,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ElevatedButton(
            onPressed: () {
              context.read<SettingsCubit>().resetToken(widget.token);
            },
            child: const Text('Reset access token'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 32),
          child: _GoToDataSyncWidget(),
        ),
      ],
    );
  }
}

class _GoToDataSyncWidget extends StatelessWidget {
  const _GoToDataSyncWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(),
      ),
      title: const Text('Manage data synchronization'),
      trailing: const Icon(Icons.navigate_next),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DataSyncV2Widget()),
        );
      },
    );
  }
}
