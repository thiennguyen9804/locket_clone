import 'package:flutter/material.dart';
import 'package:locket_clone/core/configs/theme/app_theme.dart';
import 'package:locket_clone/data/model/interaction_dto/interaction_dto.dart';
import 'package:locket_clone/domain/entities/interaction_entity.dart';

class MyInteractBar extends StatelessWidget {
  const MyInteractBar({super.key, required this.interactList});
  final List<InteractionEntity> interactList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: Color(0xffAAC2B3),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Color(0x8c738F81), width: 1),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: Color(0x92738F81),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (interactList.isEmpty)
              Text('No reaction', style: TextStyle(color: Colors.white)),
            if (interactList.isNotEmpty)
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return _interactionSection();
                    },
                  );
                },
                child: Text(
                  'There\'re reactions!!!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _interactionSection() {
    return ListView.builder(
      itemCount: interactList.length,
      itemBuilder: (context, index) {
        final user = interactList[index].user;
        return _interactionItem(
          userName: user.name,
          emoji: interactList[index].emoji,
          avatar: user.avatarUrl!,
        );
      },
    );
  }

  Widget _interactionItem({
    required String userName,
    required String emoji,
    required String avatar,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(foregroundImage: NetworkImage(avatar)),
              SizedBox(width: 5),
              Text(
                userName,
                style: TextStyle(
                  color: AppTheme.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(emoji, style: TextStyle(fontSize: 25)),
        ],
      ),
    );
  }
}
