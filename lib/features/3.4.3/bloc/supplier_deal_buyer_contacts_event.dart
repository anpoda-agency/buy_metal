part of 'supplier_deal_buyer_contacts_bloc.dart';

abstract class SupplierDealBuyerContactsEvent {}

class SupplierDealBuyerContactsInit extends SupplierDealBuyerContactsEvent {}

class SupplierDealBuyerContactsMsgErr extends SupplierDealBuyerContactsEvent {
  final String msg;
  SupplierDealBuyerContactsMsgErr(this.msg);
}
