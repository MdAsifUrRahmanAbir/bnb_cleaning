import '../../utils/basic_widget_imports.dart';
import 'package:intl/intl.dart';

import '../../utils/strings.dart';
import '../text_labels/title_heading5_widget.dart';

class PrimaryDateInputWidget extends StatefulWidget {
  final String labelText, optional;
  final bool? readOnly;
  final Function(DateTime) onChanged;
  final DateTime? initialDate;
  final Color color;
  final List<DateTime>? disabledDates;

  const PrimaryDateInputWidget({
    super.key,
    required this.labelText,
    this.readOnly = false,
    this.optional = "",
    this.color = Colors.transparent,
    required this.onChanged,
    this.initialDate,
    this.disabledDates,
  });

  @override
  State<PrimaryDateInputWidget> createState() => _PrimaryDateInputWidgetState();
}

class _PrimaryDateInputWidgetState extends State<PrimaryDateInputWidget> {
  DateTime? _selectedDate;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    debugPrint("✔️✍️ PrimaryDateInput -> initialDate: ${widget.initialDate} ✉");
    if (widget.initialDate == null) {
      controller.text = Strings.selectDate;
      _selectedDate = DateTime.now();
    } else {
      _selectedDate = widget.initialDate;
      controller.text = _filterDateOnly(widget.initialDate!);
    }
  }

  String _filterDateOnly(DateTime value) {
    return DateFormat('EEEE, d MMMM yyyy').format(value);
  }

  // List<DateTime> disabledDates = [
  //   DateTime(2024, 10, 8),
  //   DateTime(2024, 10, 15),
  //   DateTime(2024, 10, 27),
  // ];

  DateTime? checkSelectedDate(
      DateTime selectedDate, List<DateTime> disabledDates) {
    // Check if selectedDate is in the disabledDates list
    bool isDisabled = disabledDates.any((disabledDate) =>
        selectedDate.year == disabledDate.year &&
        selectedDate.month == disabledDate.month &&
        selectedDate.day == disabledDate.day);

    // Return null if the date is disabled, otherwise return the selected date
    return isDisabled ? null : selectedDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkSelectedDate(_selectedDate!, widget.disabledDates!),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
      // Here you define the predicate to disable specific dates
      selectableDayPredicate: (DateTime date) {
        // Disable the dates in the disabledDates list
        return !(widget.disabledDates!)
            .contains(DateTime(date.year, date.month, date.day));
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        controller.text = _filterDateOnly(picked);
        widget.onChanged(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: crossStart,
          children: [
            TitleHeading4Widget(
              text: widget.labelText,
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(Dimensions.heightSize * 0.2),
            Visibility(
              visible: widget.optional.isNotEmpty,
              child: const TitleHeading5Widget(
                text: "As the selected date is Today, Tomorrow or Sunday, 20% extra is applied over the payment.",
                opacity: .4,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.marginBetweenInputTitleAndBox * 1),
        TextFormField(
          autofocus: widget.initialDate != null,
          cursorColor: Theme.of(context).primaryColor,
          style: CustomStyle.lightHeading4TextStyle
              .copyWith(color: Theme.of(context).primaryColor),
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1.2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            filled: true,
            fillColor: widget.color,
            // contentPadding:
            //     const EdgeInsets.only(left: 16, right: 10, top: 0, b),
            hintText: "",
            hintStyle: Get.isDarkMode
                ? CustomStyle.darkHeading3TextStyle.copyWith(
                    color: CustomColor.primaryDarkTextColor.withOpacity(0.2),
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.headingTextSize3,
                  )
                : CustomStyle.lightHeading3TextStyle.copyWith(
                    color: CustomColor.primaryLightTextColor.withOpacity(0.2),
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.headingTextSize3,
                  ),
            // suffixIcon: suffixIcon,
            // prefixIcon: prefixIcon,
          ),
        )
      ],
    );
  }
}
