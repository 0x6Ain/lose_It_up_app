import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late final ScrollController _commentScrollController = ScrollController();
  late final TextEditingController _textEditingController = TextEditingController();
  late final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    _commentScrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('this will be textfield'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        controller: widget.scrollController,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 15,
          controller: _commentScrollController,
          itemBuilder: (context, index) {
            return const Card(
              child: SizedBox(
                height: 80,
                child: Text('comment list Item'),
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        color: Colors.amber,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: TextField(
          focusNode: _focusNode,
          autofocus: true,
          controller: _textEditingController,
          onTapOutside: (_) => _focusNode.unfocus(),
        ),
      ),
    );
  }
}
