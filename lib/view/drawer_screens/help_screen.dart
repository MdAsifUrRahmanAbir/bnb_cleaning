import 'package:bnb_clean/backend/services/api_endpoint.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/strings.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(
          title: Strings.helpCenter,
        ),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeHorizontal,
            vertical: Dimensions.paddingSizeVertical,
          ),
          children: [
            const TitleHeading2Widget(text: " For anything you may need"),
            verticalSpace(5),
            const SelectableText(
                "send us an email to contact@bnbcleaning.london"),
            verticalSpace(15),
            Image.network(
                "${ApiEndpoint.mainDomain}/assets/images/help.png")
          ],
        )));
  }
}
