class ExclusiveItem {
  final String icon;
  final String offer;
  final String label;
  final String price;

  ExclusiveItem({
    required this.icon,
    required this.offer,
    required this.label,
    required this.price,
  });
}

class ExclusiveData {
  final List<ExclusiveItem> _exclusiveData = [
    ExclusiveItem(icon: "http://devapiv4.dealsdray.com/icons/Image%204.png", offer: "21%", label: "Realme 2 Pro(Black,Sea,64 GB)", price: "₹ 9,999"),
    ExclusiveItem(icon: "http://devapiv4.dealsdray.com/icons/Image%20-41.png", offer: "25%", label: "Realme 3i (Diamond Red,64 GB) (4 GB...)", price: "₹ 8,999"),
    ExclusiveItem(icon: "http://devapiv4.dealsdray.com/icons/Image%207.png", offer: "39%", label: "Realme 2 Pro(Black,Sea,64 GB)", price: "₹ 11,999"),
  ];

  List<ExclusiveItem> get exclusiveData => _exclusiveData;
}
