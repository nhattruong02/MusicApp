import 'dart:async';

import 'package:musicapp/data/model/song.dart';
import 'package:musicapp/data/repository/repository.dart';

class MusicAppViewModel {
  StreamController<List<Song>> songStream = StreamController();
  void loadSongs() {
    final repository = DefaultRepository();
    repository.loadData().then((value) => songStream.add(value!));
  }
}
