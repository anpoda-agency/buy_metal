part of 'buyer_deal_supplier_contacts_bloc.dart';

abstract class BuyerDealSupplierContactsEvent {}

class BuyerDealSupplierContactsInit extends BuyerDealSupplierContactsEvent {}

class BuyerDealSupplierContactsMsgErr extends BuyerDealSupplierContactsEvent {
  final String msg;
  BuyerDealSupplierContactsMsgErr(this.msg);
}
