import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/theme/size_class.dart';
import '../../../config.dart';
import '../../../providers/home_page_provider.dart';
import '../../../widgets/common_text.dart';
import '../../customer_search_screen/customer_search_screen.dart';

class CollectedUserListSection extends StatefulWidget {
  const CollectedUserListSection({super.key});

  @override
  State<CollectedUserListSection> createState() => _CollectedUserListSectionState();
}

class _CollectedUserListSectionState extends State<CollectedUserListSection> {
  @override
  Widget build(BuildContext context) {
    final collectedUsers = context.watch<HomePageProvider>().collectedUsers;
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Detect swipe direction
        if (details.primaryVelocity! < 0) {
          // Swiped from right to left navigate CustomerSearchScreen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CustomerSearchScreen(),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: appTheme.screenBg,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              if (collectedUsers.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeClass.getWidth(0.05),
                    vertical: SizeClass.getWidth(0.05),
                  ),
                  child: CommonText(
                    text: 'Recent Collection',
                    fontWeight: FontWeight.bold,
                    textColor: appTheme.darkText,
                    fontSize: SizeClass.getWidth(0.05),
                    textAlign: TextAlign.left,
                  ),
                ),

              // Display users or message if no users
              collectedUsers.isEmpty
                  ? Padding(
                padding: EdgeInsets.symmetric(vertical: SizeClass.getWidth(0.3)),
                child: const Center(child: Text('No users found')),
              )
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Disable internal scrolling
                itemCount: collectedUsers.length,
                itemBuilder: (context, index) {
                  final user = collectedUsers[index];
                  return ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: CircleAvatar(
                        backgroundColor: appTheme.lightBGColor,
                        child: user['image'] != null
                            ? ClipOval(
                          child: Image.network(
                            user['image']!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: CommonText(
                                  text: user['name']![0],
                                  textColor: appTheme.lightText,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        )
                            : Center(
                          child: CommonText(
                            text: user['name']![0],
                            textColor: appTheme.lightText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: user['name']!,
                        textColor: appTheme.darkText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: user['amount']!,
                        textColor: appTheme.darkText,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
