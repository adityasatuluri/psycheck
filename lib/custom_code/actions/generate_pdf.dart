// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

Future generatePdf(String? content, String? name) async {
  // download pdf file base on users documents in 1 page
// Define the function to download pdf file

  final pdf = pw.Document();
  // Add a title to the pdf file
  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Text(
            "Mental Health Report - ${name}",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.Text("${content}"),
      ],
    ),
  );

  // Print the pdf file
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}

//user.created_name,
