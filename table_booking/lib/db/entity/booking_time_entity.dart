import 'package:floor/floor.dart';

@Entity()
class BookingTimeEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String startTime;
  final String endTime;

  BookingTimeEntity(this.id, this.startTime, this.endTime);
}
