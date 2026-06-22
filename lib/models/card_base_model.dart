enum CardType {
  flight,
  train,
  hotel,
  activity,
  freeNote;

  String get displayName {
    switch (this) {
      case CardType.flight:
        return 'Vuelo';
      case CardType.train:
        return 'Tren';
      case CardType.hotel:
        return 'Hotel';
      case CardType.activity:
        return 'Actividad';
      case CardType.freeNote:
        return 'Nota Libre';
    }
  }
}

abstract class CardBaseModel {
  final String id;
  final String tripId;
  final CardType type;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;
  // Attachments/relations
  final List<String> assignedDocumentIds;
  final List<String> assignedListIds;

  CardBaseModel({
    required this.id,
    required this.tripId,
    required this.type,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
    List<String>? assignedDocumentIds,
    List<String>? assignedListIds,
  })  : assignedDocumentIds = assignedDocumentIds ?? const [],
        assignedListIds = assignedListIds ?? const [];

  Map<String, dynamic> toJson();
  CardBaseModel copyWith({int? order});
}
