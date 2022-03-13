import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/modules/new_post/blocs/addDonationBloc/adddonation_bloc.dart';
import 'package:backersapp/modules/new_post/screens/donation_success_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDonation extends StatefulWidget {
  final int id;
  const AddDonation({Key? key, required this.id}) : super(key: key);

  @override
  State<AddDonation> createState() => _AddDonationState();
}

class _AddDonationState extends State<AddDonation> {
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdddonationBloc(),
      child: Scaffold(
        backgroundColor: CustomColors.darkBlue,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.darkBlue,
          elevation: 1,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  EvaIcons.close,
                  color: CustomColors.white,
                ))
          ],
          title: Text("Donation",
              style: TextStyle(
                  fontFamily: "FFMarkBold",
                  fontSize: 18,
                  color: CustomColors.white)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 42,
                ),
                Text(
                  "Enter an amount to donate:",
                  style: TextStyle(
                      fontFamily: "FFMarkRegular",
                      fontSize: 16,
                      color: CustomColors.whiteShade),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: CustomColors.darkBlueShade, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: amountController,
                        style: TextStyle(color: CustomColors.white),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    )),
                SizedBox(
                  height: 24,
                ),
                BlocConsumer<AdddonationBloc, AdddonationState>(
                  listener: (context, state) {
                    if (state is AddDonationSuccessState) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DonationSuccessScreen(
                                    message: state.message,
                                  )));
                    } else if (state is AddDonationFailedState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        if (amountController.text != "") {
                          BlocProvider.of<AdddonationBloc>(context).add(
                              AddDonationAttempt(
                                  amount: amountController.text,
                                  postID: widget.id));
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            color: CustomColors.greenAccent,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            "DONATE NOW",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
