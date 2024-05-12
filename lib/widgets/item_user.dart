import 'package:flutter/material.dart';

class ItemUserWidget extends StatelessWidget {
  const ItemUserWidget(
      {super.key, required this.url, required this.userName, required this.phoneNumber});

  final String url;
  final String userName;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape: _cardShape(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(url),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phoneNumber,
                      style: const TextStyle(color: Color(0xffBABABA)),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  RoundedRectangleBorder _cardShape() {
    return RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
