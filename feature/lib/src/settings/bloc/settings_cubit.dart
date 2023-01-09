import 'package:bloc/bloc.dart';
import 'package:feature/src/settings/bloc/settings_state.dart';
import 'package:lib_use_case/lib_use_case.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetAccessTokenUseCase _getAccessTokenUseCase;
  final SaveAccessTokenUseCase _saveAccessTokenUseCase;
  final ResetAccessTokenUseCase _resetAccessTokenUseCase;

  SettingsCubit(
    this._getAccessTokenUseCase,
    this._saveAccessTokenUseCase,
    this._resetAccessTokenUseCase,
  ) : super(const SettingsState(token: null));

  void loadAccessToken() {
    _getAccessTokenUseCase.invoke().then(
          (value) => emit(
            SettingsState(token: value),
          ),
        );
  }

  void saveAccessToken(String? token) async {
    if (token?.isNotEmpty != true) return;

    await _saveAccessTokenUseCase.invoke(token!);
    emit(SettingsState(token: token));
  }

  void resetToken(String token) {
    _resetAccessTokenUseCase
        .invoke(token)
        .then((_) => emit(const SettingsState(token: null)));
  }
}
