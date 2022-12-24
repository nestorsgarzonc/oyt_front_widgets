import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oyt_front_core/constants/lotti_assets.dart';
import 'package:oyt_front_widgets/image/image_api_widget.dart';
import 'package:oyt_front_widgets/loading/loading_widget.dart';

class UploadImageCard extends StatelessWidget {
  const UploadImageCard({
    Key? key,
    required this.label,
    required this.url,
    required this.onUpload,
    required this.onRemove,
    required this.onReplace,
    this.showLarge = false,
    this.recomendations = const [],
    this.isLoading = false,
    this.imgBytes,
    this.fit,
  }) : super(key: key);

  final String label;
  final String? url;
  final VoidCallback onUpload;
  final VoidCallback onRemove;
  final VoidCallback onReplace;
  final bool showLarge;
  final List<String> recomendations;
  final bool isLoading;
  final Uint8List? imgBytes;
  final BoxFit? fit;

  bool get hasImage => url != null || imgBytes != null;
  bool get notHasImage => !hasImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: showLarge ? 350 : 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: notHasImage
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(LottieAssets.uploadFile, width: 160, height: 160),
                    Text(
                      'Aca veras tu $label...',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                )
              : imgBytes != null
                  ? Image.memory(imgBytes!, fit: fit)
                  : ImageApi(url!, fit: fit),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recomendations.isNotEmpty) ...[
              const Text('Recomendaciones:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 15),
              ...recomendations.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text('- $e'),
                ),
              ),
              const SizedBox(height: 15),
            ],
            Wrap(
              children: [
                ElevatedButton.icon(
                  label: isLoading
                      ? const LoadingWidget()
                      : Text(notHasImage ? 'Subir $label' : 'Reemplazar $label'),
                  icon: const Icon(Icons.upload_file),
                  onPressed: isLoading
                      ? null
                      : notHasImage
                          ? onUpload
                          : onReplace,
                ),
                if (hasImage) ...[
                  const SizedBox(width: 15),
                  TextButton.icon(
                    label: isLoading ? const LoadingWidget() : Text('Eliminar $label'),
                    icon: const Icon(Icons.delete),
                    onPressed: isLoading ? null : onRemove,
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                  ),
                ]
              ],
            ),
          ],
        ),
      ],
    );
  }
}
