import 'dart:io';
import 'package:dio/dio.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:instagram_clone/ulits/ulitts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:file_saver/file_saver.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class download_file extends StatefulWidget {
  final String pathlocation;

  const download_file({
    Key? key,
    required this.pathlocation,
  }) : super(key: key);
  @override
  State<download_file> createState() => _download_fileState();
}

class _download_fileState extends State<download_file> {
  late Future<ListResult> futurefiles;
  unbindService(serviceConnection) {
    // TODO: implement unbindService
    throw UnimplementedError();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futurefiles=FirebaseStorage.instance.ref('/files').listAll();
    final storageRef = FirebaseStorage.instance.ref();
    futurefiles = storageRef.child(widget.pathlocation).listAll();

    // final islandRef=storageRef.child('/files');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListResult>(
      future: futurefiles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final files = snapshot.data!.items;

          return ListView.builder(
            itemCount: files.length,
            itemBuilder: (context, index) {
              final file = files[index];

              return ListTile(
                title: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PdfViewerPage(ref: file))),
                    child: Text(file.name)),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error has Occured'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class PdfViewerPage extends StatefulWidget {
  final Reference ref;

  const PdfViewerPage({Key? key, required this.ref}) : super(key: key);
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late File Pfile;
  bool isLoading = false;
  bool _isicon = true;
  Future<void> loadNetwork() async {
    setState(() {
      isLoading = true;
    });
    final url = await widget.ref.getDownloadURL();
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = widget.ref.name;
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);

    if (mounted) {
      setState(() {
        Pfile = file;
      });
    }

    print(Pfile);
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadNetwork();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          widget.ref.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              requestPermission();
              downloadFile(widget.ref);
            },
            icon: _isicon
                ? const Icon(Icons.download)
                : const Icon(Icons.download_done_outlined),
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              child: Center(
                child: PDFView(
                  filePath: Pfile.path,
                ),
              ),
            ),
    );
  }

  Future<void> requestPermission() async {
    final status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Permission denied');
    }
  }

  Future<void> downloadFile(Reference ref) async {
    final url = await ref.getDownloadURL();
    final dir = Directory('/storage/emulated/0/SIT');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final path = '${dir.path}/${ref.name}';
    final file = File('${dir.path}/${ref.name}');

    await ref.writeToFile(file);
    print(url);

    // await ref.writeToFile(file);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloaded ${ref.name}')),
    );
  }
}
