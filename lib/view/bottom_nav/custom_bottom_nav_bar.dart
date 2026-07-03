import '../../utils/basic_widget_imports.dart';
import 'bottom_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      color: CustomColor.secondaryLightColor,
      padding: EdgeInsets.zero,
      child: Container(
        height: 60.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.2),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomNavItem(
              icon: Icons.leaderboard_outlined,
              isSelected: selectedIndex == 0,
              onTap: () => onItemTapped(0),
            ),
            BottomNavItem(
              icon: Icons.currency_pound_sharp,
              isSelected: selectedIndex == 1,
              onTap: () => onItemTapped(1),
            ),
            const SizedBox(width: 80.0), // Space for the floating action button
            BottomNavItem(
              icon: Icons.shopping_cart_outlined,
              isSelected: selectedIndex == 2,
              onTap: () => onItemTapped(2),
            ),
            BottomNavItem(
              icon: Icons.help_outline,
              isSelected: selectedIndex == 3,
              onTap: () => onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}