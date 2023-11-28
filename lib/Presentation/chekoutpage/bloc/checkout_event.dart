part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutEvent {}

class CheckoutInitevent extends CheckoutEvent{
}

class SelectadressEvent extends CheckoutEvent{
  final int index;
  SelectadressEvent({required this.index});
}

class PaymentButtonevent extends CheckoutEvent{
  final BuildContext context;
  final int totalamount;
  PaymentButtonevent({
    required this.context,
    required this.totalamount});
} 