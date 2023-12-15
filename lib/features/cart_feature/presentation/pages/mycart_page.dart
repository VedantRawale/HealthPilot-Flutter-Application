import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_pilot/core/constants/constants.dart';
import 'package:health_pilot/customwidgets/titlewithbutton_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../../customwidgets/custom_appbar_widget.dart';
import '../../../book_appointment_feature/presentation/pages/success_page.dart';
import '../../business/usecases/getcart.dart';
import '../widgets/hardcopy_widget.dart';
import '../widgets/schedule_button_widget.dart';
import '../widgets/selectdate_widget.dart';
import '../widgets/totalamount_widget.dart';
import 'empty_cart_page.dart';
import '../widgets/cart_item_list.dart';
import '../../../book_appointment_feature/presentation/provider/ScheduleDateTimeProvider.dart';
import '../../../book_appointment_feature/presentation/pages/book_appointment_page.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        CustomAppBar(title: 'My Cart'),
        Consumer<GetCart>(
          builder: (context, getCart, child) {
            return getCart.getNumberofItems() == 0
                ? const EmptyCartPage()
                : const CartPageBody();
          },
        ),
      ])),
    );
  }
}

class CartPageBody extends StatefulWidget {
  const CartPageBody({super.key});

  @override
  State<CartPageBody> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<CartPageBody> {
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 10),
        TitleWithButtonWidget(title: 'Order Review'),
        SizedBox(height: 10),
        CartItemList(),
        SizedBox(height: 10),
        SelectDateWidget(),
        SizedBox(height: 10),
        TotalAmountWidget(),
        SizedBox(height: 10),
        HardCopyWidget(),
        SizedBox(height: 10),
        ScheduleButton(),
      ],
    );
  }
}
