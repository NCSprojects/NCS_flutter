import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/features/exhibits/presentation/bloc/draggable_sheet_cubit.dart';

class PopupContent extends StatelessWidget {
  const PopupContent({
    Key? key,
    required this.title,
    required this.date,
    required this.description,
    required this.mainText,
    required this.subText,
    required this.imagePath,
  }) : super(key: key);

  final String title;
  final String date;
  final String description;
  final String mainText;
  final String subText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final DraggableSheetCubit cubit = context.read<DraggableSheetCubit>();

    return DraggableScrollableSheet(
      controller: cubit.controller,
      initialChildSize: 1,
      minChildSize: 0.8,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Material(
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: ListView.builder(
              controller: scrollController,
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}