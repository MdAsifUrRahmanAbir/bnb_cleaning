import '../../../../backend/static_data.dart';
import '../../../../controller/bottom_nav/edit_properties_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/custom_dropdown_widget/custom_dropdown_widget.dart';

class UpdatePropertiesScreen extends StatelessWidget {
  UpdatePropertiesScreen({super.key});

  final controller = Get.find<UpdatePropertiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(
          title: Strings.editProperties,
        ),
        body: _bodyWidget());
  }

  _bodyWidget() {
    return SafeArea(child: ListView(
      padding: EdgeInsets.only(
        left: Dimensions.paddingSizeHorizontal,
        right: Dimensions.paddingSizeHorizontal,
        bottom: Dimensions.paddingSizeVertical,
        top: Dimensions.paddingSizeVertical,
      ),
      children: [
        _aboutWidget(),
        _contactWidget(),
        _addressWidget(),

        verticalSpace(Dimensions.marginSizeVertical),
        PrimaryButton(title: Strings.create, onPressed: controller.updateProperty),
        verticalSpace(Dimensions.marginSizeVertical),
      ],
    ));
  }

  _aboutWidget() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading3Widget(
          text: Strings.about,
          color: Theme.of(Get.context!).primaryColor,
        ),
        verticalSpace(Dimensions.marginBetweenInputBox),

        PrimaryTextInputWidget(
          controller: controller.propertyNameController,
          hint: Strings.propertyNameHint,
          labelText: Strings.propertyName,
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

        PrimaryTextInputWidget(
          optional: Strings.optional,
          maxLine: 3,
          controller: controller.propertyDescriptionController,
          hint: Strings.propertyDescriptionHint,
          labelText: Strings.propertyDescription,
        ),

        verticalSpace(Dimensions.marginBetweenInputBox * .5),

        const Divider(),
        verticalSpace(Dimensions.marginBetweenInputBox * .5),

      ],
    );
  }

  _contactWidget() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading3Widget(
          text: Strings.contact,
          color: Theme.of(Get.context!).primaryColor,
        ),
        verticalSpace(Dimensions.marginBetweenInputBox),

        PrimaryTextInputWidget(
          controller: controller.contactNameController,
          hint: Strings.enterName,
          labelText: Strings.name,
        ),

        verticalSpace(Dimensions.marginBetweenInputBox),

        PrimaryTextInputWidget(
          controller: controller.contactPhoneController,
          hint: Strings.enterPhoneNumber,
          labelText: Strings.phoneNumber,
        ),

        verticalSpace(Dimensions.marginSizeVertical),

        CustomDropDown<DropDownUseModel>(
          title: Strings.propertyAccess,
          items: propertyAccess,
          onChanged: (value) {
            controller.selectedPropertyAccess.value = value!;
          },
          hint: controller.selectedPropertyAccess.value.title,
        ),
        verticalSpace(Dimensions.marginBetweenInputBox * .5),

        const Divider(),
        verticalSpace(Dimensions.marginBetweenInputBox * .5),
      ],
    );
  }

  _addressWidget() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading3Widget(
          text: Strings.contact,
          color: Theme.of(Get.context!).primaryColor,
        ),
        verticalSpace(Dimensions.marginBetweenInputBox),

        PrimaryTextInputWidget(
          controller: controller.addressController,
          hint: Strings.enterAddress,
          labelText: Strings.address,
        ),

        verticalSpace(Dimensions.marginBetweenInputBox),

        PrimaryTextInputWidget(
          controller: controller.postCodeController,
          hint: Strings.enterPostCode,
          labelText: Strings.postCode,
        ),

        verticalSpace(Dimensions.marginBetweenInputBox * .5),

        const Divider(),
        verticalSpace(Dimensions.marginBetweenInputBox * .5),
      ],
    );
  }
}
