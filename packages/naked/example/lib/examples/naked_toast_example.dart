import 'package:flutter/material.dart';
import 'package:naked/naked.dart';

import 'toast.dart';

class NakedToastExample extends StatefulWidget {
  const NakedToastExample({super.key});

  @override
  State<NakedToastExample> createState() => _NakedToastExampleState();
}

class _NakedToastExampleState extends State<NakedToastExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ToastLayer(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.blueGrey.shade50,
              child: Center(
                child: Builder(builder: (context) {
                  // return const AnimatedColumnInsertTop();
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.shade400,
                        ),
                        onPressed: () {
                          // _insertItem();
                          addAnimatedToast(
                            NakedToastEntry(
                              context: context,
                              duration: const Duration(seconds: 3),
                              toast: (context, remove) {
                                return ToastContainer(
                                  label: 'Alert',
                                  icon: Icons.error,
                                  onClose: remove,
                                  backgroundColor: Colors.redAccent.shade700,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('Alert'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent.shade400,
                        ),
                        onPressed: () {
                          // _insertItem();
                          addAnimatedToast(
                            NakedToastEntry(
                              context: context,
                              duration: const Duration(seconds: 3),
                              toast: (context, remove) {
                                return ToastContainer(
                                  label: 'Info',
                                  icon: Icons.info,
                                  onClose: remove,
                                  backgroundColor: Colors.blueAccent.shade700,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('Info'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade700,
                        ),
                        onPressed: () {
                          // _insertItem();
                          addAnimatedToast(
                            NakedToastEntry(
                              context: context,
                              duration: const Duration(seconds: 3),
                              toast: (context, remove) {
                                return ToastContainer(
                                  label: 'Success',
                                  icon: Icons.check_circle,
                                  onClose: remove,
                                  backgroundColor: Colors.greenAccent.shade700,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('Success'),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToastContainer extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onClose;
  final Color? backgroundColor;
  const ToastContainer({
    super.key,
    required this.label,
    required this.icon,
    required this.onClose,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .8,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              onPressed: onClose,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedColumnInsertTop extends StatefulWidget {
  const AnimatedColumnInsertTop({super.key});

  @override
  _AnimatedColumnInsertTopState createState() =>
      _AnimatedColumnInsertTopState();
}

class _AnimatedColumnInsertTopState extends State<AnimatedColumnInsertTop> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = [];

  int _counter = 1;

  void _addNewItem() {
    _items.insert(0, _counter++);
    _listKey.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 300));
  }

  void _removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, animation),
      duration: const Duration(milliseconds: 300),
    );
  }

  Widget _buildItem(int item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: GestureDetector(
          onLongPress: () => _removeItem(_items.indexOf(item)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(24),
            child:
                Text('Item $item', style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Insert at Top')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewItem,
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
        key: _listKey,
        reverse: false,
        padding: const EdgeInsets.all(16),
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation);
        },
      ),
    );
  }
}
