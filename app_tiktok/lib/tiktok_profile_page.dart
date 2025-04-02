import 'package:flutter/material.dart';
import 'package:app_tiktok/enity/auth/user.dart';
import 'package:app_tiktok/Ultis/login_service.dart';

class TikTokProfilePage extends StatefulWidget {
  final String accessToken; // Add access token to be passed in the constructor

  const TikTokProfilePage({super.key, required this.accessToken});

  @override
  State<TikTokProfilePage> createState() => _TikTokProfilePageState();
}

class _TikTokProfilePageState extends State<TikTokProfilePage> {
  late Future<User?> _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = LoginService.getCurrentUser(
        widget.accessToken); // Fetch user data with access token
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<User?>(
              future: _profileData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final profile = snapshot.data!;
                  return Text("@${profile.firstName + profile.lastName}");
                } else {
                  return const Center(child: Text('No data available.'));
                }
              },
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => myBottomSheet(context),
                );
              },
              icon: const Icon(Icons.menu, color: Colors.black),
            )
          ],
        ),
      ),
      body: FutureBuilder<User?>(
        future: _profileData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final profile = snapshot.data!;
            return Column(
              children: [
                _buildProfileHeader(profile),
                const SizedBox(height: 20),
                _buildStatsSection(profile),
                const SizedBox(height: 10),
                _buildActionsSection(),
                const Divider(thickness: 1),
                Expanded(child: _buildRecentActivitySection()),
                const Divider(thickness: 1),
              ],
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }

  Widget myBottomSheet(BuildContext context) {
    return Wrap(
      children: [
        BottomSheet(
          builder: (context) => listPage(context),
          onClosing: () {},
          enableDrag: false,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }

  Widget listPage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          itemPage(context, Icons.star, "/tiktok_studio", "TikTok Studio"),
          itemPage(context, Icons.account_balance_wallet, "/balance", "Số dư"),
          itemPage(context, Icons.qr_code, "/my_qr", "Mã QR của tôi"),
          itemPage(context, Icons.settings, "/settings_privacy",
              "Cài đặt và quyền riêng tư"),
        ],
      ),
    );
  }

  Widget itemPage(
      BuildContext context, IconData icon, String route, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        color: Colors.white, // Đặt nền trắng
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: Colors.black), // Icon màu đen
              title: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Văn bản màu đen
                ),
              ),
              trailing: const SizedBox.shrink(), // Không hiển thị icon trailing
            ),
            const Divider(
                thickness: 1, color: Colors.grey), // Đường kẻ ngang màu xám
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(User profile) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profile.image),
            ),
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          profile.firstName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildStatsSection(User profile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatItem(profile.following, "Đã follow"),
        const SizedBox(width: 20),
        _buildStatItem(profile.followers, "Follower"),
        const SizedBox(width: 20),
        _buildStatItem(profile.likes, "Thích"),
      ],
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        const Text(
          "0",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActionsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildActionButton("Sửa hồ sơ", Icons.edit, const Key("editProfile")),
          const SizedBox(width: 10),
          _buildActionButton(
              "Chia sẻ hồ sơ", Icons.share, const Key("shareProfile")),
          const SizedBox(width: 10),
          _buildActionButton("Theo dõi", Icons.person_add, const Key("follow")),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, Key key) {
    return ElevatedButton.icon(
      key: key,
      onPressed: () {},
      icon: Icon(icon, color: Colors.black, size: 18),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  Widget _buildRecentActivitySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
            "Chia sẻ một video thú vị bạn mới quay gần đây",
            style: TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text(
              "Tải lên",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
