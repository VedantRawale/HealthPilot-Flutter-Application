import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerScreen extends StatefulWidget {
  const PDFViewerScreen({super.key});

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  final String _signedUrl =
      'https://cemowcytiuyatgmrqwzm.supabase.co/storage/v1/object/sign/patientreports/U066.pdf?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InN0b3JhZ2UtdXJsLXNpZ25pbmcta2V5XzU4OTQ4YjhkLTlkOGYtNDI2NS04ZGMwLTg5MTRiYTIwZTdlMyJ9.eyJ1cmwiOiJwYXRpZW50cmVwb3J0cy9VMDY2LnBkZiIsImlhdCI6MTc0NjQyOTk4NywiZXhwIjoxNzQ5MDIxOTg3fQ.CcMRF22QqIEDllfuFTCxlXfLQ2AFoutjomsFDtwYY3E';
  String? _localPath;
  bool _isDownloading = false;

  Future<void> _downloadAndOpen() async {
    setState(() {
      _isDownloading = true;
    });

    try {
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/U066.pdf';

      await Dio().download(
        _signedUrl,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final pct = (received / total * 100).toStringAsFixed(0);
            debugPrint('Download: $pct%');
          }
        },
      );

      setState(() {
        _localPath = filePath;
        _isDownloading = false;
      });
    } catch (e) {
      debugPrint('Download/Open error: $e');
      setState(() {
        _isDownloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    if (_isDownloading) {
      bodyContent = const Center(child: CircularProgressIndicator());
    } else if (_localPath != null) {
      bodyContent = PDFView(
        filePath: _localPath!,
      );
    } else {
      bodyContent = Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.download),
          label: const Text('Download Report'),
          onPressed: _downloadAndOpen,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports Viewer'),
      ),
      body: bodyContent,
    );
  }
}
