
import 'package:belajar_flutter/data/manga/chapter/bokunohero/bokunohero.dart';
import 'package:belajar_flutter/data/manga/chapter/demonslayers/demonslayer.dart';
import 'package:belajar_flutter/data/manga/chapter/jujutsukaisen/jujutsukaisen.dart';
import 'package:belajar_flutter/data/manga/chapter/onepieces/onepiece_chapters.dart';
import 'package:belajar_flutter/data/manhua/chapter/battlethroughtheheavens/battlethroughttheheavens.dart';
import 'package:belajar_flutter/data/manhua/chapter/magicemperor/magicemperor.dart';
import 'package:belajar_flutter/data/manhua/chapter/talesofdemonsandgods/talesofdemonsandgods.dart';
import 'package:belajar_flutter/data/manhwa/chapter/sololeveling/sololeveling.dart';
import 'package:belajar_flutter/data/manhwa/chapter/thegotofhighschool/thegotofhighschool.dart';
import 'package:belajar_flutter/data/manhwa/chapter/windbreaker/windbreaker.dart';

import '../models/chapter.dart';

Map<String, List<Chapter>> allComicChapters = {
  ...onepieceChapters,
  ...jujutsukaisenChapters,
  ...demonslayerChapters,
  ...bokunoheroChapters,
  ...talesofdemonsandgodsChapters,
  ...battlethroughttheheavensChapters,
  ...magicemperorChapters,
  ...sololevelingChapters,
  ...thegotofhighschoolChapters,
  ...windbreakerChapters,
};

List<Chapter> getSampleChapters(String comicId) {
  return allComicChapters[comicId] ?? [];
}


