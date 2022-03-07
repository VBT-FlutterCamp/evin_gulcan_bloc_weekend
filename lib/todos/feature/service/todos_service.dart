import 'package:bloc_weekend/todos/feature/model/todos_model.dart';
import 'package:vexana/vexana.dart';

abstract class ITodosService {
  late final INetworkManager manager;

  ITodosService(this.manager);

  Future<List<TodosModel>?> fetchTodosDatas();
}

class TodosService extends ITodosService {
  TodosService(INetworkManager manager) : super(manager);

  @override
  Future<List<TodosModel>?> fetchTodosDatas() async {
    final response = await manager.send<TodosModel, List<TodosModel>?>(
        NetworkPath.todos.rawValue(),
        parseModel: TodosModel(),
        method: RequestType.GET);

    return response.data ?? [];
  }
}

enum NetworkPath { todos }

extension NetworkPathExtension on NetworkPath {
  String rawValue() {
    switch (this) {
      case NetworkPath.todos:
        return '/todos';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
