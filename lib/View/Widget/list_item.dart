import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/free-vector/couple-drawing-conversation-cartoon-style-illustration_1150-37533.jpg?t=st=1721889439~exp=1721893039~hmac=6b019d3cc472a495973fb96bc2d0848b8b4bd9ec55852b6850c8128720063e92&w=740"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            "Title",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white
            ),
          ),
        ),
        // child: const Center(child: Text("Category Widget")),
      ),
    );
  }
}
