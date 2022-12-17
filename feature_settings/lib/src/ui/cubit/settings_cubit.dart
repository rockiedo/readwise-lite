import 'package:bloc/bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetLatestAccessTokenUseCase getAccessTokenUseCase;

  final SaveAccessTokenUseCase saveAccessTokenUseCase;

  SettingsCubit(
    this.getAccessTokenUseCase,
    this.saveAccessTokenUseCase,
  ) : super(const SettingsState());

  void loadAccessToken() {
    getAccessTokenUseCase
        .invoke()
        .then((value) => emit(SettingsState(initial: value)));
  }

  void onUserInputChange(String newInput) {
    emit(SettingsState(userInput: newInput));
  }

  void saveAccessToken() {
    if (state.userInput?.isEmpty ?? true) return;
    saveAccessTokenUseCase.invoke(state.userInput!, '');
  }
}
