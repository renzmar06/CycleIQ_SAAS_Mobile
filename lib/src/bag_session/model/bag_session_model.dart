import 'bag_session_item_model.dart';
import 'customer_model.dart';

class BagSessionModel {
  final String id;
  final CustomerModel customer;
  final List<BagSessionItem> bags;
  final DateTime createdAt;
  final DateTime updatedAt;

  BagSessionModel({
    required this.id,
    required this.customer,
    required this.bags,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BagSessionModel.fromJson(Map<String, dynamic> json) {
    return BagSessionModel(
      id: json["_id"],
      customer: CustomerModel.fromJson(json["customerId"]),
      bags: (json["bags"] as List)
          .map((b) => BagSessionItem.fromJson(b))
          .toList(),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
