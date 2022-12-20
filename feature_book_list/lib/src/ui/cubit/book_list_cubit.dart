import 'package:core_model/core_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class BookListCubit extends Cubit<bool> {
  final GetLatestAccessTokenUseCase getLatestAccessTokenUseCase;
  final GetLocalBooksUseCase getLocalBooksUseCase;

  BookListCubit(
    this.getLatestAccessTokenUseCase,
    this.getLocalBooksUseCase,
  ) : super(false);

  Future<List<Book>> getLocalBooks() async {
    final accessToken = await getLatestAccessTokenUseCase.invoke();
    return getLocalBooksUseCase.invoke(accessToken!);
  }
}
