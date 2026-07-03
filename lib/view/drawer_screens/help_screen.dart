import 'package:bnb_clean/backend/services/api_endpoint.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/strings.dart';

class HelpScreen extends StatelessWidget {
   HelpScreen({super.key});

  // Example dynamic data (can be replaced by data fetched from an API)
  final ContactInfo contactData =  ContactInfo(
    address: '63 Loveridge rd, London, NW6 2DR',
    email: 'contact@bnbcleaning.london',
    phone: '02034883538',
    whatsapp: '07919617334', // Including country code might be better for real-world use (+44...)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeHorizontal,
            vertical: Dimensions.paddingSizeVertical,
          ),
          children: [

            const Text(
              'Contact Information:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263238), // Dark color for contrast
              ),
            ),
            const Divider(height: 30, thickness: 1.5, color: Colors.tealAccent),

            // Address Tile
            _ContactTile(
              icon: Icons.location_on_outlined,
              title: contactData.address,
              onTap: () => _launchMap(contactData.address),
              color: Colors.blueAccent,
            ),

            // Email Tile
            _ContactTile(
              icon: Icons.email_outlined,
              title: contactData.email,
              onTap: () => _launchEmail(contactData.email),
              color: Colors.redAccent,
            ),

            // Phone Tile
            _ContactTile(
              icon: Icons.phone_outlined,
              title: 'Call Us: ${contactData.phone}',
              onTap: () => _launchCaller(contactData.phone),
              color: Colors.green,
            ),

            // WhatsApp Tile
            _ContactTile(
              icon: Icons.call, // Requires the material icons to be available
              title: 'WhatsApp Us: ${contactData.whatsapp}',
              onTap: () => _launchWhatsApp(contactData.whatsapp),
              color: Colors.teal,
            ),

            const SizedBox(height: 40),
            // Optional: Add more details like business hours or a contact form link

            Image.network(
                "${ApiEndpoint.mainDomain}/assets/images/help.png")
          ],
        )));
  }


  // --- 3. Intent Launchers (using url_launcher logic) ---

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      // In a real app, you would show a Snackbar or Dialog here.
      // ignore: avoid_print
      print('Could not launch $url');
    }
  }

  void _launchMap(String address) {
    // URL-encode the address for the map
    final String encodedAddress = Uri.encodeComponent(address);
    final Uri url = Uri.parse('https://maps.google.com/?q=$encodedAddress');
    _launchUrl(url);
  }

  void _launchEmail(String email) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=General Inquiry&body=Dear BNB Cleaning,',
    );
    _launchUrl(emailLaunchUri);
  }

  void _launchCaller(String phoneNumber) {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    _launchUrl(phoneLaunchUri);
  }

  void _launchWhatsApp(String whatsappNumber) {
    // Note: In a real app, you might need a platform-specific package or
    // use a full country code prefix (e.g., +447919617334).
    final Uri whatsappUrl = Uri.parse('whatsapp://send?phone=$whatsappNumber');
    _launchUrl(whatsappUrl);
  }
}

// --- 4. Reusable Contact Tile Widget ---

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;

  const _ContactTile({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: color,
                size: 28,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: color.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ContactInfo {
  final String address;
  final String email;
  final String phone;
  final String whatsapp;

  ContactInfo({
    required this.address,
    required this.email,
    required this.phone,
    required this.whatsapp,
  });
}