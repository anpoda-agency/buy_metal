part of 'create_order_bloc.dart';

abstract class CreateOrderEvent {}

class CreateOrderInit extends CreateOrderEvent {}

class CreateOrderMsgErr extends CreateOrderEvent {
  final String msg;
  CreateOrderMsgErr(this.msg);
}

class CreateOrderInputRolledForm extends CreateOrderEvent {
  final TypeListEnum value;
  CreateOrderInputRolledForm(this.value);
}

class CreateOrderInputRolledType extends CreateOrderEvent {
  final String value;
  CreateOrderInputRolledType(this.value);
}

class CreateOrderInputRolledSize extends CreateOrderEvent {
  final String value;
  CreateOrderInputRolledSize(this.value);
}

class CreateOrderInputRolledParams extends CreateOrderEvent {
  final String value;
  CreateOrderInputRolledParams(this.value);
}

class CreateOrderInputRolledGost extends CreateOrderEvent {
  final String value;
  CreateOrderInputRolledGost(this.value);
}

class CreateOrderInputMaterialBrand extends CreateOrderEvent {
  final String value;
  CreateOrderInputMaterialBrand(this.value);
}

class CreateOrderInputMaterialParams extends CreateOrderEvent {
  final String value;
  CreateOrderInputMaterialParams(this.value);
}

class CreateOrderInputMaterialGost extends CreateOrderEvent {
  final String value;
  CreateOrderInputMaterialGost(this.value);
}

class CreateOrderInputAmount extends CreateOrderEvent {
  final int value;
  CreateOrderInputAmount(this.value);
}

class CreateOrderSend extends CreateOrderEvent {}

class CreateOrderSetOrderTime extends CreateOrderEvent {
  final String value;
  CreateOrderSetOrderTime(this.value);
}
