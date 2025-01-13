import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/config/color/color.dart';
import 'package:provider_mvvm/config/components/large_view__image.dart';
import 'package:provider_mvvm/view_model/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<HomeViewModel>().fetchMoviesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 2,
        forceMaterialTransparency: true,
        title: const Text(
          "Movies",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "New"),
            Tab(text: "Popular"),
            Tab(text: "Past"),
          ],
          indicatorColor: AppColor.black,
          labelColor: AppColor.black,
          unselectedLabelColor: AppColor.grey,
        ),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, _) {
          if (kDebugMode) {
            print("Loading: ${value.isLoading}");
            print("Movies List: ${value.moviesList}");
          }

          if (value.isLoading || value.moviesList == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final moviesList = value.moviesList?["tv_shows"];
          if (moviesList == null) {
            return const Center(
              child: Text("No movies available"),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildMoviesList(moviesList),
              const Center(
                child: Text("Popular Movies Placeholder"),
              ),
              const Center(
                child: Text("Past Movies Placeholder"),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMoviesList(List<dynamic> movies) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => ImageView.showLargeImage(
                    context, movie["image_thumbnail_path"]),
                child: Image.network(
                  movie["image_thumbnail_path"].toString(),
                  height: height / 6,
                  width: width / 4,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),
              // Movie Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie["name"].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie["country"] ?? "Unknown Country",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                   Text(
                    movie["start_date"]??"",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        i < 4 ? Icons.star : Icons.star_border,
                        color: AppColor.amber,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
