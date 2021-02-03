class AvaliableTrip {
  final String tripId;
  final String productListDetail;
  final String data;
  final String address;
  bool open;


  AvaliableTrip({this.tripId, this.productListDetail, this.data, this.address,
      this.open});

  @override
  String toString() {
    return 'AvaliableTrip{tripId: $tripId, productListDetail: $productListDetail, data: $data, address: $address, open: $open}';
  }
}