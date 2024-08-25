import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DialogUtils {
  bool _isDialogLoadingShowing = false;
  bool _isDialogSessionShowing = false;
  bool _isDialogErrorShowing = false;
  bool _isBottomSheetShowing = false;

  void showLoading(BuildContext context) {
    if (!_isDialogLoadingShowing) {
      _isDialogLoadingShowing = true;
      showDialog(
        context: context,
        builder: (context) => const LoadingDialog(),
        barrierDismissible: false,
        useSafeArea: false,
      );
    }
  }

  void hideLoading(BuildContext context) {
    if (_isDialogLoadingShowing) {
      _isDialogLoadingShowing = false;
      Navigator.of(context).pop();
    }
  }

  // void hideSessionDialog() {
  //   if (_isDialogSessionShowing) {
  //     _isDialogSessionShowing = false;
  //     Get.back();
  //   }
  // }

// void showSessionExpiredDialog(Function() onTap) {
//   if (!_isDialogSessionShowing) {
//     _isDialogSessionShowing = true;
//     Get.bottomSheet(
//         SafeArea(
//           bottom: false,
//           child: SessionExpiredBottomSheet(onTap: () {
//             hideSessionDialog();
//             onTap.call();
//           }),
//         ),
//         isDismissible: false,
//         enableDrag: false,
//         ignoreSafeArea: false);
//   }
// }

  void showBottomSheet(
    BuildContext context, {
    required String title,
    String? desc,
    String? imageAsset,
    required String option1Text,
    required String option2Text,
    required VoidCallback onTapOption1,
    required VoidCallback onTapOption2,
  }) {
    if (!_isBottomSheetShowing) {
      _isBottomSheetShowing = true;
      showModalBottomSheet(
        context: context,
        useSafeArea: false,
        isDismissible: false,
        builder: (context) => OptionBottomSheet(
          title: title,
          desc: desc,
          imageAsset: imageAsset,
          option1Text: option1Text,
          option2Text: option2Text,
          onTapOption1: onTapOption1,
          onTapOption2: onTapOption2,
        ),
      );
    }
  }

  void hideBottomSheet(BuildContext context) {
    if (_isBottomSheetShowing) {
      _isBottomSheetShowing = false;
      Navigator.of(context).pop();
    }
  }

  void errorDialog(BuildContext context, String message) async {
    if (!_isDialogErrorShowing) {
      _isDialogLoadingShowing = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: false,
        builder: (context) => AlertDialog(
          title: const Text('Something went wrong'),
          content: Text(message),
        ),
      );
      await Future.delayed(const Duration(seconds: 3)).then((value) {
        _isDialogLoadingShowing = false;
        Navigator.of(context).pop();
      });
    }
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withAlpha(62),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            Material(
              type: MaterialType.transparency,
              child: Text(
                'Harap tunggu...',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionBottomSheet extends StatelessWidget {
  final String title;
  final String? desc;
  final String? imageAsset;
  final String option1Text;
  final String option2Text;
  final VoidCallback onTapOption1;
  final VoidCallback onTapOption2;

  const OptionBottomSheet({
    super.key,
    required this.title,
    this.desc,
    this.imageAsset,
    required this.option1Text,
    required this.option2Text,
    required this.onTapOption1,
    required this.onTapOption2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(height: 8.0),
          desc != null ? Text(desc!) : const SizedBox.shrink(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8.0),
              imageAsset != null
                  ? Image.asset(
                      imageAsset!,
                      height: 30,
                      fit: BoxFit.fitHeight,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          ElevatedButton(
            onPressed: onTapOption1,
            child: Text(option1Text),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: onTapOption2,
            child: Text(option2Text),
          ),
        ],
      ),
    );
  }
}
