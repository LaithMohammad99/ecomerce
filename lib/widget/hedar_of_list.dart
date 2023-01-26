import 'package:flutter/material.dart';

class HeaderOfList extends StatefulWidget {
  final String title;
  final String descrption;
  final String titleViewAll;
  final VoidCallback onTap;
  const HeaderOfList({Key? key, required this.title, required this.titleViewAll, required this.onTap, required this.descrption}) : super(key: key);

  @override
  State<HeaderOfList> createState() => _HeaderOfListState();
}

class _HeaderOfListState extends State<HeaderOfList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,style: Theme.of(context).textTheme
                    .headline5!.copyWith(fontWeight: FontWeight.bold),),
                InkWell(
                  onTap:(){widget.onTap;},
                  child: Text(widget.titleViewAll,style: Theme.of(context).textTheme
                      .subtitle1,),
                )

              ],
            ),
            Text(widget.descrption),
          ],
        ),
      ),
    );
  }
}