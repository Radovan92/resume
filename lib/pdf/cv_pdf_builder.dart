import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../data/cv_content.dart';

class CvPdfBuilder {
  static const filename = 'Radovan_Kljestan_CV.pdf';

  static const _sidebarColor = PdfColor.fromInt(0xFF33373A);
  static const _sidebarWidth = 190.0;

  static Future<Uint8List> build() async {
    final photo = pw.MemoryImage(
      (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
    );

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (context) {
          return pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Container(
                width: _sidebarWidth,
                color: _sidebarColor,
                padding: const pw.EdgeInsets.fromLTRB(18, 28, 18, 24),
                child: _sidebar(photo),
              ),
              pw.Expanded(
                child: pw.Container(
                  color: PdfColors.white,
                  padding: const pw.EdgeInsets.fromLTRB(22, 26, 22, 22),
                  child: _mainContent(),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static Future<void> download() async {
    final bytes = await build();
    await Printing.sharePdf(bytes: bytes, filename: filename);
  }

  static pw.Widget _sidebar(pw.ImageProvider photo) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Center(
          child: pw.Column(
            children: [
              pw.Container(
                width: 108,
                height: 108,
                decoration: pw.BoxDecoration(
                  shape: pw.BoxShape.circle,
                  image: pw.DecorationImage(image: photo, fit: pw.BoxFit.cover),
                ),
              ),
              pw.SizedBox(height: 14),
              pw.Text(
                CvContent.name.toUpperCase(),
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  color: PdfColors.white,
                  fontSize: 13,
                  fontWeight: pw.FontWeight.bold,
                  letterSpacing: 1.4,
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                CvContent.title,
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(
                  color: PdfColors.grey300,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 28),
        _sidebarHeading('CONTACT'),
        pw.SizedBox(height: 10),
        _sidebarLine(CvContent.email),
        _sidebarLine(CvContent.phone),
        _sidebarLine(CvContent.github),
        _sidebarLine(CvContent.location),
        pw.SizedBox(height: 20),
        _sidebarHeading('SKILLS'),
        pw.SizedBox(height: 10),
        for (final skill in CvContent.skills)
          _bullet(skill, color: PdfColors.white),
        pw.SizedBox(height: 20),
        _sidebarHeading('LANGUAGES'),
        pw.SizedBox(height: 10),
        for (final language in CvContent.languages)
          _bullet(language, color: PdfColors.white),
      ],
    );
  }

  static pw.Widget _sidebarHeading(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(
        color: PdfColors.white,
        fontSize: 11,
        fontWeight: pw.FontWeight.bold,
        letterSpacing: 1.4,
      ),
    );
  }

  static pw.Widget _sidebarLine(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 7),
      child: pw.Text(
        text,
        style: const pw.TextStyle(color: PdfColors.white, fontSize: 8.5),
      ),
    );
  }

  static pw.Widget _bullet(
    String text, {
    PdfColor color = PdfColors.black,
    double left = 0,
  }) {
    return pw.Padding(
      padding: pw.EdgeInsets.only(left: left, bottom: 4),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            margin: const pw.EdgeInsets.only(top: 3.5, right: 6),
            width: 3.5,
            height: 3.5,
            decoration: pw.BoxDecoration(
              color: color,
              shape: pw.BoxShape.circle,
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              _safe(text),
              style: pw.TextStyle(color: color, fontSize: 9),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _mainContent() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _sectionTitle('PROFILE'),
        pw.SizedBox(height: 6),
        pw.Text(
          _safe(CvContent.profile),
          style: const pw.TextStyle(fontSize: 9.5, lineSpacing: 2),
        ),
        pw.SizedBox(height: 16),
        _sectionTitle('EXPERIENCE'),
        pw.SizedBox(height: 8),
        pw.Text(
          '${CvContent.experience.position} | ${CvContent.experience.company}',
          style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          CvContent.experience.period,
          style: const pw.TextStyle(fontSize: 8.5, color: PdfColors.grey600),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          _safe(CvContent.experience.description),
          style: const pw.TextStyle(fontSize: 9.5, lineSpacing: 2),
        ),
        pw.SizedBox(height: 16),
        _sectionTitle('PROJECTS'),
        pw.SizedBox(height: 8),
        for (var i = 0; i < CvContent.projects.length; i++) ...[
          if (i > 0) pw.SizedBox(height: 10),
          _project(CvContent.projects[i]),
        ],
      ],
    );
  }

  static pw.Widget _sectionTitle(String text) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          text,
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 3),
        pw.Container(width: 42, height: 1.5, color: PdfColors.black),
      ],
    );
  }

  static pw.Widget _project(CvProject project) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '${project.name} - ${project.technology}',
          style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 3),
        pw.Text(
          _safe(project.description),
          style: const pw.TextStyle(fontSize: 9.5, lineSpacing: 2),
        ),
        pw.SizedBox(height: 3),
        for (final feature in project.features)
          _bullet(_safe(feature), left: 8),
      ],
    );
  }

  static String _safe(String text) => text.replaceAll('→', '->');
}
