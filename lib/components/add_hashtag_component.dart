import 'package:flutter/material.dart';

class AddHashtagComponent extends StatefulWidget {
  const AddHashtagComponent({Key? key}) : super(key: key);

  @override
  State<AddHashtagComponent> createState() => _AddHashtagComponentState();
}

class _AddHashtagComponentState extends State<AddHashtagComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _modal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hashtag creator",
                      style: Theme.of(context).textTheme.titleLarge)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  decoration:
                      const InputDecoration(hintText: "Enter your hashtag"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel".toUpperCase()),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (_controller.text.isNotEmpty) {
                        _controller.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Empty hashtag")));
                      }
                    },
                    child: Text("Add".toUpperCase()),
                  ),
                ]),
              )
            ],
          )));

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _modal(context),
      child: const Icon(Icons.add),
    );
  }
}
