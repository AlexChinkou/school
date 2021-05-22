class CarouselModel {
  String image;
  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();
var carouselsData = [
  {"image": "assets/images/1.jpg"},
  {"image": "assets/images/2.jpg"},
  {"image": "assets/images/3.jpg"},
  {"image": "assets/images/4.jpg"},
  {"image": "assets/images/5.jpg"},
];
