import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../model/entrie.dart';
import '../../modelView/home_model_view.dart';
import '../../widgets/list_entries.dart';

class DairyPage extends StatelessWidget {
  const DairyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeModelView>(builder: (context, model, _) {
        return Column(
          children: [
            TableCalendar(
              onFormatChanged: (format) {},
              firstDay: DateTime.utc(2023, 11, 07),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: model.selectDay,
              selectedDayPredicate: (day) {
                return isSameDay(model.selectDay, day);
              },
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                model.getDairybyDate(date: selectDay);
                model.selectDay = selectDay;
              },
            ),
            Expanded(
              child: (model.homeDateStatus == HomeDateStatus.loading ||
                      model.homeDateStatus == HomeDateStatus.failure)
                  ? const Center(child: CircularProgressIndicator())
                  : checkIsnotEmpty(entries: model.entriesFiltred),
            ),
          ],
        );
      }),
    );
  }
}

Widget checkIsnotEmpty({required List<Entrie> entries}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: (entries.isEmpty)
        ? const Text(
            "No Dairy Entries",
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple,
            ),
          )
        : ListEntries(entries: entries),
  );
}
