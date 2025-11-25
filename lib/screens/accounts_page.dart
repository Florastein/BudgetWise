import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  String? groupValue;

  final List<Map<String, dynamic>> accountTypes = [
    {
      'title': 'Bank Account',
      'subtitle': 'Link your bank account for automatic tracking',
      'icon': Icons.account_balance,
      'value': 'bank',
    },
    {
      'title': 'Mobile Money',
      'subtitle': 'Connect your mobile money account',
      'icon': Icons.phone_android,
      'value': 'mobile_money',
    },
    {
      'title': 'Cash',
      'subtitle': 'Track your cash transactions manually',
      'icon': Icons.payments_outlined,
      'value': 'cash',
    },
  ];

  void _onContinue() {
    if (groupValue != null) {
      // Handle the selected account type
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected: $groupValue'),
          backgroundColor: Colors.deepPurple,
        ),
      );
      // Add your navigation logic here
      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Header
              Text(
                textAlign: TextAlign.center,
                "Budget Wise",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                "Smart Finance Management",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Select an account to link",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 24),
              // Account options
              Expanded(
                child: ListView.builder(
                  itemCount: accountTypes.length,
                  itemBuilder: (context, index) {
                    final account = accountTypes[index];
                    final isSelected = groupValue == account['value'];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            groupValue = account['value'];
                          });
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.deepPurple.withOpacity(0.05)
                                : Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.deepPurple
                                  : Colors.grey.shade300,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Icon
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.deepPurple
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  account['icon'],
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Text content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      account['title'],
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade900,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      account['subtitle'],
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Radio button
                              Radio<String>(
                                value: account['value'],
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value;
                                  });
                                },
                                activeColor: Colors.deepPurple,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Continue button
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: groupValue != null ? _onContinue : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      disabledBackgroundColor: Colors.grey.shade300,
                      padding: const EdgeInsets.all(18.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: groupValue != null ? 4 : 0,
                      shadowColor: Colors.deepPurple.withOpacity(0.3),
                    ),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: groupValue != null
                            ? Colors.white
                            : Colors.grey.shade500,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
