import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun88/data/logic/cubit/select_tab_cubit/select_tab_cubit.dart';
import 'package:fun88/presentation/jackpot_screen/jackpots_screen.dart';
import 'package:fun88/presentation/new_screen/new_screen.dart';
import 'package:fun88/presentation/others_screen/others_screen.dart';
import 'package:fun88/presentation/slot_screen/slots_screen.dart';
import 'package:fun88/presentation/start_screen/start_screen.dart';
import 'package:fun88/presentation/table_games_screen/table_games_screen.dart';
import 'package:fun88/widgets/auto_size_intertext.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = -1; // State variable
  bool showSearchBar = false;
  bool isBookmarked = false;

  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  List<String> filteredImages = [];

  List<HeaderItem> headerItems = [
    HeaderItem(icon: Icons.whatshot, label: "START"),
    HeaderItem(icon: Icons.new_label, label: "NEW"),
    HeaderItem(icon: Icons.account_balance_wallet, label: "SLOTS"),
    HeaderItem(icon: Icons.live_help, label: "LIVE"),
    HeaderItem(icon: Icons.casino, label: "JACKPOTS"),
    HeaderItem(icon: Icons.gamepad, label: "TABLE GAMES"),
    HeaderItem(icon: Icons.sports_esports, label: "BINGO"),
    HeaderItem(icon: Icons.dashboard, label: "OTHERS"),
  ];

  List<String> filteredImagesForTab(int tabIndex, String query) {
    final images = getImagesForTab(tabIndex);

    // If no filters selected, show all images for the tab
    if (selectedProviders.isNotEmpty) {
      // Filter images by provider codes —
      // assume your image paths have the provider code in the filename, e.g. "EM_crocodile.webp"
      final providerFilteredImages = images.where((img) {
        for (var provider in selectedProviders) {
          if (img.toLowerCase().contains(provider.toLowerCase())) {
            return true;
          }
        }
        return false;
      }).toList();

      if (query.isEmpty) return providerFilteredImages;

      return providerFilteredImages.where((img) {
        return img.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      // No filter selected
      if (query.isEmpty) return images;

      return images.where((img) {
        return img.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  Set<String> selectedProviders = {};

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => SelectTabCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          shadowColor: Colors.black.withOpacity(
            0.8,
          ), // optional, custom shadow color
          backgroundColor:
              Colors.white, // keep background solid so shadow is visible
          leading: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: SvgPicture.network(
              "https://fun88-six.vercel.app/assets/header/menu.svg",
              width: 25,
            ),
            onPressed: () {
              // Handle menu button press
            },
          ),
          title: SvgPicture.network(
            "https://fun88-six.vercel.app/assets/header/fun88.svg",
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: SvgPicture.network(
                    "https://fun88-six.vercel.app/assets/header/wallet.svg",
                  ),
                  onPressed: () {},
                ),
                AutoSizeInterText(
                  text: "\$1,990.6",
                  fontSize: 16,
                  color: Colors.blue,
                  fw: FontWeight.bold,
                  maxLines: 1,
                  align: TextAlign.center,
                ),
                const Gap(10),
                SvgPicture.network(
                  "https://fun88-six.vercel.app/assets/header/divider.svg",
                ),
                const Gap(10),
                SvgPicture.network(
                  "https://fun88-six.vercel.app/assets/header/user.svg",
                ),
                const Gap(10),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: s.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(10),
                SizedBox(
                  width: s.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/banner-bg.png",
                          width: s.width,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: s.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeInterText(
                              text: "RESCUE",
                              fontSize: 16,
                              color: Colors.white,
                              fw: FontWeight.bold,
                              maxLines: 1,
                              align: TextAlign.center,
                            ),
                            const Gap(20),
                            AutoSizeInterText(
                              text: "BONUS",
                              fontSize: 16,
                              color: Colors.yellow,
                              fw: FontWeight.bold,
                              maxLines: 1,
                              align: TextAlign.center,
                            ),
                            const Gap(20),
                            AutoSizeInterText(
                              text: "WE ARE HERE\nFOR YOU",
                              fontSize: 16,
                              color: Colors.white,
                              fw: FontWeight.bold,
                              maxLines: 2,
                              align: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      "https://fun88-six.vercel.app/assets/bell.svg",
                      width: 20,
                    ),
                    const Gap(10),
                    AutoSizeInterText(
                      text: "¡FELICIDADES artxxxxipa! GANADOR DESTACADO",
                      fontSize: 12,
                      color: Colors.blue,
                      fw: FontWeight.normal,
                      maxLines: 2,
                      align: TextAlign.center,
                    ),
                  ],
                ),
                const Gap(10),

                Column(
                  children: [
                    SizedBox(
                      width: s.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showSearchBar = !showSearchBar;
                                selectedIndex = -1;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: showSearchBar
                                        ? Colors.blue
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 20,
                                    color: showSearchBar
                                        ? Colors.blue
                                        : const Color(0xFF888888),
                                  ),
                                  AutoSizeInterText(
                                    text: "SEARCH",
                                    fontSize: 12,
                                    color: showSearchBar
                                        ? Colors.blue
                                        : const Color(0xFF888888),
                                    fw: FontWeight.bold,
                                    maxLines: 1,
                                    align: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(10),
                          SvgPicture.network(
                            "https://fun88-six.vercel.app/assets/header/divider.svg",
                          ),
                          const Gap(10),
                          SizedBox(
                            width: s.width - 100, // Adjust width as needed
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: BlocBuilder<SelectTabCubit, SelectTabState>(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      context.read<SelectTabCubit>().toggle(0);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // 🏷 HEADER ITEMS
                                        ...headerItems.asMap().entries.map((
                                          entry,
                                        ) {
                                          int index = entry.key;
                                          var item = entry.value;
                                          bool isSelected =
                                              index == state.selectIndex;

                                          return Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<SelectTabCubit>()
                                                      .toggle(index);
                                                  if (!showSearchBar) {
                                                    setState(() {
                                                      showSearchBar = false;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: isSelected
                                                            ? Colors.blue
                                                            : Colors
                                                                  .transparent,
                                                        width: 2,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        item.icon,
                                                        size: 20,
                                                        color: isSelected
                                                            ? Colors.blue
                                                            : const Color(
                                                                0xFF888888,
                                                              ),
                                                      ),
                                                      AutoSizeInterText(
                                                        text: item.label,
                                                        fontSize: 12,
                                                        color: isSelected
                                                            ? Colors.blue
                                                            : const Color(
                                                                0xFF888888,
                                                              ),
                                                        fw: FontWeight.bold,
                                                        maxLines: 1,
                                                        align: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Gap(10),
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (showSearchBar) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Search games",
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                suffixIcon: searchQuery.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.clear,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            searchQuery = "";
                                            searchController.clear();
                                          });
                                        },
                                      )
                                    : null,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.tune, color: Colors.grey),
                              onPressed: () {
                                _showGameProviderSheet(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                    const Gap(20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1,
                          ),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            filteredImages[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),

                    BlocBuilder<SelectTabCubit, SelectTabState>(
                      builder: (context, state) {
                        final filteredImages = filteredImagesForTab(
                          state.selectIndex,
                          searchQuery,
                        );
                        if (state.selectIndex == 0) {
                          return StartScreen(
                            searchQuery: searchQuery,
                            images: filteredImages,
                          );
                        } else if (state.selectIndex == 1) {
                          return NewScreen(
                            images: filteredImages,
                            searchQuery: searchQuery,
                          );
                        } else if (state.selectIndex == 2) {
                          return SlotsScreen(
                            images: filteredImages,
                            searchQuery: searchQuery,
                          );
                        } else if (state.selectIndex == 3) {
                          return AutoSizeInterText(
                            text: "No games found",
                            fontSize: 14,
                            color: const Color(0xFF888888),
                            maxLines: 1,
                            align: TextAlign.center,
                          );
                        } else if (state.selectIndex == 4) {
                          return JackpotsScreen(
                            images: filteredImages,
                            searchQuery: searchQuery,
                          );
                        } else if (state.selectIndex == 5) {
                          return TableGamesScreen(
                            images: filteredImages,
                            searchQuery: searchQuery,
                          );
                        } else if (state.selectIndex == 6) {
                          return AutoSizeInterText(
                            text: "No games found",
                            fontSize: 14,
                            color: const Color(0xFF888888),
                            maxLines: 1,
                            align: TextAlign.center,
                          );
                        } else if (state.selectIndex == 7) {
                          return OthersScreen(
                            images: filteredImages,
                            searchQuery: searchQuery,
                          );
                        }
                        return StartScreen(
                          searchQuery: searchQuery,
                          images: filteredImages,
                        );
                      },
                    ),
                    const Gap(20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> images = [
    'assets/images/anaconda.webp',
    'assets/images/aztec.webp',
    'assets/images/beach.webp',
    'assets/images/big.webp',
    'assets/images/crocodile.webp',
    'assets/images/egypt.webp',
    'assets/images/inca.webp',
    'assets/images/maya.webp',
    'assets/images/pirates.webp',
    'assets/images/pride.webp',
    'assets/images/shaolin.webp',
    'assets/images/sugar.webp',
  ];

  List<String> getImagesForTab(int index) {
    switch (index) {
      case 0: // START
        return [
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/egypt.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/pirates.webp',
          'assets/images/pride.webp',
          'assets/images/shaolin.webp',
          'assets/images/sugar.webp',
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/egypt.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/pirates.webp',
          'assets/images/pride.webp',
          'assets/images/shaolin.webp',
          'assets/images/sugar.webp',
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/egypt.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/pirates.webp',
          'assets/images/pride.webp',
          'assets/images/shaolin.webp',
          'assets/images/sugar.webp',
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/egypt.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/pirates.webp',
          'assets/images/pride.webp',
          'assets/images/shaolin.webp',
          'assets/images/sugar.webp',
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/egypt.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/pirates.webp',
          'assets/images/pride.webp',
          'assets/images/shaolin.webp',
          'assets/images/sugar.webp',
        ];
      case 1: // NEW
        return [
          'assets/images/pride.webp',
          'assets/images/pride.webp',
          'assets/images/pride.webp',
          'assets/images/pride.webp',
          'assets/images/pride.webp',
        ];
      case 2: // SLOTS
        return [
          'assets/images/sugar.webp',
          'assets/images/sugar.webp',
          'assets/images/sugar.webp',
          'assets/images/sugar.webp',
          'assets/images/sugar.webp',
        ];
      case 3: // Live
        return [];
      case 4: // JACKPOTS
        return [
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
          'assets/images/anaconda.webp',
          'assets/images/aztec.webp',
          'assets/images/inca.webp',
          'assets/images/maya.webp',
        ];
      case 5: // TABLE GAMES
        return [
          'assets/images/egypt.webp',
          'assets/images/egypt.webp',
          'assets/images/egypt.webp',
          'assets/images/egypt.webp',
          'assets/images/egypt.webp',
        ];
      case 6: // BINGO
        return [];
      case 7: // OTHERS
        return [
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/pirates.webp',
          'assets/images/shaolin.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/pirates.webp',
          'assets/images/shaolin.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/pirates.webp',
          'assets/images/shaolin.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/pirates.webp',
          'assets/images/shaolin.webp',
          'assets/images/beach.webp',
          'assets/images/big.webp',
          'assets/images/crocodile.webp',
          'assets/images/pirates.webp',
          'assets/images/shaolin.webp',
        ];
      // dagdagan pa for other tabs
      default:
        return [];
    }
  }

  void _showGameProviderSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (context) {
        final List<String> gameProviderLogos = [
          'assets/images/EM.webp',
          'assets/images/EVO.webp',
          'assets/images/EXPANSE.webp',
          'assets/images/EZG.webp',
          'assets/images/GAMEART.webp',
          'assets/images/HAB.webp',
          'assets/images/HACKSAW.webp',
          'assets/images/INBET.webp',
          'assets/images/MPLAY.webp',
          'assets/images/NETENT.webp',
          'assets/images/PGSOFT.webp',
          'assets/images/PNG.webp',
          'assets/images/PP.webp',
          'assets/images/PRAGMATICPLAY.webp',
          'assets/images/PS.webp',
          'assets/images/PT.webp',
          'assets/images/REDTIGER.webp',
          'assets/images/RELAX.webp',
        ];

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              // ✅ Blue Header with white text and close icon
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.menu, color: Colors.white),
                        const Gap(8),
                        Text(
                          "Game Providers ",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: AutoSizeInterText(
                            text: "18",
                            fontSize: 14,
                            color: Colors.white,
                            fw: FontWeight.bold,
                            maxLines: 1,
                            align: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ✅ Scrollable GridView inside Expanded
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.builder(
                    itemCount: gameProviderLogos.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 2.7,
                        ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          gameProviderLogos[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HeaderItem {
  final IconData icon;
  final String label;

  HeaderItem({required this.icon, required this.label});
}
