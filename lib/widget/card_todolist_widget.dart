import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo/provider/service_provider.dart';

class CardTodoListWidget extends ConsumerWidget {
  const CardTodoListWidget({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);

    return todoData.when(
        data: (todoData) {
          String type = '';
          Color categoryColor = Colors.white;
          Color priorityColor = Colors.white;
          final getCategory = todoData[getIndex].category;
          final getPriority = todoData[getIndex].priority;

          switch (getCategory) {
            case 'Learning':
              categoryColor = Colors.blue;
              break;

            case 'Working':
              categoryColor = Colors.purple;
              break;

            case 'General':
              categoryColor = Colors.brown;
              break;
          }
          switch (getPriority) {
            case 'Low':
              priorityColor = Colors.green;
              type = 'Low';
              break;

            case 'Med':
              priorityColor = Colors.orange.shade500;
              type = 'Med';
              break;

            case 'High':
              priorityColor = Colors.red;
              type = 'High';
              break;
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12))),
                  width: 20,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: priorityColor,
                                radius: 15,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                type,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          title: Text(
                            todoData[getIndex].titleTask,
                            maxLines: 1,
                            style: TextStyle(
                                decoration: todoData[getIndex].isDone
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          subtitle: Text(
                            todoData[getIndex].description,
                            maxLines: 1,
                            style: TextStyle(
                                decoration: todoData[getIndex].isDone
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          trailing: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                                shape: const CircleBorder(),
                                activeColor: Colors.blue.shade600,
                                value: todoData[getIndex].isDone,
                                onChanged: (value) => ref
                                    .read(serviceProvider)
                                    .updateTask(
                                        todoData[getIndex].docID, value)),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -12),
                          child: Column(
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: Colors.grey.shade400,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(CupertinoIcons.delete),
                                    onPressed: () {
                                      ref
                                          .read(serviceProvider)
                                          .deleteTask(todoData[getIndex].docID);
                                    },
                                  ),
                                  Text(todoData[getIndex].dateTime),
                                  Gap(12),
                                  Text(todoData[getIndex].timeTask),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                ))
              ],
            ),
          );
        },
        error: (error, stackTrace) =>
            Center(child: Text(stackTrace.toString())),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
