## Visão Geral
O Aplicativo de Jogo de Pedra, Papel e Tesoura em Flutter é uma implementação simples do popular jogo de decisão entre dois jogadores. Desenvolvido utilizando o framework Flutter, o aplicativo oferece uma experiência interativa e divertida para os usuários, permitindo que eles joguem contra o aplicativo em uma disputa rápida.

## Funcionalidades Principais
- Jogue pedra, papel e tesoura contra o aplicativo.
- Visualize a disputa atual com as escolhas dos jogadores.
- Acompanhe o placar para ver quem está ganhando.

## Requisitos de Sistema
- Dispositivos Android ou iOS.
- Flutter SDK instalado e configurado.
- Conexão com a internet para instalação e atualização do aplicativo.

## Instalação
1. Clone o repositório do GitHub do aplicativo: [link do repositório](https://github.com/brunaschneider/Pedrapapeltesoura.git)
2. Abra o projeto em um editor de código compatível com Flutter, como o Android Studio ou o Visual Studio Code.
3. Execute o comando `flutter pub get` para instalar todas as dependências do projeto.
4. Conecte um dispositivo físico ou inicie um emulador Android/iOS.
5. Execute o aplicativo com o comando `flutter run`.

## Como Jogar
1. Na tela principal do aplicativo, você verá a área de disputa com as escolhas dos jogadores.
2. Abaixo da área de disputa, você encontrará o placar, mostrando os pontos de cada jogador.
3. Para fazer uma jogada, toque em uma das opções disponíveis: pedra, papel ou tesoura.
4. O aplicativo fará sua escolha automaticamente, e o resultado será exibido na tela.
5. Continue jogando até atingir um número predeterminado de rodadas ou simplesmente divirta-se jogando.

## Estrutura do Código
- `main.dart`: Arquivo principal que inicia o aplicativo e define a tela principal.
- `ppt_game.dart`: Classe que implementa a lógica do jogo, incluindo a escolha aleatória do aplicativo e o cálculo do resultado.
- `ppt_screen.dart`: Classe que representa a tela principal do aplicativo, exibindo a interface do usuário e interagindo com a classe `PPTGame`.
- `badge.dart` e `placar.dart`: Classes que representam componentes reutilizáveis para exibir as escolhas dos jogadores e o placar.

## Licença
Este projeto é licenciado sob a [MIT License](https://github.com/brunaschneider/Pedrapapeltesoura/).
