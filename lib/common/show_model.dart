import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo/constants/app_style.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/provider/date_time_provider.dart';
import 'package:todo/provider/radio_provider.dart';
import 'package:todo/provider/service_provider.dart';
import 'package:todo/widget/date_time_widget.dart';
import 'package:todo/widget/radio_type.dart';
import 'package:todo/widget/radio_widget.dart';
import 'package:todo/widget/textfield_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewsTask extends ConsumerStatefulWidget {
  AddNewsTask({
    Key? key,
  }) : super(key: key);

  @override
  _AddNewsTaskState createState() => _AddNewsTaskState();
}

class _AddNewsTaskState extends ConsumerState<AddNewsTask> {
  final titleController = TextEditingController();
  final decriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateProv = ref.watch(dateProvider);
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.95,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
              width: double.infinity,
              child: Text(
                'Create New Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          Divider(
            thickness: 1.5,
            color: Colors.grey.shade300,
          ),
          const Gap(12),
          const Text(
            'Title',
            style: AppStyle.heardingOne,
          ),
          const Gap(6),
          TextFieldWidget(
            maxLine: 1,
            hintText: 'Add Task name',
            txtController: titleController,
          ),
          const Gap(18),
          const Text('Descriptions', style: AppStyle.heardingOne),
          const Gap(6),
          TextFieldWidget(
            maxLine: 5,
            hintText: 'Add Descriptions',
            txtController: decriptionController,
          ),
          const Gap(18),
          const Text('Category', style: AppStyle.heardingOne),
          Row(children: [
            Expanded(
                child: RadioWidget(
              categColor: Colors.blue,
              titleRadio: 'Learn',
              valueInput: 4,
              onChangevalue: () =>
                  ref.read(radioCategory.notifier).update((state) => 4),
            )),
            Expanded(
                child: RadioWidget(
              categColor: Colors.purple,
              titleRadio: 'Work',
              valueInput: 5,
              onChangevalue: () =>
                  ref.read(radioCategory.notifier).update((state) => 5),
            )),
            Expanded(
                child: RadioWidget(
              categColor: Colors.brown,
              titleRadio: 'General',
              valueInput: 6,
              onChangevalue: () =>
                  ref.read(radioCategory.notifier).update((state) => 6),
            )),
          ]),
          const Text('Priority', style: AppStyle.heardingOne),
          Row(children: [
            Expanded(
                child: RadioType(
              categColor: Colors.green,
              titleRadio: 'Low',
              valueInput: 1,
              onChangevalue: () =>
                  ref.read(radioType.notifier).update((state) => 1),
            )),
            Expanded(
                child: RadioType(
              categColor: Colors.orange.shade500,
              titleRadio: 'Med',
              valueInput: 2,
              onChangevalue: () =>
                  ref.read(radioType.notifier).update((state) => 2),
            )),
            Expanded(
                child: RadioType(
              categColor: Colors.red,
              titleRadio: 'High',
              valueInput: 3,
              onChangevalue: () =>
                  ref.read(radioType.notifier).update((state) => 3),
            )),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: 'Date',
                valueText: dateProv,
                iconSection: CupertinoIcons.calendar,
                onTap: () async {
                  final getValue = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2034));
                  if (getValue != null) {
                    final format = DateFormat.yMd();
                    ref
                        .read(dateProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                },
              ),
              const Gap(36),
              DateTimeWidget(
                titleText: 'Time',
                valueText: ref.watch(timeProvider),
                iconSection: CupertinoIcons.clock,
                onTap: () async {
                  final getTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  if (getTime != null) {
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => getTime.format(context));
                  }
                },
              ),
            ],
          ),

          //button Section
          const Gap(26),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade700,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: Colors.blue.shade800,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const Gap(24),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  onPressed: () {
                    final getCategory = ref.read(radioCategory);
                    String category = '';
                    final getType = ref.read(radioType);
                    String type = '';

                    switch (getCategory) {
                      case 4:
                        category = 'Learning';
                        break;
                      case 5:
                        category = 'Working';
                        break;
                      case 6:
                        category = 'General';
                        break;
                    }
                    switch (getType) {
                      case 1:
                        type = 'Low';
                        break;
                      case 2:
                        type = 'Med';
                        break;
                      case 3:
                        type = 'High';
                        break;
                    }

                    ref.read(serviceProvider).addNewsTask(TodoModel(
                          titleTask: titleController.text,
                          description: decriptionController.text,
                          category: category,
                          priority: type,
                          dateTime: ref.read(dateProvider),
                          timeTask: ref.read(timeProvider),
                          isDone: false,
                    ));

                    titleController.clear();
                    decriptionController.clear();
                    ref.read(radioType.notifier).update((state) => 0);
                    ref.read(radioCategory.notifier).update((state) => 0);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

