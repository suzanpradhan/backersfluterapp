import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/main/screens/main_screen_wrapper.dart';
import 'package:backersapp/modules/notifications/blocs/getNotificationBloc/getnotification_bloc.dart';
import 'package:backersapp/modules/notifications/widgets/notif_tile_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetnotificationBloc()..add(GetMyNotifications()),
      child: MainScreenWrapper(
        route: NOTIFICATION_ROUTE,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.darkBlue,
          elevation: 1,
          title: Text("Notifications",
              style: TextStyle(
                  fontFamily: "FFMarkBold",
                  fontSize: 18,
                  color: CustomColors.white)),
        ),
        child: BlocConsumer<GetnotificationBloc, GetnotificationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is GetMyNotificationsSuccessState) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.notificationList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NotiftileWidget(
                            text: state.notificationList[index].message,
                            label: "");
                      }),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
