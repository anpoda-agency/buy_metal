part of 'supplier_deals_bloc.dart';

abstract class SupplierDealsEvent {}

class SupplierDealsInit extends SupplierDealsEvent {}

class SupplierDealsMsgErr extends SupplierDealsEvent {
  final String msg;
  SupplierDealsMsgErr(this.msg);
}
