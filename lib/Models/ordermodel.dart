class Ordermodel{
  final String orderid;
  final String paymentid;
  final String date;
  final int totalamount;
  final List<dynamic> items;

  Ordermodel({
    required this.orderid,
    required this.paymentid,
    required this.date,
    required this.items,
    required this.totalamount,
  });

}