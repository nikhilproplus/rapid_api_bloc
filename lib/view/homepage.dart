import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rapid_api_bloc/bloc/api/api_call_bloc.dart';
import 'package:rapid_api_bloc/bloc/api/api_call_event.dart';
import 'package:rapid_api_bloc/bloc/api/api_call_state.dart';
import 'package:rapid_api_bloc/bloc/cart/cart_bloc.dart';
import 'package:rapid_api_bloc/bloc/cart/cart_event.dart';
import 'package:rapid_api_bloc/model/model.dart';
import 'package:rapid_api_bloc/view/cart_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context.read<ApiBloc>().add(ApiLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShoeMart'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const CartScreen());
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          return state is ApiLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is ApiSuccessState
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: searchController,
                              decoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Enter your search query',
                                prefixIcon: const Icon(Icons.search),
                                border: const OutlineInputBorder(),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<ApiBloc>().add(
                                          ApiSearchEvent(
                                              searchController.text));
                                    },
                                    child: const Text('search'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: state.saveData.first!.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var items = state.saveData.first!.data[index];

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
                                          items.productPhotos.first,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  if (items.productRating !=
                                                      null)
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 24,
                                                    ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    items.productRating
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            items.productDescription,
                                            maxLines: 6,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                context.read<CartBloc>().add(
                                                    CartItemAddedEvent(items));
                                                //  Get.to((() => const CartScreen()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.deepPurple,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12),
                                                child: Text(
                                                  'Add to Cart',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : state is ApiFailedState
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('failed to fetch data'),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<ApiBloc>()
                                        .add(ApiLoadingEvent());
                                  },
                                  icon: const Icon(Icons.replay_outlined))
                            ],
                          ),
                        )
                      : const SizedBox();
        },
      ),
    );
  }
}
