import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hydropome/core/constants/app_color.dart';
import 'package:hydropome/core/data/personalization_data.dart';

class PersonalizationQuestionCards extends StatelessWidget {
  final List<PersonalizationQuestion> questions;
  final List<dynamic>
  selectedOptions; // Can be String? for single choice or List<String> for multiple choice
  final Function(int index, dynamic value) onOptionChanged;
  final VoidCallback onNextPressed;
  final ScrollController scrollController;
  final Function(double) onScrollChanged;
  final String buttonText; // Text for the button (default: "Selanjutnya")

  const PersonalizationQuestionCards({
    super.key,
    required this.questions,
    required this.selectedOptions,
    required this.onOptionChanged,
    required this.onNextPressed,
    required this.scrollController,
    required this.onScrollChanged,
    this.buttonText = 'Selanjutnya',
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            onScrollChanged(notification.metrics.pixels);
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.only(bottom: 40.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'Yuk Jawab Biar HydropoMe Tahu Kebutuhanmu 💚',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 32),
              // Build question blocks from data
              ...questions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                return Column(
                  children: [
                    _buildQuestionBlock(
                      question: question,
                      title: question.title,
                      options: question.options,
                      questionType: question.type,
                      selectedValue: selectedOptions[index],
                      onChanged: (value) {
                        onOptionChanged(index, value);
                      },
                    ),
                    if (index < questions.length - 1)
                      const SizedBox(height: 24),
                  ],
                );
              }),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onNextPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.activeDot,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for a single question block (card)
  Widget _buildQuestionBlock({
    required PersonalizationQuestion question,
    required String title,
    required List<String> options,
    required QuestionType questionType,
    required dynamic
    selectedValue, // String? for single choice, List<String> for multiple choice
    required ValueChanged<dynamic> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.greenLight,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/plant-icon.svg',
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // List of options
          Builder(
            builder: (context) {
              // Get option items from question (with images if available)
              final optionItems = question.getOptionItems();

              return Column(
                children: optionItems.map((optionItem) {
                  final optionText = optionItem.text;

                  if (questionType == QuestionType.multipleChoice) {
                    // Multiple choice with checkbox
                    final selectedList = selectedValue as List<String>? ?? [];
                    final isSelected = selectedList.contains(optionText);
                    return _buildCheckboxTile(
                      text: optionText,
                      imagePath: optionItem.imagePath,
                      isSelected: isSelected,
                      onTap: () {
                        final currentList = List<String>.from(selectedList);
                        if (isSelected) {
                          currentList.remove(optionText);
                        } else {
                          currentList.add(optionText);
                        }
                        onChanged(currentList);
                      },
                    );
                  } else {
                    // Single choice with radio button
                    final selectedOption = selectedValue as String?;
                    return _buildRadioTile(
                      text: optionText,
                      imagePath: optionItem.imagePath,
                      isSelected: optionText == selectedOption,
                      groupValue: selectedOption,
                      onTap: () {
                        onChanged(optionText);
                      },
                    );
                  }
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper function to get image size based on option text
  double _getImageSize(String text) {
    if (text.contains('< 1m²') || text.contains('< 1 m²')) {
      return 60.0; // Default size
    } else if (text.contains('1-3 m²') || text.contains('1-3m²')) {
      return 120.0; // 2x larger
    } else if (text.contains('> 3 m²') || text.contains('> 3m²')) {
      return 180.0; // 3x larger
    }
    return 60.0; // Default size for other options
  }

  // Helper widget for a single radio option (single choice)
  Widget _buildRadioTile({
    required String text,
    String? imagePath,
    required bool isSelected,
    required VoidCallback onTap,
    required String? groupValue,
  }) {
    final imageSize = _getImageSize(text);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.greenLight : Colors.grey[100],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: isSelected ? AppColor.activeDot : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              // Custom Radio Button
              Radio<String>(
                value: text,
                groupValue: groupValue,
                onChanged: (value) {
                  if (value != null) {
                    onTap();
                  }
                },
                activeColor: AppColor.activeDot,
              ),
              const SizedBox(width: 8),
              // Image if available
              if (imagePath != null) ...[
                SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: imagePath.startsWith('http')
                      ? Image.network(
                          imagePath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[100],
                              child: const Icon(Icons.image_not_supported),
                            );
                          },
                        )
                      : Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[100],
                              child: const Icon(Icons.image_not_supported),
                            );
                          },
                        ),
                ),
                const SizedBox(width: 12),
              ],
              // Text
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.black87 : Colors.grey[700],
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for a checkbox option (multiple choice)
  Widget _buildCheckboxTile({
    required String text,
    String? imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final imageSize = _getImageSize(text);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.greenLight : Colors.grey[100],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: isSelected ? AppColor.activeDot : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              // Custom Checkbox
              Checkbox(
                value: isSelected,
                onChanged: (value) {
                  onTap();
                },
                activeColor: AppColor.activeDot,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              const SizedBox(width: 8),
              // Image if available
              if (imagePath != null) ...[
                SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: imagePath.startsWith('http')
                      ? Image.network(
                          imagePath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[100],
                              child: const Icon(Icons.image_not_supported),
                            );
                          },
                        )
                      : Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.image_not_supported),
                            );
                          },
                        ),
                ),
                const SizedBox(width: 12),
              ],
              // Text
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.black87 : Colors.grey[700],
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
