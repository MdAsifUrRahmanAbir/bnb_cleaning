import '../../controller/auth/registration_controller.dart';
import '../../utils/assets.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/strings.dart';
import '../../widgets/others/rich_text_widget.dart';
import '../../widgets/text_labels/title_heading5_widget.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.paddingSizeHorizontal,
          right: Dimensions.paddingSizeHorizontal,
          bottom: Dimensions.paddingSizeVertical,
        ),
        child: Form(
          key: controller.formKey,
          child: ListView(
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
              PrimaryTextInputWidget(
                controller: controller.fullNameController,
                labelText: Strings.fullName,
                hint: Strings.enterFullName,
              ),
              verticalSpace(Dimensions.marginBetweenInputBox),
              PrimaryTextInputWidget(
                optional: Strings.iifApplicable,
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
      
              verticalSpace(Dimensions.marginSizeVertical),
              PrimaryButton(title: Strings.next, onPressed: controller.next),
              verticalSpace(Dimensions.marginSizeVertical),
      
              Row(
                mainAxisAlignment: mainCenter,
                children: [
                  RichTextWidget(
                    textAlign: TextAlign.center,
                    preText: Strings.alreadyHaveAnAccount, postText: Strings.loginNow, onPressed: controller.clickOnRichText),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
