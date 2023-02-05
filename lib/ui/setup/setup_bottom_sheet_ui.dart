import 'package:buypower_clone/app/app.locator.dart';
import 'package:buypower_clone/enums/bottom_sheet_type.dart';
import 'package:buypower_clone/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

typedef BottomSheetBuilder = Widget Function(
  BuildContext context,
  SheetRequest<dynamic> sheetRequest,
  void Function(SheetResponse<dynamic> sheetResponse) completer,
);

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final Map<dynamic, BottomSheetBuilder> builders = {
    BottomSheetType.notice: (context, sheetRequest, completer) =>
        NoticeSheet(completer: completer, request: sheetRequest),
    // @stacked-bottom-sheet-builder
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
