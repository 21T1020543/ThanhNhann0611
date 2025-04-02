import 'package:app_tiktok/Ultis/api_service.dart';
import 'package:app_tiktok/enity/my_product.dart';
import 'package:app_tiktok/shopping_cart.dart';
import 'package:flutter/material.dart';

class MyShop extends StatefulWidget {
  const MyShop({super.key});

  @override
  State<MyShop> createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  late Future<List<MyProduct>> lsMyProducts;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = ""; // Biến lưu trữ truy vấn tìm kiếm

  @override
  void initState() {
    super.initState();
    lsMyProducts = APIService.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: Column(
        children: [
          myBottom(),
          Expanded(
            child: FutureBuilder<List<MyProduct>>(
              future: lsMyProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  var data = snapshot.data as List<MyProduct>;

                  // Filter the data based on the search query
                  var filteredData = data.where((product) {
                    return product.title.toLowerCase().contains(_searchQuery
                        .toLowerCase()); // Kiểm tra xem tiêu đề có chứa từ khóa tìm kiếm không
                  }).toList();

                  return myListView(filteredData); // Hien thi danh sach da loc
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget myListView(List<MyProduct> products) {
    return GridView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => myItem(products[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
    );
  }

  Widget myItem(MyProduct product) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Image.network(
                    product.image,
                    height: 150,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.flash_on, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Flash Sale",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(width: 5),
                Text(
                  "\$${product.price * 1.5}",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.yellow),
                Text(
                  product.rating.rate.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(width: 10),
                Text(
                  "Đã bán ${product.rating.count}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            actionButtons(product),
          ],
        ),
      ),
    );
  }

  Widget actionButtons(MyProduct product) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              print("Mua ngay: ${product.title}");
            },
            child: const Text(
              "Mua ngay",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.red),
              ),
            ),
            onPressed: () {
              print("Thêm vào giỏ hàng: ${product.title}");
              addToCart(product);
            },
            child: const Text(
              "Thêm vào giỏ hàng",
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: searchWidget(),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "/shopping_cart")
                  .then((_) => setState(() {})),
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
            if (spc.getTotalQuantity() > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    spc.getTotalQuantity().toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget searchWidget() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.search, color: Colors.red),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Tìm kiếm sản phẩm...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Icon(Icons.camera_alt_outlined, color: Colors.red),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              "Tìm kiếm",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget myBottom() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomItem(Icons.receipt_long, "Đơn hàng"),
          buildBottomItem(Icons.local_shipping_outlined, "Freeship"),
          buildBottomItem(Icons.attach_money_outlined, "Thưởng"),
          buildBottomItem(Icons.chat_bubble_outline, "Tin nhắn"),
        ],
      ),
    );
  }

  Widget buildBottomItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black, size: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      ],
    );
  }

  void addToCart(MyProduct product) {
    setState(() {
      spc.addProduct(
          product); // Assuming spc.addProduct adds the product to the cart
    });
  }
}
