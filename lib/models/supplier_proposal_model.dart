import 'package:buy_metal_app/models/user_model.dart';

class SupplierProposalModel {
  final UserModel user;
  final bool isSimilar;
  final bool isCompliance;
  final String rolled;
  final String rolledParametersRequirements;
  final String materialBrandRequirements;
  final double pricePerKg;
  final bool isVAT; // Value Added Tax
  final bool isAvailable;
  // если isAvailable = false, то 
  final String receiptWarehouseDate;

  const SupplierProposalModel({
    this.user = const UserModel(),
    this.isSimilar = false,
    this.isCompliance = false,
    this.rolled = '',
    this.rolledParametersRequirements = '',
    this.materialBrandRequirements = '',
    this.pricePerKg = 0, 
    this.isVAT = false,
    this.isAvailable = false,

    this.receiptWarehouseDate = '',
  });

  SupplierProposalModel copyWith({
    UserModel? user,
    bool? isSimilar,
    bool? isCompliance,
    String? rolled,
    String? rolledParametersRequirements,
    String? materialBrandRequirements,
    double? pricePerKg,
    bool? isVAT,
    bool? isAvailable,
    String? receiptWarehouseDate,
  }) {
    return SupplierProposalModel(
      user: user ?? this.user,
      isSimilar: isSimilar ?? this.isSimilar,
      isCompliance: isCompliance ?? this.isCompliance,
      rolled: rolled ?? this.rolled,
      rolledParametersRequirements: rolledParametersRequirements ?? this.rolledParametersRequirements,
      materialBrandRequirements: materialBrandRequirements ?? this.materialBrandRequirements,
      pricePerKg: pricePerKg ?? this.pricePerKg,
      isVAT: isVAT ?? this.isVAT,
      isAvailable: isAvailable ?? this.isAvailable,
      receiptWarehouseDate: receiptWarehouseDate ?? this.receiptWarehouseDate,
    );
  }
}
