part of 'description_of_buyer_order_bloc.dart';

abstract class DescriptionOfBuyerOrderEvent {}

class DescriptionOfBuyerOrderInit extends DescriptionOfBuyerOrderEvent {}

class DescriptionOfBuyerOrderMsgErr extends DescriptionOfBuyerOrderEvent {
  final String msg;
  DescriptionOfBuyerOrderMsgErr(this.msg);
}
