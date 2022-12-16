import 'package:feature_settings/src/ui/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';

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
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox.fromSize(size: const Size.fromHeight(32)),
              const AccessTokenTextField(),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (innerContext, state) {
                  return ElevatedButton(
                    onPressed: () {
                      innerContext.read<SettingsCubit>().saveAccessToken();
                    },
                    child: const Text('Save'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccessTokenTextField extends StatefulWidget {
  const AccessTokenTextField({super.key});

  @override
  State<AccessTokenTextField> createState() => _AccessTokenTextFieldState();
}

class _AccessTokenTextFieldState extends State<AccessTokenTextField> {
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

        return TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Token XYZ',
            label: Text('Access token'),
          ),
          maxLines: null,
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
