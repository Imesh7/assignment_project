import 'package:assignment_project/feature/catalog_one/data/dto/featured.dart';
import 'package:assignment_project/feature/catalog_one/data/dto/new_offers.dart';
import 'package:assignment_project/feature/catalog_one/ui/bloc/catalog_one_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment_project/core/routes/app_router.gr.dart';

@RoutePage()
class CatalogOne extends StatefulWidget {
  const CatalogOne({super.key});

  @override
  State<CatalogOne> createState() => _CatalogOneState();
}

class _CatalogOneState extends State<CatalogOne> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CatalogOneBloc>(context).add(InitialCatalogOneEvent());
    super.initState();
  }

  late List<Featured> featuredList;
  late List<NewOffers> newOffersList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CatalogOneBloc, CatalogOneState>(
      builder: (context, state) {
        if (state is SuccessCatalogOneState) {
          featuredList = state.featuredList;
          newOffersList = state.newOffersList;
        } else if (state is LoadingCatalogOneState) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
          );
        } else if (state is FailedCatalogOneState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(state.errorMessage),
              ),
            ),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              pinned: true,
              expandedHeight: 150.0,
              backgroundColor: const Color(0xffF0F298),
              leading: IconButton(
                icon: const Icon(Icons.menu,
                    color: Colors.black), // Menu icon always in leading
                onPressed: () {},
              ),
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  double percentage =
                      ((constraints.maxHeight - kToolbarHeight) /
                              (200 - kToolbarHeight))
                          .clamp(0.0, 1.0);

                  return Stack(
                    children: [
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 100,
                        child: Opacity(
                          opacity: percentage,
                          child: _buildAvatar(),
                        ),
                      ),
                      Positioned(
                        left: 56,
                        right: 16,
                        bottom: 20 * percentage,
                        child: _buildSearchBar(),
                      ),
                    ],
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Featured",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const CatalogThree());
                        },
                        child: const Text("View all"))
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220, // Set the height for the horizontal list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredList.length,
                  itemBuilder: (context, index) {
                    return _buildApartmentCard(featuredList[index]);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("New offers",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const CatalogThree());
                        },
                        child: const Text("View all"))
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildRealEstateCard(newOffersList[index]),
                childCount: newOffersList.length,
              ),
            ),
          ],
        );
      },
    ));
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        canRequestFocus: false,
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Hi, Stanislav"),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
        ),
      ],
    );
  }

  Widget _buildApartmentCard(Featured featured) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width:
                  MediaQuery.of(context).size.width / 2.8, // Width of each card
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  const BoxShadow(
                      color: Colors.black12, blurRadius: 5, spreadRadius: 2),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: featured.image!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/house_image_1.png"),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            featured.price!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                featured.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRealEstateCard(NewOffers newOffers) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: newOffers.image!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/house_image_1.png"),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      newOffers.price!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    newOffers.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.green, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        newOffers.stars.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        newOffers.reviews.toString(),
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
