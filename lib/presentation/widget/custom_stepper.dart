import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final List<String> stepDescriptions;

  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.stepDescriptions,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const stepWidth = 70.0;
    final totalStepWidth = stepDescriptions.length * stepWidth;
    final remainingWidth = screenWidth - totalStepWidth;
    final dividerWidth = remainingWidth / (stepDescriptions.length - 1);

    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: stepDescriptions.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          bool isActive = index == currentStep;
          bool isCompleted = index < currentStep;
          return _buildStep(
            index + 1,
            stepDescriptions[index],
            isActive,
            isCompleted,
          );
        },
        separatorBuilder: (context, index) {
          bool isActive = index == currentStep;
          bool isCompleted = index < currentStep;
          return _buildDivider(dividerWidth, isActive || isCompleted);
        },
      ),
    );
  }

  Widget _buildStep(
    int stepNumber,
    String description,
    bool isActive,
    bool isCompleted,
  ) {
    return SizedBox(
      width: 70,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: isCompleted
                ? Colors.deepOrangeAccent
                : Colors.deepOrangeAccent.withOpacity(isActive ? 1.0 : 0.5),
            child: Text(
              '$stepNumber',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 12,
              color: isCompleted
                  ? Colors.deepOrangeAccent
                  : Colors.deepOrangeAccent.withOpacity(isActive ? 1.0 : 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(double width, bool isActive) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Divider(
            color: Colors.deepOrangeAccent.withOpacity(isActive ? 1.0 : 0.5),
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
