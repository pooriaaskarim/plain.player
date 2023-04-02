import 'package:isar/isar.dart';

import '../../infrastructure/utils/app.utils.dart';
import 'model.track.dart';

part 'model.year.g.dart';

@Collection()
class Year {
  Year({
    required this.year,
  });
  Id get id => AppUtils.fastHash(year);
  @Index(
    unique: true,
    caseSensitive: false,
  )
  String year;
  @Backlink(to: 'year')
  IsarLinks<Track> tracks = IsarLinks<Track>();
}
