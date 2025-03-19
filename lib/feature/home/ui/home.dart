import 'package:assignment_project/core/routes/app_router.gr.dart';
import 'package:assignment_project/feature/home/ui/bloc/home_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
            image: const AssetImage("assets/house_image_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Homzes",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
            Expanded(child: Container()),
            const Text(
              "Find the best",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const Text(
              "place for you",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 160,
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color.fromARGB(0, 252, 168, 168),
                          child: Container(
                            height: 160,
                            width: 172,
                            decoration: BoxDecoration(
                                color: state.list[index].cardColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(state.list[index].icon)),
                                  Text(
                                    state.list[index].text,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      AutoRouter.of(context).push(const CatalogOne());
                    },
                    child: const Text(
                      "Create an account",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
