// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class BookItemMenu extends StatelessWidget {
  const BookItemMenu({
    Key? key,
    required this.bookItemWidget,
  }) : super(key: key);
  final Widget bookItemWidget;
  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      // ignore: deprecated_member_use
      previewBuilder: (context, animation, child) {
        return const SizedBox.expand();
      },
      actions: <Widget>[
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
          trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
          child: const Text('Copy'),
        ),
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
          },
          trailingIcon: CupertinoIcons.heart,
          child: const Text('Favorite'),
        ),
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDestructiveAction: true,
          trailingIcon: CupertinoIcons.delete,
          child: const Text('Delete'),
        ),
      ],
      child: bookItemWidget,
    );
  }
}
