import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/provider/Cart%20Provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartprovider);
       final Cartprovider = ref.read(cartprovider.notifier);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 118,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/cartb.png',
                  ),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                left: 322,
                top: 52,
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("object==>>$cartData");
                      },
                      icon: Badge.count(
                        count: cartData.length,
                        child: Image.asset(
                          'assets/not.png',
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 61,
                  top: 51,
                  child: Text(
                    "My Cart",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  )),
            ],
          ),
        ),
      ),
      body: cartData.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Your Shopping Cart is empty \n You can add product to your cart from the button below",
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      letterSpacing: 1.7,
                    ),
                  ),
                ),
                TextButton(onPressed: () {}, child: Text("Shop Now"))
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 49,
                  //   clipBehavior: Clip.hardEdge,
                  //   decoration: BoxDecoration(),
                  //   child: Stack(
                  //     clipBehavior: Clip.none,
                  //     children: [
                  //       Positioned(
                  //         left: 0,
                  //         top: 0,
                  //         child: Container(
                  //           width: MediaQuery.of(context).size.width,
                  //           height: 49,
                  //           clipBehavior: Clip.hardEdge,
                  //           decoration: BoxDecoration(color: Color(0xFFD7DDFF)),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         left: 44,
                  //         top: 19,
                  //         child: Container(
                  //           height: 10,
                  //           width: 10,
                  //           clipBehavior: Clip.hardEdge,
                  //           decoration: BoxDecoration(
                  //             color: Colors.black,
                  //             borderRadius: BorderRadius.circular(5)
                  //           ),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         top: 69,
                  //         left: 6,
                  //         child: Text("You Have ${cartData.length} Items in the Cart",
                  //         style: GoogleFonts.lato(
                  //           color: Colors.red,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //           letterSpacing: 1.7
                  //           ),)
                  //         )
                  //     ],
                  //   ),
                  // )

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(8),
                    color: Color(0xFFD7DDFF),
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Spacer(),
                        Text(
                          "You Have ${cartData.length} Items in the Cart",
                          style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.7),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartData.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartData.values.toList()[index];
                        return Card(
                          child: SizedBox(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                    cartItem.image[0],
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.productName,
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        cartItem.category,
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "\$${cartItem.productPrice.toStringAsFixed(2)}",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.pink,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 120,
                                            decoration: const BoxDecoration(
                                                color: Color(0xFF102DE1)),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      CupertinoIcons.minus,
                                                      color: Colors.white,
                                                    )),
                                                Text(
                                                  cartItem.Quantity.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    CupertinoIcons.plus,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          CupertinoIcons.delete,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
    );
  }
}
