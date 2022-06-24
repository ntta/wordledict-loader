import 'dart:ui';

import 'package:flutter/material.dart';

class TransformedText extends StatelessWidget {
  const TransformedText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final firstStepText = text
        .replaceAll('{bc}', '\u2022')
        .replaceAll('{ldquo}', '\u201c')
        .replaceAll('{rdquo}', '\u201d');

    final List<String> chunks = [];

    String processingText = firstStepText;
    int startCloseIndex = processingText.indexOf('{/');

    while (startCloseIndex >= 0) {
      int endCloseIndex = startCloseIndex + 1;
      while (processingText[endCloseIndex] != '}') {
        endCloseIndex++;
      }
      final tagName =
          processingText.substring(startCloseIndex + 2, endCloseIndex);
      final startOpenIndex = processingText.indexOf('{$tagName}');
      final frontText = processingText.substring(0, startOpenIndex);
      if (frontText != '') {
        chunks.add(frontText);
      }
      final tagText =
          processingText.substring(startOpenIndex, endCloseIndex + 1);
      chunks.add(tagText);
      processingText = processingText.substring(endCloseIndex + 1);
      startCloseIndex = processingText.indexOf('{/');
    }

    if (processingText != '') {
      chunks.add(processingText);
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: chunks.map(
          (chunk) {
            if (chunk.startsWith('{b}')) {
              final text = getTextInTag(chunk, 'b');
              return TextSpan(
                text: text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              );
            }

            if (chunk.startsWith('{inf}')) {
              final text = getTextInTag(chunk, 'inf').toLowerCase();
              return TextSpan(
                text: text,
                style: const TextStyle(
                  fontFeatures: [
                    FontFeature.subscripts(),
                  ],
                ),
              );
            }

            if (chunk.startsWith('{it}')) {
              final text = getTextInTag(chunk, 'it');
              return TextSpan(
                text: text,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              );
            }

            if (chunk.startsWith('{sc}')) {
              final text = getTextInTag(chunk, 'sc');
              return TextSpan(
                text: text,
                style: const TextStyle(
                  fontFeatures: [
                    FontFeature.enable('smcp'),
                  ],
                  letterSpacing: 0.5,
                ),
              );
            }

            if (chunk.startsWith('{sup}')) {
              final text = getTextInTag(chunk, 'sup').toLowerCase();
              return TextSpan(
                text: text,
                style: const TextStyle(
                  fontFeatures: [
                    FontFeature.superscripts(),
                  ],
                ),
              );
            }

            return TextSpan(text: chunk);
          },
        ).toList(),
      ),
    );
  }

  String getTextInTag(String textWithTag, String tag) {
    return textWithTag.replaceAll('{$tag}', '').replaceAll('{/$tag}', '');
  }
}
