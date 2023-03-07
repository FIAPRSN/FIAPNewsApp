# FIAPNews
### _25MOB [345346, 344548, 343951, 343956]_

![flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white) [![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg?style=for-the-badge)](https://pub.dev/packages/very_good_analysis)

FIAPNews - Aplicativo feito para o trabalho final da matéria de Flutter lecionada por Marcelo Pinheiro, 
onde é possivel por meio de consumo de API a exibição das noticias mais impactantes do momento.

https://user-images.githubusercontent.com/11656986/223294167-dba0a5c8-741f-461e-acff-0cf8b0178256.mp4

![img1](https://i.ibb.co/c6yDZF4/image.png) ![img2](https://i.ibb.co/dgNPfRb/image.png) ![img3](https://i.ibb.co/LhQt7W5/image.png)

## Features

- Login e cadastro gerenciado pelo firebase, com tratamento de Exceptions
- Exibição das noticias em formato de lista, com imagens e breve descrição
- Possibilidade de abrir o navegador ao clicar na noticia
- Tema escuro
- Possibilidade de alterar a chamada da API ao seu gosto (explicações abaixo)

## API e Manipulação

A API utilizada nesta aplicação é a [NewsAPI], agregadora de noticias globais com diversos parametros a 
serem escolhidos de acordo com o que é preciso. Alguns parametros como país, linguagem e categorias porem 
ser utilizadas para personalizar a experiência, tornando esta uma das melhores APIs para este fim. 

Para manipular a resposta da API no aplicativo, basta alterar o arquivo utils de acordo com a sua 
chave e os parametros que desejar:

![utils](https://i.ibb.co/kJB1HTB/image.png)


## Pacotes


| Pacote | Descrição | Descrição |
| ------ | ------ | ------ |
| firebase_auth | Necessário para controle de acesso | [Firebase Auth]
| firebase_core | Necessário para controle de acesso | [Firebase Core]
| get | Controle de Rotas, Storage e muito mais | [Get]
| google_fonts | Fontes customizadas | [Google Fonts]
| http | Usado para a comunicação com a API | [HTTP]
| url_launcher | Permite a abertura de URL em um Browser | [URL Launcher]
| very_good_analysis | Linter especial para Flutter criado pela Very Good Ventures | [Very Good Analysis]

## Desenvolvimento

Os campos utilizados nas telas de Login e Cadastro, além dos botões e as mensagens informativas (SnackBar) 
foram criados com o reaproveitamento em mente, reduzindo código que seria duplicado em diversas telas

![widget](https://i.ibb.co/ZHw1ccR/image.png)

O projeto em si tambem foi separado em pastas de forma que cada uma possui uma função, como:

![tree](https://i.ibb.co/2k0SQTf/image.png)

- Auth: Função de redirecionar durante o login/cadastro/verificar acesso
- Widgets: Widgets que foram reaproveitados
- View: Paginas visiveis do aplicativo

E assim por diante, garantindo maior organização do código.

## Controle de Acesso

Todo o controle de acesso ao aplicativo é realizado pelo Firebase (Google).
É disponibilizado ao usuário uma tela de Cadastro/Login para a identificação, contendo mensagens dinâmicas 
e de facil entendimento (vermelho para erro, verde para positivo) de acordo coma mensagem recebida pelo Firebase:

![login](https://i.ibb.co/sHKHX60/image.png)

## Outros

É possivel a utilização do aplicativo com o tema escuro de acordo com a opção selecionada no dispositivo:

![tema](https://i.ibb.co/80Zm344/image.png)


[//]: #
[Firebase Auth]: <https://pub.dev/packages/firebase_auth>
[Firebase Core]: <https://pub.dev/packages/firebase_core>
[Get]: <https://pub.dev/packages/get>
[Google Fonts]: <https://pub.dev/packages/google_fonts>
[HTTP]: <https://pub.dev/packages/https>
[URL Launcher]: <https://pub.dev/packages/url_launcher>
[Very Good Analysis]: <https://pub.dev/packages/very_good_analysis>
[NewsAPI]: <https://newsapi.org/>
