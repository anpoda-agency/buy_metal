import 'package:buy_metal_app/models/user_model.dart';

class OrderModel {
  final UserModel user;
  final String id;
  final String rolled;
  final String rolledParametersRequirements;
  final String materialBrandRequirements;
  final String date;

  const OrderModel({
   this.user = const UserModel(),
   this.id = '',
   this.rolled = '',
   this.rolledParametersRequirements = '',
   this.materialBrandRequirements = '',
   this.date = '',
  });

  OrderModel copyWith({
    UserModel? user,
    String? id,
    String? rolled,
    String? rolledParametersRequirements,
    String? materialBrandRequirements,
    String? date,
  }) {
    return OrderModel(
      user: user ?? this.user,
      id: id ?? this.id,
      rolled: rolled ?? this.rolled,
      rolledParametersRequirements: rolledParametersRequirements ?? this.rolledParametersRequirements,
      materialBrandRequirements: materialBrandRequirements ?? this.materialBrandRequirements,
      date: date ?? this.date,
    );
  }
}
