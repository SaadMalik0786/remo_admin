import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/utility.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  DateTime fromDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<String> monthFilters = [
    "This week",
    "Last week",
    "This month",
    "Last month",
    "This year"
  ];
  int selectedMonthlyFilter = 3;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: defaultPadding,
      runSpacing: defaultPadding,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("From"),
            const SizedBox(width: defaultPadding),
            dateContainer(
                selectedDate: fromDate,
                onUpdateDate: (date) {
                  setState(() {
                    fromDate = date!;
                  });
                })
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("To"),
            const SizedBox(width: defaultPadding),
            dateContainer(
                selectedDate: endDate,
                onUpdateDate: (date) {
                  setState(() {
                    endDate = date!;
                  });
                })
          ],
        ),
        ...List.generate(
          monthFilters.length,
              (index) => GestureDetector(
            onTap: () {
              selectedMonthlyFilter = index;
              setState(() {});
            },
            child: monthFilterContainer(
                monthFilters[index], selectedMonthlyFilter == index),
          ),
        )
      ],
    );

  }

  Widget dateContainer({
    required DateTime selectedDate,
    required Function(DateTime?) onUpdateDate,
  }) {
    return GestureDetector(
      onTap: () async {
        final result = await selectDate(context, selectedDate);
        onUpdateDate(result);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Const.kSecondary)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatDate(selectedDate)),
            const SizedBox(width: defaultPadding),
            const Icon(
              Icons.calendar_month,
              color: Const.kPrimary,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
  Widget monthFilterContainer(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? Const.kPrimary : Const.kGray),
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }

}
