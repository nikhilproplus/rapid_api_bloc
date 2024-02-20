import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_api_bloc/bloc/cart/cart_bloc.dart';
import 'package:rapid_api_bloc/bloc/cart/cart_event.dart';
import 'package:rapid_api_bloc/bloc/cart/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My cart'),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        return state is CartItemAddedState
            ? SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: state.saveData.length,
                    itemBuilder: (BuildContext context, int index) {
                      var items = state.saveData[index];
                      return Card(
                        elevation: 8,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Image.network(
                                  items!.productPhotos.first,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items.productTitle,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          if (items.productRating != null)
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 24,
                                            ),
                                          const SizedBox(width: 8),
                                          Text(
                                            items.productRating.toString(),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            context.read<CartBloc>().add(
                                                CartItemRemovedEvent(index));
                                          },
                                          icon: const Icon(
                                              Icons.delete_outline_outlined))
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            : const Center(child: Text('Your cart is empty!'));
      }),
    );
  }
}
