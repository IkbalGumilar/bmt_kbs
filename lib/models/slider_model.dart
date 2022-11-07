class SliderModel {
  late String? image;
  late String? title;
  late String? description;

  SliderModel({this.image, this.title, this.description});

  void setImageAssetPath(String getImageAssetPath) {
    image = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImage() {
    return image!;
  }

  String getTitle() {
    return title!;
  }

  String getDescriptiion() {
    return description!;
  }
}

List<SliderModel>? getSlides() {
  List<SliderModel> slides = List<SliderModel>.empty(growable: true);
  SliderModel sliderModel = SliderModel();

  // item 1
  sliderModel.setImageAssetPath("assets/img/introduction/image1.png");
  sliderModel
      .setTitle("Aplikasi finansial dan dompet digital terbaik hari ini");
  sliderModel.setDescription(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae in vitae nisl ipsum aliquet donec. Augue vestibulum sapien faucibus sed arcu purus.");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  // item 2
  sliderModel.setImageAssetPath("assets/img/introduction/image1.png");
  sliderModel.setTitle("BMT KBS");
  sliderModel.setDescription(
      "BMT KBS is a mobile application that provides information about the BMT KBS");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  // item 3
  sliderModel.setImageAssetPath("assets/img/introduction/image1.png");
  sliderModel.setTitle("BMT KBS");
  sliderModel.setDescription(
      "BMT KBS is a mobile application that provides information about the BMT KBS");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}
