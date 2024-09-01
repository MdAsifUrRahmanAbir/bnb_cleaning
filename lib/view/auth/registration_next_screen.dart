import 'package:bnb_clean/backend/utils/custom_loading_api.dart';

import '../../backend/static_data.dart';
import '../../controller/auth/registration_controller.dart';
import '../../utils/assets.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_dropdown_widget/custom_dropdown_widget.dart';
import '../../widgets/custom_dropdown_widget/custom_radio_widget.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';

class RegistrationNextScreen extends StatelessWidget {
  RegistrationNextScreen({super.key});

  final controller = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: SafeArea(child: Obx(() => _body(context))),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: controller.formKey2,
      child: ListView(
        padding: EdgeInsets.only(
          left: Dimensions.paddingSizeHorizontal,
          right: Dimensions.paddingSizeHorizontal,
          bottom: Dimensions.paddingSizeVertical,
        ),
        children: [
          Image.asset(Assets.appBasicLogo),
          verticalSpace(Dimensions.marginSizeVertical),
          TitleHeading3Widget(
            text: Strings.register,
            color: Theme.of(context).primaryColor,
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
          TitleHeading5Widget(
            text: Strings.registerSubTitle,
          ),
          verticalSpace(Dimensions.marginSizeVertical),
          CustomDropDown<DropDownUseModel>(
            title: Strings.areYou,
            items: areYouData,
            onChanged: (value) {
              controller.selectedAreYouData.value = value!;
            },
            hint: controller.selectedAreYouData.value.title,
          ),
          verticalSpace(Dimensions.marginBetweenInputBox),
          CustomRadioSelectWidget(
            title: Strings.selectTheNumberOfPropertiesYouManage,
            list: numberOfProperties,
            onChanged: (value) {},
          ),
          verticalSpace(Dimensions.marginBetweenInputBox),
          CustomDropDown<DropDownUseModel>(
            title: Strings.selectService,
            items: selectService,
            onChanged: (value) {
              controller.selectedService.value = value!;
            },
            hint: controller.selectedService.value.title,
          ),
          verticalSpace(Dimensions.marginBetweenInputBox),
          CustomDropDown<DropDownUseModel>(
            title: Strings.propertyType,
            items: propertyType,
            onChanged: (value) {
              controller.selectedPropertyType.value = value!;
            },
            hint: controller.selectedPropertyType.value.title,
          ),
          verticalSpace(Dimensions.marginBetweenInputBox),
          CustomDropDown<DropDownUseModel>(
            title: Strings.propertyAccess,
            items: propertyAccess,
            onChanged: (value) {
              controller.selectedPropertyAccess.value = value!;
            },
            hint: controller.selectedPropertyAccess.value.title,
          ),
          verticalSpace(Dimensions.marginBetweenInputBox),
          CustomRadioSelectWidget(
            title: Strings.howManyBookingsDoYouRequire,
            list: require,
            onChanged: (value) {},
          ),
          verticalSpace(Dimensions.marginBetweenInputBox),
          PrimaryTextInputWidget(
            optional: Strings.optional,
            maxLine: 3,
            controller: controller.additionalInformationController,
            hint: Strings.enterAdditionalInformation,
            labelText: Strings.additionalInformation,
          ),
          verticalSpace(Dimensions.marginBetweenInputBox),
          PrimaryTextInputWidget(
            controller: controller.passwordController,
            hint: Strings.enterPassword,
            labelText: Strings.password,
          ),
          verticalSpace(Dimensions.marginBetweenInputBox),
          PrimaryTextInputWidget(
            controller: controller.confirmPasswordController,
            hint: Strings.enterPassword,
            labelText: Strings.confirmPassword,
          ),
          verticalSpace(Dimensions.marginSizeVertical),
          Obx(() => controller.isLoading
              ? const CustomLoadingAPI()
              : PrimaryButton(
                  title: Strings.requestSignUp,
                  onPressed: controller.register)),
          verticalSpace(Dimensions.marginSizeVertical),
        ],
      ),
    );
  }
}
