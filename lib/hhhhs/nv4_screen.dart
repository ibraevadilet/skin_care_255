import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skin_care_255/hhhhs/services/notification_handler.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/models/notification_model/notification_hive_model.dart';

class Nv4Screen extends StatefulWidget {
  const Nv4Screen({super.key});

  @override
  State<Nv4Screen> createState() => _Nv4ScreenState();
}

class _Nv4ScreenState extends State<Nv4Screen> {
  DateTime nowDate = DateTime.now();
  List<NotificationHiveModel> times = [];

  @override
  void initState() {
    times = List.from(notificatonHive.values.toList());
    late String nowdateString = DateFormat('dd.MM.yyyy').format(nowDate);
    times.removeWhere((e) => e.date != nowdateString);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Notifications'),
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21),
            child: InkWell(
              onTap: () async {
                await titleDialog(context);
              },
              child: Image.asset(
                'assets/images/add.png',
                height: 32.h,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    nowDate = nowDate.subtract(const Duration(days: 1));
                    times = List.from(notificatonHive.values.toList());
                    late String nowdateString =
                        DateFormat('dd.MM.yyyy').format(nowDate);
                    times.removeWhere((e) => e.date != nowdateString);
                    setState(() {});
                  },
                  child: Image.asset(
                    'assets/images/dateBack.png',
                    height: 30.h,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/calendar.png', height: 16.h),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('EEEE, MMMM d, yyyy').format(nowDate),
                        style: TextStyle(
                          fontFamily: family,
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    nowDate = nowDate.add(const Duration(days: 1));
                    times = List.from(notificatonHive.values.toList());
                    late String nowdateString =
                        DateFormat('dd.MM.yyyy').format(nowDate);
                    times.removeWhere((e) => e.date != nowdateString);
                    setState(() {});
                  },
                  child: Image.asset(
                    'assets/images/dateNext.png',
                    height: 30.h,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: times.isEmpty
                ? Center(
                    child: Image.asset(
                      'assets/images/empty_notif.png',
                      height: 140.h,
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(24),
                    shrinkWrap: true,
                    itemCount: times.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) => TimesWidget(
                      model: times[index],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> titleDialog(BuildContext context) async {
    final controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState2) {
          return CupertinoAlertDialog(
            title: Text(
              'Reminder',
              style: TextStyle(
                fontFamily: family,
                fontSize: 16.h,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            content: Column(
              children: [
                SizedBox(height: 14.h),
                Text(
                  'Write the reminder title',
                  style: TextStyle(
                    fontFamily: family,
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 24.h),
                CupertinoTextField(
                  onChanged: (value) {
                    setState2(() {});
                  },
                  controller: controller,
                  cursorHeight: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade300,
                  ),
                  placeholder: "Enter",
                ),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: family,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async {
                  if (controller.text.isNotEmpty) {
                    Navigator.of(context).pop();
                    await timeDialog(context, controller.text);
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: family,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w600,
                    color: controller.text.isEmpty
                        ? const Color(0xff00A3FF).withOpacity(0.5)
                        : const Color(0xff00A3FF),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> timeDialog(BuildContext context, String title) async {
    DateTime selectedDate = DateTime.now();
    await showDialog(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState2) {
        return CupertinoAlertDialog(
          title: Text(
            'Reminder',
            style: TextStyle(
              fontFamily: family,
              fontSize: 16.h,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          content: Column(
            children: [
              SizedBox(height: 14.h),
              Text(
                'Specify the reminder time',
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 130.h,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (onDateTimeChanged) {
                    selectedDate = onDateTimeChanged;
                  },
                ),
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                await notificatonHive.add(
                  NotificationHiveModel(
                    dateTime: selectedDate,
                    date: DateFormat('dd.MM.yyyy').format(DateTime.now()),
                    time: DateFormat('hh:mm a').format(selectedDate),
                    title: title,
                  ),
                );

                ////////////////
                final NotificationService notificationService =
                    NotificationService();
                await notificationService.scheduleNotifications(
                  id: selectedDate.millisecond,
                  title: 'Time ${DateFormat('hh:mm a').format(selectedDate)}',
                  body: title,
                  time: selectedDate,
                );
                ////////////////
                Navigator.of(context).pop();
                times = List.from(notificatonHive.values.toList());
                late String nowdateString =
                    DateFormat('dd.MM.yyyy').format(nowDate);
                times.removeWhere((e) => e.date != nowdateString);
                setState(() {});
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff00A3FF),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class TimesWidget extends StatefulWidget {
  const TimesWidget({
    super.key,
    required this.model,
  });

  final NotificationHiveModel model;

  @override
  State<TimesWidget> createState() => _TimesWidgetState();
}

class _TimesWidgetState extends State<TimesWidget> {
  late bool isCheck = widget.model.isChecked;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.model.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffF5F5F5),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 3),
                color: Colors.grey.shade300,
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.model.time,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
              ),
              Switch.adaptive(
                activeColor: const Color(0xff00A3FF),
                value: isCheck,
                onChanged: (val) async {
                  final NotificationService notificationService =
                      NotificationService();

                  setState(() {
                    isCheck = val;
                  });
                  if (isCheck) {
                    await notificationService.scheduleNotifications(
                      id: widget.model.dateTime.millisecond,
                      title:
                          'Time ${DateFormat('hh:mm a').format(widget.model.dateTime)}',
                      body: widget.model.title,
                      time: widget.model.dateTime,
                    );
                  } else {
                    notificationService.deleteNotifications(
                      id: widget.model.dateTime.millisecond,
                    );
                  }
                  widget.model.isChecked = isCheck;
                  widget.model.save();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
