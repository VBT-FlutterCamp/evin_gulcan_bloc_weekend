import 'package:bloc_weekend/todos/core/network/network_service.dart';
import 'package:bloc_weekend/todos/feature/viewModel/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/widget/app_card.dart';
import '../service/todos_service.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodosCubit(TodosService(NetworkService.instance.networkManager)),
      child: BlocConsumer<TodosCubit, TodosState>(listener: (context, state) {
        if (state is TodosErrorState) {
          showBottomSheet(
              context: context,
              builder: (context) => const Text('Error Message'));
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: state.items?.length,
            itemBuilder: (BuildContext context, int index) {
              return TodosCard(model: state.items?[index]);
            },
          ),
        );
      }),
    );
  }
}
