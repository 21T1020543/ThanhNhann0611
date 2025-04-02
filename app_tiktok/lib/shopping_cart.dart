import 'package:app_tiktok/enity/my_product.dart';
import 'package:flutter/material.dart';

class ItemInCart {
  final MyProduct product;
  int quantity;

  ItemInCart({
    required this.product,
    this.quantity = 1,
  });

  /// Tính tổng giá trị cho sản phẩm này
  double getTotalPrice() {
    return product.price * quantity;
  }
}

class ShoppingCart {
  final List<ItemInCart> items = [];
  final ValueNotifier<int> totalQuantityNotifier = ValueNotifier(0);

  /// Thêm sản phẩm vào giỏ hàng
  void addProduct(MyProduct product, {int quantity = 1}) {
    var existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ItemInCart(product: product, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity += quantity;
    } else {
      items.add(ItemInCart(product: product, quantity: quantity));
    }
    _updateTotalQuantity();
  }

  /// Xóa sản phẩm khỏi giỏ hàng
  void removeProduct(MyProduct product) {
    items.removeWhere((item) => item.product.id == product.id);
    _updateTotalQuantity();
  }

  /// Thay đổi số lượng sản phẩm trong giỏ hàng
  void updateQuantity(MyProduct product, int quantity) {
    var existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ItemInCart(product: product, quantity: 0),
    );

    if (quantity <= 0) {
      removeProduct(product);
    } else {
      existingItem.quantity = quantity;
    }
    _updateTotalQuantity();
  }

  /// Tính tổng giá trị của giỏ hàng
  double getTotalPrice() {
    return items.fold(0, (total, item) => total + item.getTotalPrice());
  }

  /// Lấy tổng số lượng sản phẩm trong giỏ hàng
  int getTotalQuantity() {
    return items.fold(0, (total, item) => total + item.quantity);
  }

  /// Xóa toàn bộ giỏ hàng
  void clearCart() {
    items.clear();
    _updateTotalQuantity();
  }

  /// Kiểm tra xem giỏ hàng có rỗng không
  bool isEmpty() {
    return items.isEmpty;
  }

  void _updateTotalQuantity() {
    totalQuantityNotifier.value = getTotalQuantity();
  }
}

var spc = ShoppingCart();

/// Hàm thêm sản phẩm vào giỏ hàng và hiển thị thông báo
void addToCart(MyProduct product, BuildContext context, {int quantity = 1}) {
  spc.addProduct(product, quantity: quantity);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${product.title} đã được thêm vào giỏ hàng!'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Xem giỏ hàng',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShoppingCartScreen(),
            ),
          );
        },
      ),
    ),
  );
}

/// Màn hình hiển thị giỏ hàng
class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: spc.totalQuantityNotifier,
      builder: (context, totalQuantity, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Giỏ hàng'),
            backgroundColor: Colors.white,
          ),
          body: spc.isEmpty()
              ? const Center(
                  child: Text('Giỏ hàng trống', style: TextStyle(fontSize: 16)),
                )
              : ListView.builder(
                  itemCount: spc.items.length,
                  itemBuilder: (context, index) {
                    var item = spc.items[index];
                    return ListTile(
                      leading: Image.network(
                        item.product.image,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        item.product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tổng: \$${item.getTotalPrice().toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.remove, color: Colors.red),
                                onPressed: () {
                                  spc.updateQuantity(
                                      item.product, item.quantity - 1);
                                },
                              ),
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.green),
                                onPressed: () {
                                  spc.updateQuantity(
                                      item.product, item.quantity + 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          spc.removeProduct(item.product);
                        },
                      ),
                    );
                  },
                ),
          bottomNavigationBar: spc.isEmpty()
              ? null
              : Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey[900],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng: \$${spc.getTotalPrice().toStringAsFixed(2)}',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          spc.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Đã thanh toán giỏ hàng!')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        child: const Text('Thanh toán'),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

/// Trang chính hiển thị nút giỏ hàng
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm'),
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: spc.totalQuantityNotifier,
            builder: (context, totalQuantity, _) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingCartScreen(),
                        ),
                      );
                    },
                  ),
                  if (totalQuantity > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '$totalQuantity',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
            );
          },
          child: const Text('Xem sản phẩm'),
        ),
      ),
    );
  }
}
