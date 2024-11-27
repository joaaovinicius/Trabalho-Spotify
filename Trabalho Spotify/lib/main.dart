import 'package:flutter/material.dart';

void main() {
  runApp(const SpotifyCloneApp());
}

class SpotifyCloneApp extends StatelessWidget {
  const SpotifyCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Clone',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de artistas
    final List<String> artists = [
      "Lady Gaga",
      "Anitta",
      "Nirvana",
      "Guns N' Roses",
      "Nelly Furtado",
      "Chitãozinho e Xororó",
    ];

    // Lista de músicas tocadas recentemente
    final List<String> recentSongs = [
      "Músicas Curtidas",
      "Dia de Faxina",
      "This Is Mundo Bita",
      "Cantando na Cozinha",
      "Músicas ambiente para estudar!",
    ];

    // Lista de imagens das músicas tocadas recentemente
    final List<String> recentImages = [
      "images/curtidas.png",
      "images/faxina.png",
      "images/bita.png",
      "images/cozinha.png",
      "images/ambiente.png",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boa noite', style: TextStyle(fontSize: 24)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.history)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção com álbuns/artistas em formato de grade 2x2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Duas colunas
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 3.5, // Controla a largura/altura
                ),
                itemCount: artists.length, // Quantidade de itens
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 40, // Tamanho da imagem
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: index == 0
                              ? Image.asset('images/Disease.png',
                                  fit: BoxFit.cover)
                              : index == 1
                                  ? Image.asset('images/anitta.png',
                                      fit: BoxFit.cover)
                                  : index == 2
                                      ? Image.asset('images/nirvana.jpg',
                                          fit: BoxFit.cover)
                                      : index == 3
                                          ? Image.asset('images/guns.jpg',
                                              fit: BoxFit.cover)
                                          : index == 4
                                              ? Image.asset('images/nelly.jpg',
                                                  fit: BoxFit.cover)
                                              : index == 5
                                                  ? Image.asset(
                                                      'images/chitao.jpg',
                                                      fit: BoxFit.cover)
                                                  : Container(
                                                      color: Colors.grey[700]),
                        ),
                        Expanded(
                          child: Text(
                            artists[index],
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Lançamento
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Novo Lançamento de Metallica',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('images/metalica.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: const Text(
                  'My Friend of Misery',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Single • Metallica'),
                trailing: const Icon(Icons.play_circle_fill, size: 36),
              ),
            ),

            // Tocados recentemente
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tocados recentemente',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentSongs.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(recentImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          recentSongs[index],
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          maxLines: 2, // Permite até 2 linhas
                          softWrap: true, // Habilita a quebra automática
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // MiniPlayer
          Container(
            color: Colors.grey[900],
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('images/legiao.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Quase Sem Querer - Legião Urbana',
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                ),
              ],
            ),
          ),
          // Bottom Navigation Bar
          BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Início',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'Sua Biblioteca',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
