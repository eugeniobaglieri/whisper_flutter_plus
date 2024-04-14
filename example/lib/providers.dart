import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whisper_flutter_plus/whisper_flutter_plus.dart';

final modelProvider = StateProvider.autoDispose((ref) => WhisperModel.baseEn);

final langProvider = StateProvider.autoDispose((ref) => 'id');

final translateProvider = StateProvider((ref) => false);

final withSegmentsProvider = StateProvider((ref) => false);

final splitWordsProvider = StateProvider((ref) => false);
