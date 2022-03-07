import 'package:bloc_weekend/todos/feature/model/todos_model.dart';
import 'package:bloc_weekend/todos/feature/service/todos_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit(this.todosService) : super(TodosInitial()) {
    fetchListData();
  }
  ITodosService todosService;
  List<TodosModel>? model;
  int? listCount = 0;
  Future<void> fetchListData() async {
    emit(TodosLoading());
    final model = await todosService.fetchTodosDatas();
    listCount = model?.length;
    emit(TodosComplete(model));
  }
}

abstract class TodosState {
  get items => null;
}

class TodosInitial extends TodosState {}

class TodosLoading extends TodosState {}

class TodosComplete extends TodosState {
  @override
  final List<TodosModel>? items;
  TodosComplete(this.items);
}

class TodosErrorState extends TodosState {}
