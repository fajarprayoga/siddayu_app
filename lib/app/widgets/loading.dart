part of 'widget.dart';

class Loading extends StatefulWidget {
  final bool isLoading;

  const Loading({Key? key, required this.isLoading}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          ) // Display a loading indicator if isLoading is true
        : const Placeholder(); // Display a placeholder if isLoading is false
  }
}
