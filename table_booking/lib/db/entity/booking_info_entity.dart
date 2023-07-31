import 'package:floor/floor.dart';

@Entity()
class BookingInfoEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final int bookingTimeId;
  final int startDate;
  final int endDate;
  final int tableId;
  final int createdDate;
  int updatedDate;

  BookingInfoEntity(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.bookingTimeId,
    this.startDate,
    this.endDate,
    this.tableId,
    this.createdDate,
    this.updatedDate,
  );
}
