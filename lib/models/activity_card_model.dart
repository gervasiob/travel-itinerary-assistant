import 'package:juntoz/models/card_base_model.dart';

class ActivityCardModel extends CardBaseModel {
  final String? title;
  final String? location;
  final String? address;
  final DateTime? dateTime;
  final String? duration;
  final String? notes;
  // Contact (optional)
  final String? contactName;
  final String? contactEmail;
  final String? contactPhone;
  final String? contactWebsite;

  ActivityCardModel({
    required super.id,
    required super.tripId,
    required super.order,
    required super.createdAt,
    required super.updatedAt,
    this.title,
    this.location,
    this.address,
    this.dateTime,
    this.duration,
    this.notes,
    this.contactName,
    this.contactEmail,
    this.contactPhone,
    this.contactWebsite,
    List<String>? assignedDocumentIds,
    List<String>? assignedListIds,
  }) : super(type: CardType.activity, assignedDocumentIds: assignedDocumentIds, assignedListIds: assignedListIds);

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'tripId': tripId,
    'type': type.name,
    'order': order,
    'title': title,
    'location': location,
    'address': address,
    'dateTime': dateTime?.toIso8601String(),
    'duration': duration,
    'notes': notes,
    'contactName': contactName,
    'contactEmail': contactEmail,
    'contactPhone': contactPhone,
    'contactWebsite': contactWebsite,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'assignedDocumentIds': assignedDocumentIds,
    'assignedListIds': assignedListIds,
  };

  factory ActivityCardModel.fromJson(Map<String, dynamic> json) => ActivityCardModel(
    id: json['id'] as String,
    tripId: json['tripId'] as String,
    order: json['order'] as int,
    title: json['title'] as String?,
    location: json['location'] as String?,
    address: json['address'] as String?,
    dateTime: json['dateTime'] != null ? DateTime.parse(json['dateTime'] as String) : null,
    duration: json['duration'] as String?,
    notes: json['notes'] as String?,
    contactName: json['contactName'] as String?,
    contactEmail: json['contactEmail'] as String?,
    contactPhone: json['contactPhone'] as String?,
    contactWebsite: json['contactWebsite'] as String?,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    assignedDocumentIds: (json['assignedDocumentIds'] as List?)?.cast<String>() ?? const [],
    assignedListIds: (json['assignedListIds'] as List?)?.cast<String>() ?? const [],
  );

  @override
  ActivityCardModel copyWith({
    String? id,
    String? tripId,
    int? order,
    String? title,
    String? location,
    String? address,
    DateTime? dateTime,
    String? duration,
    String? notes,
    String? contactName,
    String? contactEmail,
    String? contactPhone,
    String? contactWebsite,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? assignedDocumentIds,
    List<String>? assignedListIds,
  }) => ActivityCardModel(
    id: id ?? this.id,
    tripId: tripId ?? this.tripId,
    order: order ?? this.order,
    title: title ?? this.title,
    location: location ?? this.location,
    address: address ?? this.address,
    dateTime: dateTime ?? this.dateTime,
    duration: duration ?? this.duration,
    notes: notes ?? this.notes,
    contactName: contactName ?? this.contactName,
    contactEmail: contactEmail ?? this.contactEmail,
    contactPhone: contactPhone ?? this.contactPhone,
    contactWebsite: contactWebsite ?? this.contactWebsite,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    assignedDocumentIds: assignedDocumentIds ?? this.assignedDocumentIds,
    assignedListIds: assignedListIds ?? this.assignedListIds,
  );
}
