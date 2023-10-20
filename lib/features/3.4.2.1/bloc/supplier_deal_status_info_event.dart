part of 'supplier_deal_status_info_bloc.dart';

abstract class SupplierDealStatusInfoEvent {}

class SupplierDealStatusInfoInit extends SupplierDealStatusInfoEvent {}

class SupplierDealStatusInfoMsgErr extends SupplierDealStatusInfoEvent {
  final String msg;
  SupplierDealStatusInfoMsgErr(this.msg);
}

class SupplierDealStatusInfoOpenSupplierContactsInfoEvent extends SupplierDealStatusInfoEvent {}

class SupplierDealStatusInfoOpenSupplierProposalInfoEvent extends SupplierDealStatusInfoEvent {}
