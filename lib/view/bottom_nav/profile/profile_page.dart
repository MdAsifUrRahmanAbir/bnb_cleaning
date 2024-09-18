import 'package:bnb_clean/backend/utils/custom_loading_api.dart';

import '../../../controller/profile/profile_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/strings.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading
        ? const CustomLoadingAPI()
        : ListView(
            padding: EdgeInsets.only(
              left: Dimensions.paddingSizeHorizontal,
              right: Dimensions.paddingSizeHorizontal,
              bottom: Dimensions.paddingSizeVertical,
            ),
            children: [
              verticalSpace(Dimensions.heightSize),
              _profilePic(context),
              verticalSpace(Dimensions.heightSize * .6),
              TitleHeading4Widget(
                text: "I am ${controller.fullNameController.text}",
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              _inputField()
            ],
          ));
  }

  _inputField() {
    return Column(
      children: [
        verticalSpace(Dimensions.marginSizeVertical),
        PrimaryTextInputWidget(
          controller: controller.fullNameController,
          labelText: Strings.fullName,
          hint: Strings.enterFullName,
        ),
        verticalSpace(Dimensions.marginBetweenInputBox),
        PrimaryTextInputWidget(
          controller: controller.companyNameController,
          hint: Strings.enterCompanyName,
          labelText: Strings.companyName,
        ),
        verticalSpace(Dimensions.marginBetweenInputBox),
        PrimaryTextInputWidget(
          controller: controller.postalCodeController,
          hint: Strings.enterPostalCode,
          labelText: Strings.postalCode,
        ),
        verticalSpace(Dimensions.marginBetweenInputBox),
        PrimaryTextInputWidget(
          readOnly: true,
          controller: controller.emailController,
          hint: Strings.enterEmailAddress,
          labelText: Strings.emailAddress,
        ),
        verticalSpace(Dimensions.marginBetweenInputBox),
        PrimaryTextInputWidget(
          controller: controller.phoneNumberController,
          hint: Strings.enterPhoneNumber,
          labelText: Strings.phoneNumber,
          keyboardType: TextInputType.number,
        ),
        // verticalSpace(Dimensions.marginBetweenInputBox),
        // PrimaryTextInputWidget(
        //   // optional: Strings.optional,
        //   maxLine: 3,
        //   controller: controller.additionalInformationController,
        //   hint: Strings.enterAdditionalInformation,
        //   labelText: Strings.additionalInformation,
        // ),
        verticalSpace(Dimensions.marginSizeVertical),
        Obx(() => controller.isStoreLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.update, onPressed: controller.updateProfile)),
        verticalSpace(Dimensions.marginSizeVertical),
      ],
    );
  }

  _profilePic(BuildContext context) {
    return SizedBox(
      child: CircleAvatar(
        radius: Dimensions.radius * 5,
        child: Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: controller.profileModel.user.profilePhotoPath.isEmpty
                    ? const AssetImage("assets/cartoon.png")
                    : NetworkImage(
                        controller.profileModel.user.profilePhotoPath),
              )),
        ),
      ),
    );
  }
}
