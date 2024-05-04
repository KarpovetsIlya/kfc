import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kfc/common/models/task_model.dart';
import 'package:kfc/common/utils/constants.dart';
import 'package:kfc/common/widgets/appstyle.dart';
import 'package:kfc/common/widgets/custom_otn_btn.dart';
import 'package:kfc/common/widgets/custom_text.dart';
import 'package:kfc/common/widgets/hieght_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:kfc/features/todo/controller/dates/dates_provider.dart';
import 'package:kfc/features/todo/controller/todo/todo_provider.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(finishTimeStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HieghtSpacer(hieght: 20),
            CustomTextField(
              hintText: "Add title",
              controller: title,
              hintStyle: appsStyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            const HieghtSpacer(hieght: 20),
            CustomTextField(
              hintText: "Add description",
              controller: desc,
              hintStyle: appsStyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            const HieghtSpacer(hieght: 20),
            CustomOtlBtn(
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2020, 1, 1),
                    maxTime: DateTime(2030, 1, 1),
                    theme: const picker.DatePickerTheme(
                      doneStyle:
                          TextStyle(color: AppConst.kGreyDk, fontSize: 16),
                    ), onConfirm: (date) {
                  ref.read(dateStateProvider.notifier).setDate(date.toString());
                }, currentTime: DateTime.now(), locale: picker.LocaleType.ru);
              },
              width: AppConst.kWidth,
              height: 52.h,
              color: AppConst.kLight,
              color2: AppConst.kRed,
              text: scheduleDate == ""
                  ? "Set Date"
                  : scheduleDate.substring(0, 10),
            ),
            const HieghtSpacer(hieght: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtlBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                        showTitleActions: true, onConfirm: (date) {
                      ref
                          .read(startTimeStateProvider.notifier)
                          .setStart(date.toString());
                    }, locale: picker.LocaleType.ru);
                  },
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color: AppConst.kLight,
                  color2: AppConst.kRed,
                  text: start == "" ? "Start Time" : start.substring(10, 16),
                ),
                CustomOtlBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                        showTitleActions: true, onConfirm: (date) {
                      ref
                          .read(finishTimeStateProvider.notifier)
                          .setStart(date.toString());
                    }, locale: picker.LocaleType.ru);
                  },
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color: AppConst.kLight,
                  color2: AppConst.kRed,
                  text: finish == "" ? "Finish Time" : finish.substring(10, 16),
                ),
              ],
            ),
            const HieghtSpacer(hieght: 20),
            CustomOtlBtn(
                onTap: () {
                  if (title.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      scheduleDate.isNotEmpty &&
                      start.isNotEmpty &&
                      finish.isNotEmpty) {
                    Task task = Task(
                      title: title.text,
                      desc: desc.text,
                      isCompleted: 0,
                      date: scheduleDate,
                      startTime: start.substring(10, 16),
                      endTime: finish.substring(10, 16),
                      remind: 0,
                      repeat: "yes",
                    );
                    ref.read(todoStateProvider.notifier).addItem(task);
                    ref.read(finishTimeStateProvider.notifier).setStart('');
                    ref.read(startTimeStateProvider.notifier).setStart('');
                    ref.read(dateStateProvider.notifier).setDate('');
                    Navigator.pop(context);
                  } else {
                    print("Failed to add task");
                  }
                },
                width: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kRed,
                text: "Submit"),
          ],
        ),
      ),
    );
  }
}
