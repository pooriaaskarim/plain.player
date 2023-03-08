import 'plain_actions_interface.dart';
import 'plain_playback_interface.dart';

abstract class PlainPlayerInterface {
  PlainPlaybackInterface createPlayback();
  PlainActionsInterface createPlainActions();
}
