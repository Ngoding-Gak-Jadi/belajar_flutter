import 'package:flutter/material.dart';
import '../services/profile_photo_service.dart';
import 'edit_photo_dialog.dart';

/// Shows the edit photo dialog, performs upload via ProfilePhotoService and
/// returns the resulting photoUrl (download URL or data URI) or null on cancel.
Future<String?> showPhotoEditor(BuildContext context) async {
  final choice = await showEditPhotoDialog(context);
  if (choice == null) return null;
  final service = ProfilePhotoService();
  return await service.pickUploadAndSave(choice);
}
