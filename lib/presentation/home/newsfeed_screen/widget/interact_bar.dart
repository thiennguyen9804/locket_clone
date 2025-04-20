// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class InteractBar extends StatelessWidget {
//   InteractBar({super.key});
//   final Widget loveIc = SvgPicture.asset(
//     'assets/love_ic.svg',
//     width: 20,
//     height: 20,
//   );
//   final Widget sadIc = SvgPicture.asset(
//     'assets/sad_ic.svg',
//     width: 20,
//     height: 20,
//   );
//   final Widget fireIc = SvgPicture.asset(
//     'assets/fire_ic.svg',
//     width: 20,
//     height: 20,
//   );
//   final Widget moreIc = SvgPicture.asset(
//     'assets/more_ic.svg',
//     width: 20,
//     height: 20,
//   );

//   Widget commentBar() {
//     return Text(
//       'Gửi tin nhắn',
//       style: TextStyle(
//         fontSize: 14,
//         letterSpacing: 1.05,
//         color: Colors.white,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }

//   Widget emojiBar() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         loveIc,
//         sadIc,
//         fireIc,
//         moreIc,
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 38,
//       decoration: BoxDecoration(
//         color: Color(0xffAAC2B3),
//         borderRadius: BorderRadius.circular(50),
//         border: Border.all(
//           color: Color(0x8c738F81),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 2),
//             blurRadius: 4,
//             color: Color(0x92738F81),
//           )
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 7,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             commentBar(),
//             SizedBox(width: 16),
//             Expanded(child: emojiBar()),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InteractBar extends StatelessWidget {
  InteractBar({super.key});

  final Widget loveIc = SvgPicture.asset(
    'assets/love_ic.svg',
    width: 20,
    height: 20,
  );
  final Widget sadIc = SvgPicture.asset(
    'assets/sad_ic.svg',
    width: 20,
    height: 20,
  );
  final Widget fireIc = SvgPicture.asset(
    'assets/fire_ic.svg',
    width: 20,
    height: 20,
  );
  final Widget moreIc = SvgPicture.asset(
    'assets/more_ic.svg',
    width: 20,
    height: 20,
  );

  void _showCommentInput(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Cho phép mở bàn phím
      backgroundColor: Colors.transparent, // Nền trong suốt
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xffAAC2B3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Nhập tin nhắn...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              onSubmitted: (text) {
                Navigator.pop(context);
                print('Bạn vừa gửi: $text');
              },
            ),
          ),
        );
      },
    );
  }

  Widget commentBar(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCommentInput(context),
      child: Text(
        'Gửi tin nhắn',
        style: TextStyle(
          fontSize: 14,
          letterSpacing: 1.05,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget emojiBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        loveIc,
        sadIc,
        fireIc,
        moreIc,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: Color(0xffAAC2B3),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Color(0x8c738F81),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: Color(0x92738F81),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commentBar(context),
            SizedBox(width: 16),
            Expanded(child: emojiBar()),
          ],
        ),
      ),
    );
  }
}
