import 'package:bloc/bloc.dart';
import 'package:feature/src/settings/bloc/settings_state.dart';
import 'package:lib_use_case/lib_use_case.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetAccessTokenUseCase getAccessTokenUseCase;
  final SaveAccessTokenUseCase saveAccessTokenUseCase;
  final ResetAccessTokenUseCase resetAccessTokenUseCase;

  SettingsCubit(
    this.getAccessTokenUseCase,
    this.saveAccessTokenUseCase,
    this.resetAccessTokenUseCase,
  ) : super(const SettingsState(token: null));

  void loadAccessToken() {
    getAccessTokenUseCase.invoke().then(
          (value) => emit(
            SettingsState(token: value),
          ),
        );
  }

  void saveAccessToken(String? token) async {
    if (token?.isNotEmpty != true) return;

    await saveAccessTokenUseCase.invoke(token!);
    emit(SettingsState(token: token));
  }

  void resetToken(String token) {
    resetAccessTokenUseCase
        .invoke(token)
        .then((_) => emit(const SettingsState(token: null)));
  }
}
