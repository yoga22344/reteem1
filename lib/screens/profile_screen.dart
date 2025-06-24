import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 14, color: AppColors.textLight),
            ),
            const SizedBox(height: 32),
            _buildProfileItem(Icons.person, 'Edit Profil'),
            _buildProfileItem(Icons.history, 'Riwayat Donasi'),
            _buildProfileItem(Icons.notifications, 'Notifikasi'),
            _buildProfileItem(Icons.security, 'Keamanan'),
            _buildProfileItem(Icons.help, 'Bantuan'),
            _buildProfileItem(Icons.description, 'Syarat & Ketentuan'),
            _buildProfileItem(Icons.logout, 'Keluar', isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.red : AppColors.primary),
        title: Text(
          title,
          style: TextStyle(color: isLogout ? Colors.red : AppColors.textDark),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Handle tap
        },
      ),
    );
  }
}
