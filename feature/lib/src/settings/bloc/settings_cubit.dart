import 'package:bloc/bloc.dart';
import 'package:core_data/core_data.dart';
import 'package:feature/src/settings/bloc/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AccessTokenRepository _accessTokenRepository;

  SettingsCubit(
    this._accessTokenRepository,
  ) : super(const SettingsState(token: null));

  void loadAccessToken() {
    _accessTokenRepository.loadAccessToken().then(
          (value) => emit(
            SettingsState(token: value),
          ),
        );
  }

  void saveAccessToken(String? token) async {
    if (token?.isNotEmpty != true) return;

    await _accessTokenRepository.storeAccessToken(token!);
    emit(SettingsState(token: token));
  }

  void resetToken(String token) {
    _accessTokenRepository
        .resetAccessToken(token)
        .then((_) => emit(const SettingsState(token: null)));
  }
}
