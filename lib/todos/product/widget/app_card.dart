import 'package:bloc_weekend/todos/feature/model/todos_model.dart';
import 'package:flutter/material.dart';

class TodosCard extends StatelessWidget {
  final TodosModel? model;
  const TodosCard({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _elevationCard = 10;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Card(
        elevation: _elevationCard,
        child: ListTile(
          leading: CircleAvatar(
            child: Text(model?.id.toString() ?? ''),
          ),
          title: Text(model?.title ?? ''),
          trailing: model?.completed == true
              ? const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
        ),
      ),
    );
  }
}
