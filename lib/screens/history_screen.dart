import 'package:flutter/material.dart';
import '../models/donation.dart';
import '../utils/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  final List<Donation> donations = [
    Donation(
      id: '1',
      donationCenter: 'Our Home',
      address: 'JL. Merdeka No.9',
      pickupDate: DateTime(2023, 5, 15),
      pickupTime: const TimeOfDay(hour: 10, minute: 0),
      items: [
        DonationItem(name: 'Baju', description: 'Kondisi baik', quantity: 5),
        DonationItem(
          name: 'Buku',
          description: 'Masih layak baca',
          quantity: 10,
        ),
      ],
      status: 'Completed',
    ),
    Donation(
      id: '2',
      donationCenter: 'Live Love',
      address: 'JL. Sudirman No.123',
      pickupDate: DateTime(2023, 4, 20),
      pickupTime: const TimeOfDay(hour: 14, minute: 30),
      items: [
        DonationItem(name: 'Sepatu', description: 'Masih bagus', quantity: 2),
      ],
      status: 'Completed',
    ),
  ];

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Donasi')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: donations.length,
        itemBuilder: (context, index) {
          final donation = donations[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        donation.donationCenter,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          donation.status,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${donation.items.length} barang',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${donation.pickupDate.day}/${donation.pickupDate.month}/${donation.pickupDate.year}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          // Show donation details
                        },
                        child: const Text(
                          'Lihat Detail',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
