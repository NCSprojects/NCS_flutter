import 'package:flutter/material.dart';
import 'package:ncs/features/home/widgets/ticket_widget.dart';
import 'package:ncs/features/navigation/presentation/widgets/title_backspace_app_bar.dart';

class TicketInformationPage extends StatelessWidget {
  const TicketInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: TitleBackspaceAppBar(
        title: "티켓정보",
        nameTag: "취소하기",
        nameTagStyle: true,
      ),
      body:TicketWidget()
    );
  }
}
