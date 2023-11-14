import 'package:flutter/material.dart';
import 'package:renmo_admin/widgets/custom_button.dart';

import '../../../models/order_model.dart';
import '../../../utils/constants.dart';



class ProductTable extends StatelessWidget {
  List recentOrders = [
    OrderModel(
      orderId: "201884",
      startPeriod: "05/06/2023",
      endPeriod: "07/06/2023",
      status: OrderStatus.progress,
      totalAmount: "123",
      title: 'Makita circular saw 5007MGA',
    ),
    OrderModel(
      orderId: "201884",
      startPeriod: "05/06/2023",
      endPeriod: "07/06/2023",
      status: OrderStatus.progress,
      totalAmount: "123",
      title: 'Makita circular saw 5007MGA',
    )
  ];

  ProductTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final rowHeight = (constraints.maxHeight - 40) / recentOrders.length;

      return SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: double.infinity,
          child: Theme(
            data: ThemeData(
              dividerColor: Const.kPrimary, // Set your desired divider color here
            ),
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              dataRowMaxHeight: rowHeight,
              dividerThickness: 1,
              headingTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Const.kBlue
              ),
              columns: const [
                DataColumn(
                  label: Text("Item details"),
                ),
                DataColumn(
                  label: Text("Category"),
                ),
                DataColumn(
                  label: Text("Stock"),
                ),
                DataColumn(
                  label: Center(child: Text("Delivery category")),
                ),
                DataColumn(
                  label: Text("Instructions"),
                ),
              ],
              rows: List.generate(
                recentOrders.length,
                    (index) => orderDataRow(recentOrders[index], context),
              ),
            ),
          ),
        ),
      );
    });
  }

  DataRow orderDataRow(OrderModel orderModel, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: productDetail(orderModel, context),
        )),
        DataCell(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    width: 200,
                    child: CustomButton(
                      title: "Tools",
                      onTap: () {},
                      backColor: Const.kSecondary,
                      titleColor: Colors.white,
                    )),
                const SizedBox(height: 8),
                SizedBox(
                    width: 200,
                    child: CustomButton(
                      title: "Saws and Cutters",
                      onTap: () {},
                      backColor: Const.kBlue,
                      titleColor: Colors.white,
                    )),
              ],
            ),
          ),
        ),
        DataCell(Text("8",style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),)),
        DataCell(Text("${orderModel.totalAmount} €",style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),)),
        DataCell(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    width: 200,
                    child: CustomButton(
                      title: "View",
                      onTap: () {},
                      backColor: Const.kSecondary,
                      titleColor: Colors.white,
                    )),
                const SizedBox(height: 8),
                SizedBox(
                    width: 200,
                    child: CustomButton(
                      title: "Edit",
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

  Widget productDetail(OrderModel orderModel, BuildContext context) {
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderModel.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),

            const Text("(2 Rented out / 6 Available)")
          ],
        )
      ],
    );
  }
}
