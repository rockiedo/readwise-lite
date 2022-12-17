import 'package:feature_settings/src/ui/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';

import 'cubit/settings_state.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = SettingsCubit(
          GetIt.instance.get<GetLatestAccessTokenUseCase>(),
          GetIt.instance.get<SaveAccessTokenUseCase>(),
        );

        cubit.loadAccessToken();
        return cubit;
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Settings',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              SizedBox.fromSize(size: const Size.fromHeight(32)),
              const _AccessTokenTextField(),
              const _SaveAccessTokenButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccessTokenTextField extends StatefulWidget {
  const _AccessTokenTextField();

  @override
  State<_AccessTokenTextField> createState() => _AccessTokenTextFieldState();
}

class _AccessTokenTextFieldState extends State<_AccessTokenTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (innerContext, state) {
        if (state.userInput == null && state.initial != null) {
          _controller.text = state.initial!;
        }

        final showTrailingIcon = (state.initial?.isNotEmpty ?? false) ||
            (state.userInput?.isNotEmpty ?? false);

        return TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Token XYZ',
            label: const Text('Access token'),
            suffixIcon: Visibility(
              visible: showTrailingIcon,
              child: IconButton(
                icon: Icon(
                  state.isEditing ? Icons.clear : Icons.visibility,
                ),
                onPressed: () {
                  if (state.isEditing) {
                    _controller.clear();
                    innerContext.read<SettingsCubit>().onUserInputChange('');
                  } else {
                    innerContext.read<SettingsCubit>().startEditing();
                  }
                },
              ),
            ),
          ),
          maxLines: state.isEditing ? null : 1,
          obscureText: !state.isEditing,
          controller: _controller,
          onChanged: (value) {
            if (value != state.userInput) {
              innerContext.read<SettingsCubit>().onUserInputChange(value);
            }
          },
        );
      },
    );
  }
}

class _SaveAccessTokenButton extends StatelessWidget {
  const _SaveAccessTokenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (innerContext, state) {
        final enabled = (state.userInput?.isNotEmpty ?? false) &&
            state.userInput != state.initial;

        return ElevatedButton(
          onPressed: !enabled ? null : () {
            innerContext.read<SettingsCubit>().saveAccessToken();
          },
          child: const Text('Save'),
        );
      },
    );
  }
}

