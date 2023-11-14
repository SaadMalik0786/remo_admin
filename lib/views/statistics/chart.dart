import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/utils/utility.dart';
import 'package:renmo_admin/views/statistics/components/filters.dart';
import 'package:renmo_admin/widgets/custom_button.dart';
import 'package:renmo_admin/widgets/custom_text_field.dart';
import 'package:renmo_admin/widgets/search_field.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/constants.dart';
import '../../widgets/header.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  String? selectedOption;
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
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
  void initState() {
    data = [
      _ChartData('Jan', 30),
      _ChartData('Feb', 90),
      _ChartData('Mar', 70),
      _ChartData('Apr', 60),
      _ChartData('May', 100),
      _ChartData('Jun', 80),
      _ChartData('Jul', 25),
      _ChartData('Aug', 80),
      _ChartData('Sep', 90),
      _ChartData('Oct', 40),
      _ChartData('Nov', 60),
      _ChartData('Dec', 70),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(
              title: "Products",
            ),
            const SizedBox(height: defaultPadding),
            backWidget(context),
            SizedBox(height: defaultPadding),
            charts()
          ],
        ),
      ),
    );
  }

  Widget charts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Monthly Orders"),
        const SizedBox(height: defaultPadding),
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 110, interval: 10),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Orders',
                color: Const.kPrimary)
          ],
        ),
        Filters(),
        const SizedBox(height: defaultPadding),
        const SubHeader(title: "Orders accumulative"),

        const SizedBox(height: defaultPadding),
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 110, interval: 10),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Orders',
                color: Const.kSecondary)
          ],
        ),
        const Filters()

      ],
    );
  }





}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
