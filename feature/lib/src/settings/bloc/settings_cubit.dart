import 'package:bloc/bloc.dart';
import 'package:feature/src/settings/bloc/settings_state.dart';
import 'package:lib_use_case/lib_use_case.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetAccessTokenUseCase getAccessTokenUseCase;

  final SaveAccessTokenUseCase saveAccessTokenUseCase;

  SettingsCubit(
    this.getAccessTokenUseCase,
    this.saveAccessTokenUseCase,
  ) : super(const SettingsState(token: null));

  void loadAccessToken() {
    getAccessTokenUseCase.invoke().then(
          (value) => emit(
            SettingsState(token: value),
          ),
        );
  }

  void saveAccessToken() async {
    if (state.token?.isNotEmpty != true) return;

    await saveAccessTokenUseCase.invoke(state.token!, '');
    emit(SettingsState(token: state.token));
  }

  void resetToken() {}
}
