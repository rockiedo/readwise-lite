import 'dart:developer' as dev;

import 'package:feature_settings/src/ui/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    dev.log('SettingsWidget.build()');

    return BlocProvider(
      create: (context) => SettingsCubit(
        GetIt.instance.get<GetLatestAccessTokenUseCase>(),
        GetIt.instance.get<SaveAccessTokenUseCase>(),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const ChangeAccessTokenWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeAccessTokenWidget extends StatelessWidget {
  const ChangeAccessTokenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: TextField(
            onChanged: (value) {
              cubit.onUserInputChange(value);
            },
          ),
        ),
        OutlinedButton(
          onPressed: () {
            cubit.saveAccessToken();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
