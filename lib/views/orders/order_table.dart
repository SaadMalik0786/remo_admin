import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/responsive.dart';
import 'package:renmo_admin/widgets/custom_button.dart';

import '../../models/order_model.dart';
import '../../utils/constants.dart';

class OrderTable extends StatelessWidget {
  List recentOrders = [
    OrderModel(
      orderId: "201884",
      startPeriod: "05/06/2023",
      endPeriod: "07/06/2023",
      status: OrderStatus.progress,
      totalAmount: "123",
      title: 'Makita circular saw 5007MGA',
    )
  ];

  OrderTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final rowHeight = (constraints.maxHeight - 40) / recentOrders.length;

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Theme(
          data: ThemeData(
            dividerColor: Const.kPrimary, // Set your desired divider color here
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: Responsive.isDesktop(context)
                    ? constraints.maxWidth
                    : null, // Set the width to the screen width

                child: DataTable(
                  horizontalMargin: 0,
                  columnSpacing: defaultPadding,
                  dataRowMaxHeight: rowHeight,
                  dividerThickness: 1,
                  headingTextStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Const.kBlue),
                  columns: const [
                    DataColumn(
                      label: Text("Order Details"),
                    ),
                    DataColumn(
                      label: Text("Rental Period"),
                    ),
                    DataColumn(
                      label: Text("Status"),
                    ),
                    DataColumn(
                      label: Center(child: Text("Order Total")),
                    ),
                    DataColumn(
                      label: Text("Documents"),
                    ),
                  ],
                  rows: List.generate(
                    recentOrders.length,
                    (index) => orderDataRow(recentOrders[index], context),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  DataRow orderDataRow(OrderModel orderModel, BuildContext context) {
    return DataRow(

      cells: [
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: orderDetail(orderModel, context),
          ),
          onTap: (){
            GoRouter.of(context).go(Routes.orderDetails);

          }
        ),
        DataCell(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              orderModel.startPeriod,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "-",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              orderModel.endPeriod,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        )),
        DataCell(Text(
          orderModel.status.name,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        )),
        DataCell(Text(
          "${orderModel.totalAmount} €",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        )),
        DataCell(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    width: 200,
                    child: CustomButton(
                      title: "Invoice",
                      onTap: () {},
                      backColor: Const.kSecondary,
                      titleColor: Colors.white,
                    )),
                const SizedBox(height: 8),
                SizedBox(
                    width: 200,
                    child: CustomButton(
                      title: "Contract",
                      onTap: () {},
                      backColor: Const.kPrimary,
                      titleColor: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget orderDetail(OrderModel orderModel, BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 80,
            width: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Const.product,
                  height: 80,
                  width: 100,
                  fit: BoxFit.cover,
                ))),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderModel.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Order number ${orderModel.orderId}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Const.kPrimary, fontWeight: FontWeight.bold),
              ),
              const Text("05/06/2023 17:22")
            ],
          ),
        )
      ],
    );
  }
}
