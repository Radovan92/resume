import 'package:flutter/material.dart';
import '../../pdf/cv_pdf_builder.dart';

class DownloadPdfButton extends StatefulWidget {
  const DownloadPdfButton({super.key});

  @override
  State<DownloadPdfButton> createState() => _DownloadPdfButtonState();
}

class _DownloadPdfButtonState extends State<DownloadPdfButton> {
  bool _loading = false;

  Future<void> _download() async {
    if (_loading) return;
    setState(() => _loading = true);
    try {
      await CvPdfBuilder.download();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not download PDF: $error')));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: const Color(0xFF33373A),
      foregroundColor: Colors.white,
      onPressed: _loading ? null : _download,
      icon:
          _loading
              ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
              : const Icon(Icons.picture_as_pdf),
      label: Text(_loading ? 'Preparing…' : 'Download PDF'),
    );
  }
}
