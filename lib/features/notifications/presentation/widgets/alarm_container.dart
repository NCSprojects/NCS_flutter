import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class AlarmContainer extends StatelessWidget {
  const AlarmContainer({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isDismissed,
    required this.onDismissed,
    required this.onSwipeUpdate,
  });

  final String title;
  final String description;
  final String imagePath;
  final bool isDismissed;
  final VoidCallback onDismissed;
  final ValueChanged<bool> onSwipeUpdate;

  @override
  Widget build(BuildContext context) {
    final double containerHeight = ScreenUtil.heightPercentage(0.12);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,5,10,5),
      child: Dismissible(
        key: ValueKey(title),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onUpdate: (details) { //스와이프가 시작될때부터 확인
          final dismissed = details.progress > 0.01;
          if (dismissed != isDismissed) {
            onSwipeUpdate(dismissed);
          }
        },
        onDismissed: (_) => onDismissed(),
        child: AnimatedContainer(
          height: containerHeight,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: isDismissed
                ? const BorderRadius.horizontal(
              left: Radius.circular(10),
              right: Radius.zero,
            )
                : BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NCSText(
                        text: title,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5), // 제목과 설명 간격
                      NCSText(
                        text: description,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}