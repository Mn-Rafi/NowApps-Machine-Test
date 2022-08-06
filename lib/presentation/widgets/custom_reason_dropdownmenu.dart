import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowapps/logic/cubit_no_order_screen/no_order_screen_cubit.dart';
import 'package:sizer/sizer.dart';

String selectedValue = 'Shop Closed';

class CustomDropdownmenuButton extends StatelessWidget {
  CustomDropdownmenuButton({
    Key? key,
  }) : super(key: key);

  final type = [
    'Shop Closed',
    'Stock Already Available',
    'Owner Not Available',
    'No Demand',
    'Payment Issues',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedValue,
        onChanged: (newValue) {
          selectedValue = newValue!;
          context.read<NoOrderScreenCubit>().dropDownChange();
        },
        items: type
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      onTap: () {
                        selectedValue = value;
                        context.read<NoOrderScreenCubit>().dropDownChange();
                      },
                      value: value,
                      child: Text(value),
                    ))
            .toList(),

        // add extra sugar..
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 30,
        underline: const SizedBox(),
      ),
    );
  }
}
