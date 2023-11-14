enum OrderStatus { progress,completed }
class OrderModel {
  final String orderId;
  final String title;
  final String startPeriod;
  final String endPeriod;
  final OrderStatus status;
  final String totalAmount;

  OrderModel({
    required this.orderId,
    required this.title,
    required this.startPeriod,
    required this.endPeriod,
    required this.status,
    required this.totalAmount,
  });
}
