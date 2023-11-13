/// This class is used in the [frame1_item_widget] screen.
class Frame1ItemModel {
  Frame1ItemModel({
    this.albertOConnor,
    this.duration,
    this.introduceIAmA,
    this.zipcode,
    this.eightHundred,
    this.id,
  }) {
    albertOConnor = albertOConnor ?? "Albert O’connor";
    duration = duration ?? "4  hours ago";
    introduceIAmA = introduceIAmA ??
        "Introduce I am a photographer who travels around the world everyday, these are some of my works as a photographer.";
    zipcode = zipcode ?? "2200";
    eightHundred = eightHundred ?? "800";
    id = id ?? "";
  }

  String? albertOConnor;

  String? duration;

  String? introduceIAmA;

  String? zipcode;

  String? eightHundred;

  String? id;
}
