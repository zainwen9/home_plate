import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
        name: "Mixed Fried Meat",
        subTitle: "With Spicy Chicken",
        price: 15.00,
        quantity: 1,
        imageUrl: 'assets/friedchicken.png'),
    CartItem(
        name: "Mixed Chicken",
        subTitle: "With Spicy Sox",
        price: 18.00,
        quantity: 1,
        imageUrl: 'assets/mixedchicken.png'),
    CartItem(
        name: "Fried Meat",
        subTitle: "With French Fries",
        price: 20.00,
        quantity: 1,
        imageUrl: 'assets/friedchicken.png'),
  ];

  double deliveryFee = 4.0;
  double tax = 5.0;

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  double get total => subtotal + tax + deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor:const Color.fromRGBO(246, 246, 246, 1),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon:const Icon(Icons.arrow_back),
        ),
        centerTitle: false,
        title: Text(
          'My Cart',
          style:
          GoogleFonts.aoboshiOne(fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  cartItem: cartItems[index],
                  onQuantityChanged: (quantity) {
                    setState(() {
                      cartItems[index].quantity = quantity;
                      if (cartItems[index].quantity == 0) {
                        cartItems.removeAt(index);
                      }
                    });
                  },
                  onRemoveItem: () {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SlideAction(
                borderRadius: 18,
                elevation: 0,
                outerColor:const Color(0xFFFFFFFF),
                innerColor:const Color(0xFFE29A4F),
                sliderButtonIcon: Text('Apply',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                text: 'Voucher Code',
                textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 16,color:const Color(0xFF000000).withOpacity(0.15), ),
                sliderRotate: false,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),),
                        Row(
                          children: [
                            Text('\$ ',style: GoogleFonts.aoboshiOne(fontSize: 14,color: Colors.green),),
                            Text(subtotal.toStringAsFixed(2),style: GoogleFonts.aoboshiOne(fontSize: 16),),
                          ],
                        ),

                      ],
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax and Fees',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),),
                        Row(
                          children: [
                            Text('\$ ',style: GoogleFonts.aoboshiOne(fontSize: 14,color: Colors.green),),
                            Text(tax.toStringAsFixed(2),style: GoogleFonts.aoboshiOne(fontSize: 16),),
                          ],
                        ),

                      ],
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Fees',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),),
                        Row(
                          children: [
                            Text('\$ ',style: GoogleFonts.aoboshiOne(fontSize: 14,color: Colors.green),),
                            Text(deliveryFee.toStringAsFixed(2),style: GoogleFonts.aoboshiOne(fontSize: 16),),
                          ],
                        ),

                      ],
                    ),


                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),),
                        Row(
                          children: [
                            Text('\$ ',style: GoogleFonts.aoboshiOne(fontSize: 14,color: Colors.green),),
                            Text(total.toStringAsFixed(2),style: GoogleFonts.aoboshiOne(fontSize: 16),),
                          ],
                        ),

                      ],
                    ),
                    //SizedBox(height: 40),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFE29A4F),
              ),
              child: Center(
                child: Text('Checkout',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w400,color: const Color(0xFFFFFFFF)),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemoveItem;

  const CartItemWidget(
      {super.key, required this.cartItem,
        required this.onQuantityChanged,
        required this.onRemoveItem});

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  void _increaseQuantity() {
    widget.onQuantityChanged(widget.cartItem.quantity + 1);
  }

  void _decreaseQuantity() {
    if (widget.cartItem.quantity > 0) {
      widget.onQuantityChanged(widget.cartItem.quantity - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(widget.cartItem.imageUrl,
                      width: 100, height: 80),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cartItem.name,
                        style: GoogleFonts.aoboshiOne(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        widget.cartItem.subTitle,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$',
                            style: GoogleFonts.aoboshiOne(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.cartItem.price.toStringAsFixed(2),
                            style: GoogleFonts.aoboshiOne(
                              fontSize: 14,
                              color:const Color(0xFFE29A4F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor:const Color(0xFFE29A4F),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon:const Icon(
                            Icons.remove,
                            size: 15,
                          ),
                          onPressed: _decreaseQuantity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        widget.cartItem.quantity.toString(),
                        style: GoogleFonts.aoboshiOne(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color:const Color(0xFFE29A4F),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor:const Color(0xFFE29A4F),
                      child: IconButton(
                        icon:const Icon(
                          Icons.add,
                          size: 15,
                        ),
                        onPressed: _increaseQuantity,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: widget.onRemoveItem,
                  child:const Icon(
                    size: 18,
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final String subTitle;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem(
      {required this.name,
        required this.subTitle,
        required this.price,
        required this.quantity,
        required this.imageUrl});
}
