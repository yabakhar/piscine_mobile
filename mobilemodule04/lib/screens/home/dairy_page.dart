import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../modelView/home_model_view.dart';

class DairyPage extends StatelessWidget {
  const DairyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeModelView>(builder: (context, model, _) {
        return TableCalendar(
          firstDay: DateTime.utc(2023, 12, 07),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            print(selectDay);
          },
        );
      }),
    );
  }
}
