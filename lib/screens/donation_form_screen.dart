import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/donation.dart';
import '../screens/donation_tracking_screen.dart';
import '../utils/app_colors.dart';
import '../widgets/donation_item_card.dart';

class DonationFormScreen extends StatefulWidget {
  const DonationFormScreen({super.key});

  @override
  State<DonationFormScreen> createState() => _DonationFormScreenState();
}

class _DonationFormScreenState extends State<DonationFormScreen> {
  String? _selectedDonationCenter;
  final _addressController = TextEditingController(text: 'JL. Merdeka No.9');
  DateTime? _pickupDate;
  TimeOfDay? _pickupTime;
  final List<DonationItem> _items = [
    DonationItem(name: 'Baju', description: 'Kondisi baik', quantity: 5),
    DonationItem(name: 'Buku', description: 'Masih layak baca', quantity: 10),
  ];

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      setState(() {
        _pickupDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _pickupTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Format Donasi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TEMPAT DONASI',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedDonationCenter,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.divider),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              hint: const Text('Pilih tempat donasi'),
              items:
                  ['Our Home', 'Live Love', '80s', 'kiddos', 'We care']
                      .map(
                        (center) => DropdownMenuItem(
                          value: center,
                          child: Text(center),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDonationCenter = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Harap pilih tempat donasi';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'ALAMAT PENJEMPUTAN',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.divider),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TANGGAL',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: _selectDate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.divider),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _pickupDate == null
                                    ? 'Pilih tanggal'
                                    : DateFormat(
                                      'dd MMMM yyyy',
                                    ).format(_pickupDate!),
                                style: TextStyle(
                                  color:
                                      _pickupDate == null
                                          ? AppColors.textLight
                                          : AppColors.textDark,
                                ),
                              ),
                              const Icon(
                                Icons.calendar_today,
                                size: 20,
                                color: AppColors.textLight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'JAM',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: _selectTime,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.divider),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _pickupTime == null
                                    ? 'Pilih jam'
                                    : _pickupTime!.format(context),
                                style: TextStyle(
                                  color:
                                      _pickupTime == null
                                          ? AppColors.textLight
                                          : AppColors.textDark,
                                ),
                              ),
                              const Icon(
                                Icons.access_time,
                                size: 20,
                                color: AppColors.textLight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'ITEM DONASI',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            ..._items.map((item) => DonationItemCard(item: item)),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {
                // Add new item
              },
              icon: const Icon(Icons.add, color: AppColors.primary),
              label: const Text(
                'Tambah Item',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedDonationCenter != null &&
                      _pickupDate != null &&
                      _pickupTime != null) {
                    final donation = Donation(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      donationCenter: _selectedDonationCenter!,
                      address: _addressController.text,
                      pickupDate: _pickupDate!,
                      pickupTime: _pickupTime!,
                      items: _items,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                DonationTrackingScreen(donation: donation),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Harap lengkapi semua data'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'MULAI DONASI',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
