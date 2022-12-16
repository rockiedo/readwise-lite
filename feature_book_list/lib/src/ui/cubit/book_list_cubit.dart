import 'package:core_model/core_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_use_case/lib_use_case.dart';

class BookListCubit extends Cubit<bool> {
  final GetLocalBooksUseCase getLocalBooksUseCase;

  BookListCubit(this.getLocalBooksUseCase) : super(false);

  Future<List<Book>> getLocalBooks() {
    return getLocalBooksUseCase.invoke();
  }
}