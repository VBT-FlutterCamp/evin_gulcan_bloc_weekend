import 'package:bloc_weekend/todos/feature/model/todos_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  INetworkManager? manager;
  setUp(() {
    const String baseUrl = 'https://jsonplaceholder.typicode.com/todos';
    manager = NetworkManager(
        isEnableLogger: true, options: BaseOptions(baseUrl: baseUrl));
  });

  test('Todos Test ', () async {
    final response = await manager?.send<TodosModel, List<TodosModel>>('',
        parseModel: TodosModel(), method: RequestType.GET);

    expect(response, isNotNull);
  });
}
