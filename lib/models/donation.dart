import 'package:flutter/material.dart';

class Donation {
  final String id;
  final String donationCenter;
  final String address;
  final DateTime pickupDate;
  final TimeOfDay pickupTime;
  final List<DonationItem> items;
  final String status;

  Donation({
    required this.id,
    required this.donationCenter,
    required this.address,
    required this.pickupDate,
    required this.pickupTime,
    required this.items,
    this.status = 'Processing',
  }) {
    // Validation
    if (id.isEmpty) throw ArgumentError('ID cannot be empty');
    if (donationCenter.isEmpty) {
      throw ArgumentError('Donation center cannot be empty');
    }
    if (address.isEmpty) throw ArgumentError('Address cannot be empty');
    if (items.isEmpty) throw ArgumentError('Items list cannot be empty');
  }

  // Convert to Map for Firestore/API
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'donationCenter': donationCenter,
      'address': address,
      'pickupDate': pickupDate.toIso8601String(),
      'pickupTime': {'hour': pickupTime.hour, 'minute': pickupTime.minute},
      'items': items.map((item) => item.toMap()).toList(),
      'status': status,
    };
  }

  // Create from Map (for Firestore/API)
  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      id: map['id'] as String,
      donationCenter: map['donationCenter'] as String,
      address: map['address'] as String,
      pickupDate: DateTime.parse(map['pickupDate'] as String),
      pickupTime: TimeOfDay(
        hour: (map['pickupTime'] as Map)['hour'] as int,
        minute: (map['pickupTime'] as Map)['minute'] as int,
      ),
      items:
          (map['items'] as List)
              .map((item) => DonationItem.fromMap(item as Map<String, dynamic>))
              .toList(),
      status: map['status'] as String? ?? 'Processing',
    );
  }

  // Copy with method for immutability
  Donation copyWith({
    String? id,
    String? donationCenter,
    String? address,
    DateTime? pickupDate,
    TimeOfDay? pickupTime,
    List<DonationItem>? items,
    String? status,
  }) {
    return Donation(
      id: id ?? this.id,
      donationCenter: donationCenter ?? this.donationCenter,
      address: address ?? this.address,
      pickupDate: pickupDate ?? this.pickupDate,
      pickupTime: pickupTime ?? this.pickupTime,
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }
}

class DonationItem {
  final String name;
  final String description;
  final int quantity;

  DonationItem({
    required this.name,
    required this.description,
    required this.quantity,
  }) {
    // Validation
    if (name.isEmpty) throw ArgumentError('Item name cannot be empty');
    if (quantity <= 0) throw ArgumentError('Quantity must be positive');
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {'name': name, 'description': description, 'quantity': quantity};
  }

  // Create from Map
  factory DonationItem.fromMap(Map<String, dynamic> map) {
    return DonationItem(
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
    );
  }

  // Copy with method
  DonationItem copyWith({String? name, String? description, int? quantity}) {
    return DonationItem(
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }
}
