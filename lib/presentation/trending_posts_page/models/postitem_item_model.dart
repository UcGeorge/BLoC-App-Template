/// This class is used in the [postitem_item_widget] screen.
class PostitemItemModel {
  PostitemItemModel({
    this.rizalReynaldhi,
    this.duration,
    this.description,
    this.bali,
    this.dreams,
    this.zipcode,
    this.eightHundred,
    this.id,
  }) {
    rizalReynaldhi = rizalReynaldhi ?? "Rizal Reynaldhi";
    duration = duration ?? "35 minutes ago";
    description = description ??
        "Vacation to Bali is my biggest dream because I want to enjoy the beauty of the beach called Kute, hopefully my dream will come true";
    bali = bali ?? "#Bali";
    dreams = dreams ?? "#dreams";
    zipcode = zipcode ?? "2200";
    eightHundred = eightHundred ?? "800";
    id = id ?? "";
  }

  String? rizalReynaldhi;

  String? duration;

  String? description;

  String? bali;

  String? dreams;

  String? zipcode;

  String? eightHundred;

  String? id;
}
