import 'package:json_annotation/json_annotation.dart';
import 'package:we_ship_faas/data/models/manage_pick_up_request_meta/area.dart';
import 'package:we_ship_faas/data/models/manage_pick_up_request_meta/day.dart';

part 'create_delivery_request.g.dart';

@JsonSerializable()
class CreateDeliveryRequest {
  final String name;
  final String phone;
  @JsonKey(name: 'req_date')
  final String reqDate;
  @JsonKey(name: 'req_time')
  final String reqTime;
  @JsonKey(name: 'no_of_packages')
  final String noOfPackages;
  @JsonKey(name: 'package_ids')
  final String packageIds;
  @JsonKey(name: 'package_total')
  final String packageTotal;
  final String notes;
  final String address;
  final String day;
  @JsonKey(name: 'area_id')
  final String areaId;
  final String cost;

  const CreateDeliveryRequest({
    required this.name,
    required this.phone,
    required this.reqDate,
    required this.reqTime,
    required this.noOfPackages,
    required this.packageIds,
    required this.packageTotal,
    required this.notes,
    required this.address,
    required this.day,
    required this.areaId,
    required this.cost,
  });

  @override
  String toString() {
    return 'CreateDeliveryRequest(name: $name, phone: $phone, reqDate: $reqDate, reqTime: $reqTime, noOfPackages: $noOfPackages, packageIds: $packageIds, packageTotal: $packageTotal, notes: $notes, address: $address, day: $day, areaId: $areaId, cost: $cost)';
  }

  factory CreateDeliveryRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateDeliveryRequestFromJson(json);
  }

  factory CreateDeliveryRequest.fromMap(Map<String, dynamic> json) {
    return CreateDeliveryRequest(
      address: json['address'] ?? '',
      areaId: json['select_area'] is Area
          ? json['select_area'].id.toString()
          : json['select_area'] ?? '',
      cost: json['delivery_coast'] ?? '',
      day: json['select_day'] is Day
          ? json['select_day'].id.toString()
          : json['select_day'] ?? '',
      name: json['name'] ?? '',
      notes: json['notes'] ?? '',
      noOfPackages: '',
      packageIds: '',
      packageTotal: '',
      phone: json['contact'] ?? '',
      reqDate: "2023-11-10",
      reqTime: '05:10',
    );
  }

  Map<String, dynamic> toJson() => _$CreateDeliveryRequestToJson(this);

  CreateDeliveryRequest copyWith({
    String? name,
    String? phone,
    String? reqDate,
    String? reqTime,
    String? noOfPackages,
    String? packageIds,
    String? packageTotal,
    String? notes,
    String? address,
    String? day,
    String? areaId,
    String? cost,
  }) {
    return CreateDeliveryRequest(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      reqDate: reqDate ?? this.reqDate,
      reqTime: reqTime ?? this.reqTime,
      noOfPackages: noOfPackages ?? this.noOfPackages,
      packageIds: packageIds ?? this.packageIds,
      packageTotal: packageTotal ?? this.packageTotal,
      notes: notes ?? this.notes,
      address: address ?? this.address,
      day: day ?? this.day,
      areaId: areaId ?? this.areaId,
      cost: cost ?? this.cost,
    );
  }
}
