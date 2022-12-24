import 'package:bloc/bloc.dart';
import 'package:feature/src/settings/bloc/settings_state.dart';
import 'package:lib_use_case/lib_use_case.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetAccessTokenUseCase getAccessTokenUseCase;

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
    emit(state.copyWith(userInput: newInput, isEditing: true));
  }

  void saveAccessToken() {
    if (state.userInput?.isEmpty ?? true) return;
    saveAccessTokenUseCase.invoke(state.userInput!, '');
  }

  void startEditing() {
    emit(state.copyWith(isEditing: true));
  }
}
