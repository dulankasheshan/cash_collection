import 'package:cash_collection/screens/home_dashbord_screen/layout/search_section.dart';
import 'package:provider/provider.dart';
import 'package:cash_collection/screens/home_dashbord_screen/layout/collected_user_list_section.dart';
import 'package:cash_collection/screens/home_dashbord_screen/layout/custom_app_bar.dart';
import 'package:cash_collection/screens/home_dashbord_screen/layout/daily_collection_display_section.dart';
import '../../config.dart';

class HomeDashbordScreen extends StatefulWidget {
  const HomeDashbordScreen({super.key});

  @override
  State<HomeDashbordScreen> createState() => _HomeDashbordScreenState();
}

class _HomeDashbordScreenState extends State<HomeDashbordScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.primary,
        body: const Column(
          children: [
            CustomAppBar(),
            DailyCollectionDisplaySection(),
            SearchSection(),
            Expanded(child: CollectedUserListSection()),
          ],
        ),
      ),
    );
  }
}
