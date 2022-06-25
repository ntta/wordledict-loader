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
    int startOpenIndex = processingText.indexOf('{');

    while (startOpenIndex >= 0) {
      final frontText = processingText.substring(0, startOpenIndex);
      if (frontText != '') {
        chunks.add(frontText);
      }
      final endOpenIndex = processingText.indexOf('}');
      final tagName =
          processingText.substring(startOpenIndex + 1, endOpenIndex);
      final startCloseIndex = processingText.indexOf('{/$tagName}');
      final endCloseIndex = startCloseIndex + tagName.length + 2;
      final tagText =
          processingText.substring(startOpenIndex, endCloseIndex + 1);
      chunks.add(tagText);

      processingText = processingText.substring(endCloseIndex + 1);
      startOpenIndex = processingText.indexOf('{');
    }

    if (processingText != '') {
      chunks.add(processingText);
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: chunks.map(
          (chunk) {
            String textOnly = getTextOnly(chunk);
            if (hasTag(chunk)) {
              final List<FontFeature> fontFeatures = [];
              if (hasSubTag(chunk)) {
                textOnly = textOnly.toLowerCase();
                fontFeatures.add(const FontFeature.subscripts());
              }
              if (hasSupTag(chunk)) {
                textOnly = textOnly.toLowerCase();
                fontFeatures.add(const FontFeature.superscripts());
              }
              if (hasSmallCapTag(chunk)) {
                textOnly = textOnly.toUpperCase();
                fontFeatures.add(const FontFeature.enable('smcp'));
              }

              return TextSpan(
                text: textOnly,
                style: TextStyle(
                  fontWeight: hasBoldTag(chunk) ? FontWeight.bold : null,
                  fontStyle: hasItalicTag(chunk) ? FontStyle.italic : null,
                  fontFeatures: fontFeatures,
                  letterSpacing: hasSmallCapTag(chunk) ? 0.5 : null,
                  fontSize: hasSmallCapTag(chunk) ? 10 : null,
                ),
              );
            }

            return TextSpan(text: chunk);
          },
        ).toList(),
      ),
    );
  }

  String getTextOnly(String textWithTags) {
    return textWithTags
        .replaceAll('{b}', '')
        .replaceAll('{/b}', '')
        .replaceAll('{inf}', '')
        .replaceAll('{/inf}', '')
        .replaceAll('{it}', '')
        .replaceAll('{/it}', '')
        .replaceAll('{sc}', '')
        .replaceAll('{/sc}', '')
        .replaceAll('{sup}', '')
        .replaceAll('{/sup}', '');
  }

  bool hasTag(String text) {
    return ['{b}', '{inf}', '{it}', '{sc}', '{sup}']
        .any((tag) => text.contains(tag));
  }

  bool hasBoldTag(String text) => text.contains('{b}');
  bool hasSubTag(String text) => text.contains('{inf}');
  bool hasItalicTag(String text) => text.contains('{it}');
  bool hasSmallCapTag(String text) => text.contains('{sc}');
  bool hasSupTag(String text) => text.contains('{sup}');
}
