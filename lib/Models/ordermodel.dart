class Ordermodel{
  final String orderid;
  final String paymentid;
  final String date;
  final int totalamount;
  final List<dynamic> items;
  final String docId;

  Ordermodel({
    required this.orderid,
    required this.paymentid,
    required this.date,
    required this.items,
    required this.totalamount,
    required this.docId,
  });

}