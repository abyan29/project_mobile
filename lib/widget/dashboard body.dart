import 'package:flutter/material.dart';
import 'package:my_project/widget/menu_grid.dart';
import 'package:my_project/widget/welcome_banner.dart';

class DashboardBody extends StatelessWidget {
  final ScrollController scrollController;

  const DashboardBody({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade700, Colors.blue.shade100],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const WelcomeBanner(),
            const SizedBox(height: 24),
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(Colors.white70),
                    thickness: MaterialStateProperty.all(6),
                    radius: const Radius.circular(10),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                child: Scrollbar(
                  controller: scrollController,
                  child: MenuGrid(scrollController: scrollController),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}