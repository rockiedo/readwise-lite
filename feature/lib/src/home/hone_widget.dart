import 'package:feature/feature.dart';
import 'package:feature/src/home/bloc/home_cubit.dart';
import 'package:feature/src/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lib_use_case/lib_use_case.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = HomeCubit(GetIt.instance.get<GetAccessTokenUseCase>());
        cubit.load();
        return cubit;
      },
      child: const Scaffold(
        body: SafeArea(child: _HomeContainerWidget()),
        floatingActionButton: _HomeFabWidget(),
      ),
    );
  }
}

class _HomeContainerWidget extends StatelessWidget {
  const _HomeContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (innerContext, state) {
        if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == HomeStatus.noAccessToken) {
          return _PlaceHolderWidget(
            desc: 'No access token, please set one',
            ctaText: 'Settings',
            clickToAction: () {
              _goToSettings(innerContext);
            },
          );
        }

        return const FeedWidget();
      },
    );
  }

  void _goToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (newContext) => const SettingsWidget()),
    ).then((value) => context.read<HomeCubit>().load());
  }
}

class _HomeFabWidget extends StatelessWidget {
  const _HomeFabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (innerContext, state) {
        return Visibility(
          visible: state.status == HomeStatus.content,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsWidget()),
              ).then(
                (value) => innerContext.read<HomeCubit>().load(),
              );
            },
            child: const Icon(Icons.menu),
          ),
        );
      },
    );
  }
}

class _PlaceHolderWidget extends StatelessWidget {
  final String _desc;
  final String _ctaText;
  final VoidCallback _clickToAction;

  const _PlaceHolderWidget({
    required desc,
    required ctaText,
    required clickToAction,
    Key? key,
  })  : _desc = desc,
        _ctaText = ctaText,
        _clickToAction = clickToAction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _desc,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            onPressed: () {
              _clickToAction();
            },
            child: Text(_ctaText),
          )
        ],
      ),
    );
  }
}
