-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 20/09/2017 às 22:08
-- Versão do servidor: 10.1.26-MariaDB
-- Versão do PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `supremefilmes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id_avaliacao` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL,
  `avaliacao` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Fazendo dump de dados para tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id_avaliacao`, `id_usuario`, `id_filme`, `avaliacao`) VALUES
(8, 5, 1, 1),
(9, 5, 2, 1),
(10, 5, 11, 1),
(11, 5, 1, -1),
(12, 5, 2, -1),
(13, 5, 3, 1),
(14, 5, 4, 1),
(15, 7, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Fazendo dump de dados para tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`) VALUES
(1, 'Animação'),
(2, 'Aventura'),
(3, 'Ação'),
(13, 'Biografia'),
(4, 'Comédia'),
(5, 'Corrida'),
(6, 'Documentário'),
(7, 'Drama'),
(14, 'Família'),
(8, 'Ficção Centífica'),
(9, 'Guerra'),
(10, 'Mitologia'),
(11, 'Romance'),
(12, 'Terror');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL,
  `comentario` varchar(600) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Fazendo dump de dados para tabela `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `id_filme`, `comentario`) VALUES
(4, 5, 1, 'muito bom esse filme'),
(5, 5, 1, 'a do rei'),
(6, 5, 1, 'que filme bom'),
(7, 5, 3, 'boa'),
(8, 5, 2, 'assisti 5 vezes'),
(10, 7, 1, 'que filme muito louco\r\n'),
(11, 7, 3, 'toppen'),
(12, 7, 2, 'eu assisti 10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filmes`
--

CREATE TABLE `filmes` (
  `id_filmes` int(11) NOT NULL,
  `nome` varchar(40) COLLATE utf8_bin NOT NULL,
  `categoria` int(11) DEFAULT NULL,
  `resumo` varchar(1000) COLLATE utf8_bin NOT NULL,
  `poster` varchar(500) COLLATE utf8_bin NOT NULL,
  `trailer` varchar(200) COLLATE utf8_bin NOT NULL,
  `duracao` varchar(20) COLLATE utf8_bin NOT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Fazendo dump de dados para tabela `filmes`
--

INSERT INTO `filmes` (`id_filmes`, `nome`, `categoria`, `resumo`, `poster`, `trailer`, `duracao`, `ano`) VALUES
(1, 'Polícia Federal: A Lei É para Todos', 3, 'Do início do processo até a condução coercitiva do ex-presidente Lula, a Operação Lava Jato desencadeia uma série de investigações sobre a corrupção no Brasil.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFxGpJ8x0e4hW4wkmbvKVjfMp3FrrIhQg9AxDjngsY7wtzDQrN', 'https://www.youtube.com/watch?v=WdgD4g-JfFA', '1h 47m', 2017),
(2, 'Transformers: O Último Cavaleiro', 8, 'O gigante Optimus Prime embarcou em uma das missões mais difíceis de sua vida: encontrar, no espaço sideral, os Quintessons, seres que possivelmente são os responsáveis pela criação da raça Transforme', 'https://static.omelete.uol.com.br/media/extras/capas/transformersPoster.jpg', 'https://www.youtube.com/watch?v=jqFj5gi1F7Q', '3h 9m', 2017),
(3, 'Um Tio Quase Perfeito', 4, 'Tio Tony é um adorável trambiqueiro que vive de bicos como estátua viva, cartomante, pastor e sempre conta com a cobertura da mãe, Cecilia. Quando eles são despejados de onde moram, procuram a irmã de', 'http://br.web.img3.acsta.net/c_215_290/pictures/17/04/24/18/27/336172.jpg', 'https://www.youtube.com/watch?v=c0pjoPseOWc', '1h 35m', 2017),
(4, 'D.P.A - O Filme', 2, 'Os Detetives do Prédio Azul precisam salvar o próprio edifício da destruição. Pippo, Sol e Bento se infiltram na festa de Dona Leocádia, a bruxa síndica do prédio, e presenciam um crime \"mágico\", que ', 'https://s2.glbimg.com/TIVqoh-pBwxEn9YqVBpPPfba3Ks=/0x0:1616x2362/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2017/g/T/6ogkG5RIOXdT7MLpWJSw/d.p.a.-o-filme-cartaz.jpgfinal.jpg', 'https://www.youtube.com/watch?v=93i8G3elwcs', '1h 40m', 2017),
(5, 'Planeta dos Macacos: A Guerra', 3, 'César e seu grupo são forçados a entrar em uma guerra contra um exército de soldados liderados por um impiedoso coronel. Depois que vários macacos perdem suas vidas no conflito, César luta contra seus', 'http://t0.gstatic.com/images?q=tbn:ANd9GcQUkXYeQ6cvPsajthgZUnUna9mmn30nIuk4VhPumSsgELo5z2Zr', 'https://www.youtube.com/watch?v=DqkzzMYQI5g', '2h 22m', 2017),
(7, 'Bingo: O Rei das Manhãs', 7, 'Cinebiografia de Arlindo Barreto, um dos intérpretes do palhaço Bozo no programa matinal homônimo da televisão brasileira durante a década de 1980. Barreto alcançou a fama graças ao personagem, apesar de jamais ser reconhecido pelas pessoas por sempre estar fantasiado. Esta frustração o levou a se envolver com drogas, chegando a utilizar cocaína e crack nos bastidores do programa.', 'http://br.web.img3.acsta.net/c_215_290/pictures/17/08/09/19/20/144922.jpg', 'https://www.youtube.com/watch?v=hidcxSOQ_Gg', '1h 53m', 2017),
(8, 'Dupla Explosiva', 3, 'O melhor agente de proteção do mundo recebe um novo cliente: um assassino que veio do frio. Depois de estar nos extremos opostos, eles devem se unir e pegar em apenas 24 horas um ditador assassino.', 'http://br.web.img3.acsta.net/c_215_290/pictures/17/06/29/14/58/351355.jpg', 'https://www.youtube.com/watch?v=j__wNLjbYQw', '1h 58m', 2017),
(9, 'A Torre Negra', 8, 'O pistoleiro Roland Deschain percorre o mundo em busca da famosa Torre Negra, prédio mágico que está prestes a desaparecer. Essa busca envolve uma intensa perseguição ao poderoso Homem de Preto, passagens entre tempos diferentes, encontros intensos e confusões entre o real e o imaginário. Baseado na obra literária homônima de Stephen King.', 'http://t0.gstatic.com/images?q=tbn:ANd9GcTro7Yy91CzFVEglLCaTs7hf3cN38kuFu2duxDx1hKvoEI2UQEE', 'https://www.youtube.com/watch?v=0gtDpj8aC_w', '1h 35m', 2017),
(10, 'Annabelle 2: A Criação do Mal', 12, 'Anos após a trágica morte de sua filha, um habilidoso artesão de bonecas e sua esposa decidem, por caridade, acolher em sua casa uma freira e dezenas de meninas desalojadas de um orfanato. Atormentado pelas lembranças traumáticas, o casal ainda precisa lidar com um amendrontador demônio do passado: Annabelle, criação do artesão.', 'https://i0.wp.com/www.badtaste.it/wp/wp-content/uploads/2017/03/annabelleposter.jpeg?quality=85&strip=all', 'https://www.youtube.com/watch?v=SQ2jLjjBIwc', '1h 49m', 2017),
(11, 'Emoji: O Filme', 1, 'Escondido dentro da app de texto está Textopolis, uma cidade cheia de vida onde todos os teus emojis favoritos vivem, aguardando ser selecionados pelo dono do seu telemóvel. Neste mundo, cada emoji tem apenas uma expressão facial - exceto Gene, um emoji que nasceu sem filtro e que se multiplica pelas mais variadas expressões. Determinado a tornar-se normal como os outros emojis, Gene conta com uma mãozinha do seu melhor amigo, Hi-5 e com a famosa hacker emoji Rebelde. Juntos, eles embarcam numa \"app-ventura\" épica através das apps do telemóvel, cada uma com o seu mundo de diversão e perigos para encontrar o Código que irá tratar Gene. Mas quando um grande perigo ameaça o telemóvel, o destino de todos os emojis depende destes 3 improváveis amigos que terão de salvar o seu mundo antes que este seja para sempre apagado.', 'https://filmspot.com.pt/images/filmes/posters/big/378236_pt.jpg', 'https://www.youtube.com/watch?v=meaq8aY0B5k', '1h 31m', 2017),
(12, 'As Tartarugas Ninja', 8, 'Um grupo de tartarugas é afetado por uma substância radioativa, ganha força, conhecimento e cresce. Vivendo no esgoto, quatro jovens tartarugas descobrem um novo destino como Tartarugas Ninja. Elas unirão forças com a corajosa repórter April O Neil para salvar Nova York do domínio do diabólico Shredder, o Destruidor, e seu grupo maligno.', 'http://t1.gstatic.com/images?q=tbn:ANd9GcQa7CbrnUVQHWuYJugHk1X7E7zXxZly8A3cWSw4dFyRP7A6WCUw', 'https://www.youtube.com/watch?v=UgNPwHv_9rU', '1h 41m', 2014),
(13, 'Godzila Resurgence', 8, 'Shin Godzilla é um filme de ação japonês de 2016 dirigido e escrito por Hideaki Anno e Shinji Higuchi. Protagonizado por, estreou em seu país de origem em 25 de julho de 2016.', 'http://t1.gstatic.com/images?q=tbn:ANd9GcRSXoaO2A1-iuFl31Ws9WFS_YcJ5UbIvzDg8Jld3JfAApkGfWBr', 'https://www.youtube.com/watch?v=DvFEspENxIU', '2 horas', 2016),
(14, 'Rogue One: Uma História Star Wars', 8, 'Ainda criança, Jyn Erso (Felicity Jones) foi afastada de seu pai, Galen (Mads Mikkelsen), devido à exigência do diretor Krennic (Ben Mendelsohn) que ele trabalhasse na construção da arma mais poderosa do Império, a Estrela da Morte. Criada por Saw Gerrera (Forest Whitaker), ela teve que aprender a sobreviver por conta própria ao completar 16 anos. Já adulta, Jyn é resgatada da prisão pela Aliança Rebelde, que deseja ter acesso a uma mensagem enviada por seu pai a Gerrera. Com a promessa de liberdade ao término da missão, ela aceita trabalhar ao lado do capitão Cassian Andor (Diego Luna) e do robô K-2SO.', 'http://t0.gstatic.com/images?q=tbn:ANd9GcT9F2Idx7ZPs1o4roUPBvDfR1FMwCtl0fMNnxzmqeOcye1wgmsO', 'https://www.youtube.com/watch?v=ySVDUw-c3PU', '2h 13m', 2016),
(15, 'Resident Evil 6: O Capítulo Final', 8, 'Sobrevivente do massacre zumbi, Alice retorna para onde o pesadelo começou, Raccoon City, em que a Umbrella Corporation reúne suas forças para um ataque final contra os remanescentes do apocalipse. Para vencer a dura batalha final e salvar a raça humana, a heroína recruta velhos e novos amigos.', 'http://t3.gstatic.com/images?q=tbn:ANd9GcRv-DgccVJh8yeyQ8MUcj92kD0nY_To_i3TbhmNYke_gPBdE6Jv', 'https://www.youtube.com/watch?v=A-SORf2ipjw', '1h 47m', 2016),
(16, 'Tubarão de gelo', 3, 'Uma nova raça de tubarões vorazes e agressivos surgem de uma fissura no Ártico, devorando todos os presentes em uma estação de pesquisa que decidirem se aproximar das águas frias. Quando a estação fica submersa, os sobreviventes devem se armar com o que estiver ao alcance para enfrentar as criaturas assassinas.', 'https://3.bp.blogspot.com/-Cw7iDjo7xhY/V6H9QrtoMlI/AAAAAAAAFCY/c2QE_Cu3-QMeaOXN0J7lMK-NHaQeqy80wCLcB/s320/r7Fo04IloqUxK9y61oD3seXHDlM.jpg', 'https://www.youtube.com/watch?v=oaB1ja8bDOc', '1h 7m', 2016),
(17, 'Planeta dos Tubarões', 8, 'O aquecimento global derreteu as calotas glaciais, deixando praticamente o planeta inteiro debaixo dágua. Tubarões agora dominam a Terra, liderados por um macho alpha mutante.', 'http://bocadoinferno.com.br/wp-content/uploads/2016/07/Planet-of-the-Sharks-2016-1.jpg', 'https://www.youtube.com/watch?v=lUuQhbHMzMU', '1h 30m', 2016),
(18, 'Assassins Creed ', 3, 'Callum Lynch (Michael Fassbender) descobre que é descendente de um membro da Ordem dos Assassinos e, via memória genética, revive as aventuras do guerreiro Aguilar, seu ancestral espanhol do século XV. Dotado de novos conhecimentos e incríveis habilidades, ele volta aos dias de hoje pronto para enfrentar os Templários. Versão para as telonas do game Assassins Creed.', 'http://images.eurogamer.net/2017/articles/1/8/7/7/8/9/3/148395712584.jpg/EG11/resize/600x-1/quality/80/format/jpg', 'https://www.youtube.com/watch?v=jTgzJ79KDsg', '1h 56m', 2017),
(19, 'Vizinhança do Barulho', 4, 'Ashtray (Shawn Wayans) agora é um homem e está de volta ao violento bairro de Los Angeles, onde cresceu, para morar com o pai, que por alguma misteriosa razão tem quase a mesma idade do filho. Lá reencontra personagens igualmente incomuns, como o primo que se intitula O Maior Pesadelo da América e o animado Crazy Legs, que mesmo preso a uma cadeira de rodas sonha tornar-se bailarino. E ainda por cima se enrola com Daishiki, uma jovem bastante disposta a ensinar-lhe tudo o que sabe em matéria de amor, enquanto na rua os tiroteios fazem uma confusa mãe chorar pelo defunto errado..', 'http://2.bp.blogspot.com/-PiFDbDSvxhU/Vaxb0-ERmfI/AAAAAAAACdk/ppk35-jr0I4/s1600/vizinhan%25C3%25A7a.jpg', 'https://www.youtube.com/watch?v=HlRsbr70yEs', '1h 34m', 1996),
(20, 'Jovens Titãs: O Contrato de Judas', 1, 'Jovens Titãs: O Contrato de Judas passa cinco anos atrás, os Titãs (Dick Grayson como Robin, Ricardito, Kid Flash, Mutano, Ravena e Abelha) resgatam a Princesa de Tamaran Estelar de seus captores enviados por sua irmã maligna, Estrela Negra. Como ela não é mais capaz de retornar ao seu planeta, os Titãs oferecer-lhe uma casa na Terra. Agora, a história é de Tara Markov, a Terra, que contém os poderes de controlar a terra e o solo e se uniu aos Jovens Titãs durante os eventos de Liga da Justiça vs. Jovens Titãs, se tornando uma possível ameaça e deixando a questão: Será a nova heroína aliada ou inimiga? E quais são os planos do Exterminador para a jovem equipe de heróis?', 'http://www.dvdsreleasedates.com/posters/800/T/Teen-Titans-The-Judas-Contract-2017-movie-poster.jpg', 'https://www.youtube.com/watch?v=GIeoysdR8AQ', '1:10', 2017),
(21, 'Sign: Quem Canta Seus Males Espanta', 1, 'Um empolgado coala chamado Buster decide criar uma competição de canto para aumentar os rendimentos de seu antigo teatro. A disputa movimenta o mundo animal e promove a revelação de diversos talentos da cidade, todos de olho nos 15 minutos de fama e US$ 100 mil dólares de prêmio.', 'http://t3.gstatic.com/images?q=tbn:ANd9GcQ-0H3KhmztR55pw13DDhEOoQ5MkqapKIZ6nT2leK50oUnHySvd', 'https://www.youtube.com/watch?v=F1zyebZx22g', '1:48', 2016),
(22, 'Hop: Rebelde Sem Páscoa ', 1, 'Junior (Russell Brand) é um coelho que adora tocar bateria e sonha em fazer sucesso com a música, mas seu pai (Hugh Laurie) deseja que ele dê continuidade à tradição de tornar-se o Coelho da Páscoa, seguida há quatro mil anos. Ele tenta convencer o pai de seu sonho, mas ele não lhe dá ouvidos. Desta forma, Junior parte para Hollywood, onde acredita que poderá enfim se tornar um grande astro. Ao chegar ele é quase atropelado por Fred Lebre (James Marsden), um jovem que tem sido pressionado pela família para que enfim consiga um emprego. Após a surpresa inicial por encontrar um coelho falante, Fred aceita levá-lo até a mansão que está cuidando, enquanto o dono está viajando. Lá eles se tornam amigos, com Fred ajudando Junior a conseguir espaço no cenário musical. Enquanto isso, o pai de Junior envia as boinas rosas no encalço do filho, sem perceber que uma conspiração está sendo organizada contra si.\r\n', 'https://i.ytimg.com/vi_webp/yYS-Py-ixCs/movieposter.webp', 'https://www.youtube.com/watch?v=8W7xNB2qlf4', '1:35', 2011),
(23, 'A Bailarina', 1, 'Paris, 1869. Uma sonhadora menina órfã toma uma atitude arriscada para conseguir o que quer: foge para Paris para realizar o sonho de ser uma grande bailarina. Lá ela decide se passar por outra pessoa, e consegue uma vaga no Grand Opera, onde vai aprontar muitas aventuras.\r\n', 'https://i.ytimg.com/vi_webp/Hz5r-qHyYas/movieposter.webp', 'https://www.youtube.com/watch?v=0DgnPcKqQ3s', '1:07', 201),
(24, 'Rio 2', 1, 'Blu (Jesse Eisenberg) vive feliz no Rio de Janeiro ao lado da companheira Jade (Anne Hathaway) e seus três filhotes, Carla (Rachel Crow), Bia (Amandla Stenberg) e Tiago (Pierce Gagnon). Seus donos, Linda (Leslie Mann) e Túlio (Rodrigo Santoro), estão agora na floresta amazônica, fazendo novas pesquisas. Por acaso eles encontram a pena de uma ararinha azul, o que pode significar que Blu e sua família não sejam os últimos da espécie. Após vê-los em uma reportagem na TV, Jade insiste para que eles partam para a Amazônia. Blu inicialmente reluta, mas acaba aceitando a ideia. Assim, toda a família parte em uma viagem pelo interior do Brasil rumo à floresta amazônica sem imaginar que, logo ao chegar, encontrarão um velho inimigo: Nigel (Jemaine Clement).\r\n', 'https://i.ytimg.com/vi_webp/xf_E6rE9RMo/movieposter.webp', 'https://www.youtube.com/watch?v=_QNrbbGpLrc', '1:41', 2014),
(25, 'Rio', 1, 'Blu (Jesse Eisenberg) é uma arara azul que nasceu no Rio de Janeiro mas, capturada na floresta, foi parar na fria Minnesota, nos Estados Unidos. Lá é criada por Linda (Leslie Mann), com quem tem um forte laço afetivo. Um dia, Túlio (Rodrigo Santoro) entra na vida de ambos. Ornitólogo, ele diz que Blu é o último macho da espécie e deseja que ele acasale com a única fêmea viva, que está no Rio de Janeiro. Linda e Blu partem para a cidade maravilhosa, onde conhecem Jade (Anne Hathaway). Só que ela é um espírito livre e detesta ficar engaiolada, batendo de frente com Blu logo que o conhece. Quando o casal é capturado por uma quadrilha de venda de aves raras, eles ficam presos por uma corrente na pata. É quando precisam unir forças para escapar do cativeiro.\r\n', 'https://i.ytimg.com/vi_webp/YBHb6UZ85M8/movieposter.webp', 'https://www.youtube.com/watch?v=Ec6edKh2plg', '1:37', 2011),
(26, 'Moana: Um Mar de Aventuras ', 1, 'Moana Waialiki é uma corajosa jovem, filha do chefe de uma tribo na Oceania, vinda de uma longa linhagem de navegadores. Querendo descobrir mais sobre seu passado e ajudar a família, ela resolve partir em busca de seus ancestrais, habitantes de uma ilha mítica que ninguém sabe onde é. Acompanhada pelo lendário semideus Maui, Moana começa sua jornada em mar aberto, onde enfrenta terríveis criaturas marinhas e descobre histórias do submundo.\r\n', 'https://i.ytimg.com/vi_webp/85WM7lBEc6o/movieposter.webp', 'https://www.youtube.com/watch?v=80q_uNi1Ip0', '1:47', 2016),
(27, 'As Aventuras de Peabody & Sherman ', 1, 'Sr. Peabody (Ty Burrell) é o cão mais inteligente do mundo. Após ganhar o prêmio Nobel e criar diversas invenções que ajudaram a humanidade, ele resolve adotar um bebê humano que encontrou abandonado na rua. Responsável por sua educação, Peabody constrói uma máquina do tempo para mostrar ao jovem Sherman (Max Charles) os fatos históricos estando presentes nele. Entretanto, um novo desafio se apresenta para Sherman quando ele, pela primeira vez, precisa ir à escola. Lá ele se torna alvo de provocações de Penny (Ariel Winter), com quem acaba brigando no pátio. Temendo perder a guarda do garoto, Peabody organiza um jantar em sua casa com Penny e seus pais. Só que mais uma vez a garota provoca Sherman, que acaba descumprindo a orientação do pai adotivo e lhe mostra a máquina do tempo. Não demora muito para que ambos viagem pelo tempo, causando diversos problemas.', 'https://i.ytimg.com/vi_webp/Gw1yHzfeR7M/movieposter.webp', 'https://www.youtube.com/watch?v=eNYyDdq3ZMg', '1:32', 2014),
(28, 'Trolls', 1, '\r\nRamo (Justin Timberlake) parte para uma jornada de descobertas e aventuras ao lado de Poppy (Anna Kendrick), líder dos Trolls. Inicialmente inimigos, conforme os desafios são superados eles descobrem que no fundo combinam.\r\n', 'https://i.ytimg.com/vi_webp/wzSBeh0W0DA/movieposter.webp', 'https://www.youtube.com/watch?v=WgOv6RxbfKw', '1:32', 2016),
(29, 'Liga da Justiça Sombria', 1, 'Um grupo de anti-heróis sobrenaturais se unem para enfrentar ameaças ocultas, ameaças sobrenaturais, ameaças que talvez Batman, Superman e companhia não conseguiriam vencer. O clã é formado por personagens como John Constantine, Zatanna, o Monstro do Pântano, Etrigan, o Demônio, e a Orquídea Negra.\r\n', 'https://i.ytimg.com/vi_webp/wo95xoPpF1o/movieposter.webp', 'https://www.youtube.com/watch?v=H1kzDHnUvAQ', '1:15', 2017),
(30, 'Abril e o Mundo Extraordinário', 1, 'Em 1941, a França, ainda em um estado atrasado de desenvolvimento, presa ao século dezenove, é governada por Napoleão V. Durante um período de 70 anos, uma coisa peculiar vem acontecendo: cientistas franceses desaparecem misteriosamente sem que ninguém saiba por qual motivo. As coisas mudam quando os pais de Avril (Marion Cotillard), dois cientistas, somem e a filha decide ir à procura dos dois.\r\n', 'http://br.web.img2.acsta.net/c_215_290/pictures/15/09/18/15/14/545941.jpg', 'https://www.youtube.com/watch?v=zC8GkF2aEg0', '1:26', 2016),
(31, '100000 Anos Depois', 1, 'Centenas de milhares de anos após o colapso da civilização, o mundo é um deserto “pós-tech” e é habitado por tribos humanóides. A paz estabelecida entre eles é ameaçada pelo retorno de Wushen, um fantasma que muda a forma da tecnologia moderna, ameaçando escravizar a população mundial. Zhuma, uma menina de dez anos de idade é a heroína da história, acompanhada por Zhanggong, seu cachorro leão-como o mastín tibetano e seu avô. Escolhida e ajudada por uma deusa etérea, ela deve reunir aliados das tribos sobreviventes para combater Wushen e impedi-lo de ganhar o controle sobre um poder muito antigo.\r\n', 'http://megafilmesonline.net/wp-content/uploads/2017/01/10000-Anos-Depois.jpg', 'https://www.youtube.com/watch?v=dgY58WXHiNs', '1:36', 2017),
(32, 'Pokémon - Filme 18 - Hoopa e o Duelo Len', 1, 'Durante a batalha entre Groudon, Kyogre e Rayquaza, Ash e seus amigos são atraídos por um som de um anel que começa a sugar tudo à sua volta, enviando para outro local. Eles não conseguem se segurar e acabam sendo sugados para o portal e chegam a um local desconhecido. Enquanto Ash e Pikachu estão comendo rosquilhas, eles encontram o mítico Pokémon Hoopa que concorda em viajar com eles.\r\n', 'https://i.ytimg.com/vi_webp/sdZ5mL_ujkM/movieposter.webp', 'https://www.youtube.com/watch?v=gJY17cajNqU', '1:15', 2015),
(33, 'Pokémon - Filme 17 - Diancie e o Casulo ', 1, '\r\nEm um mundo chamado Diamond Domain, em que serviu como fonte de energia ao reino e mantém o País Ore por séculos. Vários Carbink todos vivem no país referenciado, incluindo a sua princesa, a Pokémon da Joia Diancie que criou o diamante poderoso. No entanto, ela não tem mais o poder de controlar o Heart Diamond e seu país está a cair no caos como a vida do diamante está caindo aos pedaços.  Um dia, ela encontra-se com Satoshi e seus amigos e pede a eles para ir em uma jornada para encontrar o Pokémon da Vida Xerneas, a fim de restaurar o Heart Diamond de volta à vida. Mas que está em seu caminho é o Pokémon da Destruição, Yveltal, que uma vez roubou toda a vida na Região Kalos. Durante sua jornada, eles também são atacados pela Equipe Rocket, assim como ladrões de jóias Marilyn Flame e o Ninja Riot. Eles são auxiliados por Millis Steel e seu pai Argus, os viajantes que também enfrentam o Casulo da Destruição.\r\n', 'https://i.ytimg.com/vi_webp/UBv9vnh6NjA/movieposter.webp', 'https://www.youtube.com/watch?v=An47X8x4gSQ', '1:15', 2015),
(34, 'Pokémon - Filme 16 - Genesect e a Lenda ', 1, '\r\nA história começa quando o Exército de Genesect escaparam das instalações da Equipe Plasma com a intenção de chegar a sua casa, no entanto, devido à falta de visão e confusão sobre a sua localização, eles são incapazes de distinguir estruturas altas e objetos dos pilares pedra do seu país, o que leva a estes desencadear o caos. Sem nenhum detalhe, o exército de Genesect chega à cidade de Nova Tork e desencadear batalha contra Ash, Pikachu, Iris, Axew e Cilan. Depois de tentar Ash e companhia defender Pokémon Hills, o ataque Genesect para derrubá-los quando inesperadamente surge Mewtwo para detê-lo. Mewtwo diz que quer proteger os pokémon, e transformado em sua nova forma.\r\n', 'https://i.ytimg.com/vi_webp/5JoLn_b4R3Y/movieposter.webp', 'https://www.youtube.com/watch?v=jDv0X6qzDh8', '1:11', 2013),
(35, 'Pokémon - Filme 15 - Kyurem contra a Esp', 1, 'Ash e Co. se dirijem a Rooshan/Roushan. Enquanto em um trem passando pelas montanhas, Ash encontra um Pokémon ferido que nunca havia visto antes, desmaiado. Esta é uma ilusão do Pokémon Keldeo, que diz ser o sucessor de Cobalion e Co., os mestres da Espada Sagrada que protegem o mundo. Nesse momento, Kyurem aparece e começa a atacar, mudando para Kyurem Preto e Kyurem Branco fazendo isso. Isto bloqueia o caminho de Ash e Co. até Keldeo. Ash e Co. conseguem escapar da perseguição de Kyurem, por um triz. A batalha se enfurece entre Kyurem, caçando Keldeo, e o trem e o balão de ar quente no céu. Podem Keldeo, Ash e Co. superar esse perigo?\r\n\r\nFoi mais tarde revelado que este filme irá mostrar o Pokémon lendário Keldeo e as formas alternativas de Kyurem: Kyurem Preto e Kyurem Branco. Este filme também virá junto com um curta especial: O Recital Cintilante de Meloetta.\r\n', 'https://i.ytimg.com/vi_webp/rSVwYlIY8os/movieposter.webp', 'https://www.youtube.com/watch?v=aQWb2LRoq6I', '1:11', 2012),
(36, 'Pokémon - Filme 14 - Branco: Victini e Z', 1, '\r\nDurante suas viagens pela região de Unova, Ash e seus amigos Iris e Cilan chegam na Cidade de Eindoak, construída ao redor de um castelo chamado a Espada do Vale. Os três Treinadores vieram para competir na competição de batalhas anual da cidade, e Ash consegue vencer com um pouco da ajuda inesperada do Pokémon Mítico Victini! Acontece que Victini tem um laço especial com este lugar… Há muito tempo atrás, o castelo observava o Reino do Vale, e a parceria entre Victini e o rei protegia o povo que vivia lá. Mas esse reino já desapareceu da memória, deixando para trás poderosas reliquias e antigos Pokémon. Damon, um descendente do Povo do Vale, está tentando restaurar o reino perdido com a ajuda de seu Reuniclus. Sua busca o levou a lugares distantes do deserto árido, e ele convenceu o Pokémon Lendário Reshiram (Victini e Zekrom) e Zekrom (Victini e Reshiram) a se juntar a ele! Damon planeja prender Victini e retirar seu poder, e quando o plano começa a andar, a cidade inteira de Eindoa', 'https://i.ytimg.com/vi_webp/uFN05OXhBr0/movieposter.webp', 'https://www.youtube.com/watch?v=SzBDo356TdE', '1:35', 2011),
(37, 'Festa Da Salsicha ', 1, 'Dentro de um supermercado, os alimentos pensam que as pessoas são deuses. Eles sonham em serem escolhidos por elas e serem levados para suas casas, onde pensam que viverão felizes. Mas eles nem suspeitam que serão cortados, ralados, cozidos e devorados! Quando Frank, uma salsicha, descobre a terrível verdade, ele precisa convencer os outros alimentos do supermecado  e fazer com que eles lutem contra os humanos.\r\n', 'https://i.ytimg.com/vi_webp/Uhq-rctC1V8/movieposter.webp', 'https://www.youtube.com/watch?v=FNP0N_QcfFU', '1:29', 2016),
(38, 'Cegonhas: A História que Não te Contaram', 1, 'Todo mundo já sabe de onde vêm os bebês: eles são trazidos pelas cegonhas. Mas agora você vai conhecer a mega estrutura por trás desta fábrica de bebês: na verdade, as cegonhas controlam um grande empreendimento que enfrenta muitas dificuldades para coordenar todas as entregas nos horários e locais certos.\r\n', 'https://i.ytimg.com/vi_webp/vY0sU-o0ltQ/movieposter.webp', 'https://www.youtube.com/watch?v=z54KMekWgZ0', '1:26', 2016),
(39, 'Cantando de galo', 1, 'Toto é um jovem galo que é o menor de todos na granja onde nasceu. Ele tem o grande sonho de se tornar o grande galo do povoado. Mas quando um fazendeiro ameaça destruir o seu lar e a sua família, Toto e seus amigos irão viajar para encontrar um treinador que possa ajudá-lo a defender seu lar ao mesmo tempo em que vivem uma grande aventura e a descoberta do amor.\r\n', 'https://i.ytimg.com/vi_webp/FzXKmIsYWO4/movieposter.webp', 'https://www.youtube.com/watch?v=HwEkM2CIhSs', '1:37', 2016),
(40, 'Procurando Dory', 1, 'Um ano após ajudar Marlin (Albert Brooks) a reencontrar seu filho Nemo, Dory (Ellen DeGeneres) tem um insight e lembra de sua amada família. Com saudades, ela decide fazer de tudo para reencontrá-los e na desenfreada busca esbarra com amigos do passado e vai parar nas perigosas mãos de humanos.\r\n', 'https://i.ytimg.com/vi_webp/W10PV1APIAE/movieposter.webp', 'https://www.youtube.com/watch?v=S2AVzedy53A', '1:37', 2016),
(41, 'Transformers: O Filme ', 1, 'Em pleno ano 2005, os Autobots e os Decepticons ainda estão em guerra, mas uma mortífera nova força está prestes a ameaçá-los. O gigantesco planeta assassino Unicron se aproxima cada vez mais da Terra e pretende destruí-la. Com isso, os heróicos Autobots resolvem lutar por sua própria sobrevivência e enfrentar a mais nova ameaça ao planeta.\r\n', 'http://4.bp.blogspot.com/--H8nwugnuM0/UBSYdIQUocI/AAAAAAAAGtc/66WqpK7unnY/s1600/Tranformers1.jpg', 'https://www.youtube.com/watch?v=GUI3VkLN6Co', '1:30', 1986),
(44, 'As Tartarugas Ninja: Fora Das Sombras', 2, 'Afetados por uma substância radioativa, um grupo de tartarugas cresce anormalmente, ganha força e conhecimento. Vivendo nos esgotos de Manhattan, quatro jovens tartarugas, treinadas na arte de kung-fu, Leonardo, Rafael, Michelangelo e Donatello, junto com seu sensei, Mestre Splinter, tem que enfrentar o mal que habita cidade.\r\n', 'https://i.ytimg.com/vi_webp/umi6A5s6eDo/movieposter.webp', 'https://www.youtube.com/watch?v=pPnzamC80Hk', '1:52', 2016),
(45, 'Alice no País das Maravilhas ', 2, '\r\nAlice (Mia Wasikowska) é uma jovem de 17 anos que passa a seguir um coelho branco apressado, que sempre olha no relógio. Ela entra em um buraco que a leva ao País das Maravilhas, um local onde esteve há dez anos apesar de nada se lembrar dele. Lá ela é recepcionada pelo Chapeleiro Maluco (Johnny Depp) e passa a lidar com seres fantásticos e mágicos, além da ira da poderosa Rainha de Copas (Helena Bonham Carter).\r\n', 'https://i.ytimg.com/vi_webp/Qdu6sSRAR58/movieposter.webp', 'https://www.youtube.com/watch?v=UWCymwAUsY4', '1:48', 2010),
(46, 'Alice no País das Maravilhas - 1951', 1, '(Kathryn Beaumont/ Therezinha) é uma garota curiosa e cansada da monotonia de sua vida. Um dia, ao seguir o apressado Coelho Branco (Bill Thompson), ela entra no País das Maravilhas. Lá ela conhece diversos seres incríveis, como o Chapeleiro Louco (Ed Wynn/ Otávio França), o Mestre Gato (Sterling Holloway/ José Vasconcellos), a Lagarta (Richard Haydn/ Wellington Botelho) e a Rainha de Copas (Verna Felton/ Sara Nobre).\r\n', 'https://i.ytimg.com/vi_webp/hrKQ68eNXKA/movieposter.webp', 'https://www.youtube.com/watch?v=v-myBq9UYIY', '1:15', 1951),
(47, 'Scooby-Doo! e a Maldição do Monstro do L', 2, '\r\nFred (Robbie Amell), Velma (Hayley Kiyoko), Daphne (Kate Melton) e Salsicha (Nick Palatas) estão de férias do colégio e das investigações sobrenaturais. Porém, após a lenda de um monstro no lago parecer estar se tornando real, os amigos vão se juntar ao inseparável cão Scooby-doo para tentar decifrar ester mistério.\r\n', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ26bIvCE-4zMXSuG21pgeyw7hqBPeOvfZ-QWhGVvnX2vznh4We', 'https://www.youtube.com/watch?v=bt1XGEaGCvw', '1:14', 2005),
(48, 'O Tigre e o Dragão: A Espada do Destino ', 2, 'Dezoito anos após a morte de Li Mu Bai, Yu Shu Lien (Michelle Yeoh) é chamada para ajudar a proteger a espada do destino. Forjada na dinastia Qin e repleta de detalhes esverdeados, ela possui a fama de ser a mais poderosa espada de sua época e é agora alvo de Hades Dai (Jason Scott Lee), um perigoso déspota local que envia o jovem Tiefang (Harry Shum Jr.) para roubá-la. O que ele não contava era que a espada seria também protegida por Snow Vase (Natasha Liu Bordizzo), uma jovem de passado misterioso, e Silent Wolf (Donnie Yen), que possui uma forte ligação com Shu Lien.\r\n', 'http://br.web.img3.acsta.net/c_215_290/medias/nmedia/18/87/88/61/19962545.jpg', 'https://www.youtube.com/watch?v=3HDwVEDHB2g', '2:00', 2000),
(49, 'Deadpool', 2, 'Ex-militar e mercenário, Wade Wilson (Ryan Reynolds) é diagnosticado com câncer em estado terminal, porém encontra uma possibilidade de cura em uma sinistra experiência científica. Recuperado, com poderes e um incomum senso de humor, ele torna-se Deadpool e busca vingança contra o homem que destruiu sua vida.\r\n', 'https://i.ytimg.com/vi_webp/TjBH2FckLLY/movieposter.webp', 'https://www.youtube.com/watch?v=rW-44KuoAdA', '1:48', 2016),
(50, 'Príncipe da Pérsia: As Areias do Tempo ', 2, 'Pérsia, Idade Média. Dastan (Jake Gyllenhaal) é um jovem príncipe, que auxilia o irmão a conquistar uma cidade. Lá ele encontra uma estranha e bela adaga, a qual decide guardar. Tamina (Gemma Arterton), a princesa local, percebe que Dastan detém a adaga e tenta se aproximar dele para recuperá-la. A adaga possui o poder de fazer seu portador viajar no tempo, quando dentro dela há areia mágica. Só que Dastan é vítima de um golpe. Ele é o encarregado de entregar ao pai, o rei Sharaman (Ronald Pickup), uma túnica envenenada, que o mata. Perseguido como se fosse um assassino, ele precisa agora provar sua inocência e impedir que a adaga caia em mãos erradas.\r\n', 'https://i.ytimg.com/vi_webp/DhHXCB5mASk/movieposter.webp', 'https://www.youtube.com/watch?v=isJap04nr34', '1:46', 2010),
(51, 'O Regresso', 2, '1822. Hugh Glass (Leonardo DiCaprio) parte para o oeste americano disposto a ganhar dinheiro caçando. Atacado por um urso, fica seriamente ferido e é abandonado à própria sorte pelo parceiro John Fitzgerald (Tom Hardy), que ainda rouba seus pertences. Entretanto, mesmo com toda adversidade, Glass consegue sobreviver e inicia uma árdua jornada em busca de vingança.\r\n', 'https://i.ytimg.com/vi_webp/NAXC0s7ga-Y/movieposter.webp', 'https://www.youtube.com/watch?v=hxOrRfvqzWI', '2:36', 2016),
(52, 'Na Natureza Selvagem ', 2, '\r\nInício da década de 90. Christopher McCandless (Emile Hirsch) é um jovem recém-formado, que decide viajar sem rumo pelos Estados Unidos em busca da liberdade. Durante sua jornada pela Dakota do Sul, Arizona e Califórnia ele conhece pessoas que mudam sua vida, assim como sua presença também modifica as delas. Até que, após dois anos na estrada, Christopher decide fazer a maior das viagens e partir rumo ao Alasca.\r\n', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYh660QWuPIt0eN7FRGRaqIVFdi4G7QLw2N1azwBLaczxVJX7n1w', 'https://www.youtube.com/watch?v=0YBDpPIhEYo', '2:28', 2007),
(53, 'Jogos Vorazes: A Esperança ', 2, 'Ainda se recuperando do choque de ver Peeta (Josh Hutcherson) contra si, Katniss Everdeen (Jennifer Lawrence) é enviada ao Distrito 2 pela presidente Coin (Julianne Moore). Lá ela ajuda a convencer os moradores locais a se rebelarem contra a Capital. Com todos os distritos unidos, tem início o ataque decisivo contra o presidente Snow (Donald Sutherland). Só que Katniss tem seus próprios planos para o combate e, para levá-los adiante, precisa da ajuda de Gale (Liam Hemsworth), Finnick (Sam Claflin), Cressida (Natalie Dormer), Pollux (Elder Henson) e do próprio Peeta, enviado para compôr sua equipe.\r\n', 'https://i.ytimg.com/vi_webp/GJ4Nvv12GAo/movieposter.webp', 'https://www.youtube.com/watch?v=FSI7m9ANBgQ', '2:02', 2014),
(54, 'Pequenos Espiões 4 ', 2, 'Marisa Cortez Wilson (Jessica Alba) é casada com Wilbur (Joel McHale), um repórter conhecido por desmascarar espiões, e com ele tem um bebê e duas crianças, Rebecca (Rowan Blanchard) e Cecil (Mason Cook). O que o marido não sabe é que a esposa é uma ex-espiã, que decidiu largar a carreira para se dedicar à família. Precisando lidar com os dois filhos maiores, que não querem a mãe por perto, Marisa é forçada a retornar à antiga profissão quando surge Timekeeper (Jeremy Piven), um vilão com o poder de manipular o tempo.\r\n', 'https://i.ytimg.com/vi_webp/9aeR1ta65yg/movieposter.webp', 'https://www.youtube.com/watch?v=HoJDWpR3ShI', '2012', 1),
(55, 'Pequenos Espiões 3: Game Over ', 2, 'Toymaker (Sylvester Stallone) é um criador de brinquedos que deseja dominar os jovens de todo o planeta. Para tanto ele cria um jogo de realidade virtual, que prende seus jogadores dentro dele e os obriga a enfrentar diversos e perigosos estágios. Um dos prisioneiros do novo jogo é Carmen (Alexa Vega), forçando seu irmão Juni (Daryl Sabara) a partir para salvá-la.\r\n', 'https://i.ytimg.com/vi_webp/37Ws5M65j7U/movieposter.webp', 'https://www.youtube.com/watch?v=WvJoVBe9zwI', '1:22', 2003),
(56, 'Pequenos Espiões 2: A Ilha dos Sonhos Pe', 2, 'Quando o mundo está com problemas Carmen Alexa Vega e Juni Daryl Sabara, os mais novos agentes secretos da história, são chamados à ação novamente. Agora eles precisam enfrentar o Dr. Romero (Steve Buscemi), um perigoso geneticista que vive em uma misteriosa ilha juntamente com as criaturas por ele criadas. Ao mesmo tempo Carmen e Juni precisam enfrentar jovens espiões rivais, Gary Matthew O\"Leary e Gerti Emily Osment, que elaboraram um plano para capturar todos os agentes da família Cortez, incluindo os avós da jovem dupla.\r\n', 'https://i.ytimg.com/vi_webp/NohqaVkVPxY/movieposter.webp', 'https://www.youtube.com/watch?v=DApWbbSKrjQ', '1:40', 2002),
(57, 'Pequenos Espiões ', 2, 'Quando o famoso casal de espiões Gregorio (Antonio Banderas) e Ingrid Cortez (Carla Gugino) são sequestrados pelo maligno Fegan Floop (Alan Cumming), os dois filhos do casal Cortez, Carmen (Alexa Vega) e Juni (Daryl Sabara), são os únicos que têm conhecimento suficiente para resgatá-los. Deste modo, eles partem em sua primeira missão como espiões, justamente para resgatar seus próprios pais.\r\n', 'https://i.ytimg.com/vi_webp/6hi2XPL3l0M/movieposter.webp', 'https://www.youtube.com/watch?v=OwgR45eDQk4', '1:30', 2001),
(61, 'Star Wars: Episódio VII: O Despertar da ', 2, 'Décadas após a queda de Darth Vader e do Império, surge uma nova ameaça: a Primeira Ordem, uma organização sombria que busca minar o poder da República e que tem Kylo Ren (Adam Driver), o General Hux (Domhnall Gleeson) e o Líder Supremo Snoke (Andy Serkis) como principais expoentes. Eles conseguem capturar Poe Dameron (Oscar Isaac), um dos principais pilotos da Resistência, que antes de ser preso envia através do pequeno robô BB-8 o mapa de onde vive o mitológico Luke Skywalker (Mark Hamill). Ao fugir pelo deserto, BB-8 encontra a jovem Rey (Daisy Ridley), que vive sozinha catando destroços de naves antigas. Paralelamente, Poe recebe a ajuda de Finn (John Boyega), um stormtrooper que decide abandonar o posto repentinamente. Juntos, eles escapam do domínio da Primeira Ordem.\r\n', 'https://i.ytimg.com/vi_webp/_OoYOpJAXfA/movieposter.webp', 'https://www.youtube.com/watch?v=4r0287tUEgk', '2:18', 2015),
(64, 'A Máquina Do Tempo', 2, '\r\nAlexander Hartlegen (Guy Pearce) é um cientista que acredita piamente que seja possível viajar no tempo. Após sua namorada Emma (Sienna Guillory) ser assassinada, ele decide então passar da teoria à prática e consegue construir uma máquina do tempo. Só que, ao testá-la, Alexander viaja mais de 800 mil anos rumo ao futuro, onde encontra o planeta Terra sendo dominado por duas raças distintas: os Morlock e os Eloi.\r\n', 'http://2.bp.blogspot.com/-JdRgMOiHtaI/U3YCMJxvAVI/AAAAAAAAJgQ/6M4J9Bmc31U/s1600/A+Maquina+do+Tempo.jpg', 'https://www.youtube.com/watch?v=anGyyqgZVew', '1:36', 2002),
(65, 'Coragem em Campo', 13, 'O que Freddie Steinmark (Finn Wittrock) mais que na vida é jogar futebol. Mesmo tendo estatura considerada abaixo da média, seu pai o treina de forma rígida. Em um jogo, ele chama a atenção para ninguém menos que Darrell Royal (Aaron Eckhart), treinador da Universidade do Texas. Quando ganha uma bolsa de estudo no local, ele parte para Austin junto com a namorada Linda (Sarah Bolger). No time, ele enfrenta uma prática esgitante, mas nada comparado ao diagnóstico que recebe ao sofrer uma lesão em meio a um jogo da temporada.\r\n', 'http://telecine.img.estaticos.tv.br/cache/cartazes/my-all-american_cartaz_220x283.jpg', 'https://www.youtube.com/watch?v=_zLVHFkZgjc', '1:58', 2017),
(66, 'Até o Último Homem', 13, 'Durante a Segunda Guerra Mundial, o médico do exército Desmond T. Doss (Abdrew Garfield) se recusa a pegar em uma arma e matar pessoas, porém, durante a Batalha de Okinawa ele trabalha na ala médica e salva mais de 75 homens, sendo condecorado. O que faz de Doss o primeiro Opositor Consciente da história norte-americana a receber a Medalha de Honra do Congresso.\r\n', 'https://i.ytimg.com/vi_webp/JdoXJug7euE/movieposter.webp', 'https://www.youtube.com/watch?v=3d_DJngfp_s', '2:19', 2016),
(67, 'O Programa', 13, '\r\nQuando começa a carreira de ciclista, Lance Armstrong (Ben Foster) é considerado inferior aos concorrentes por sua técnica e seu típico físico. Perseguindo a vitória a qualquer custo, ele junta-se ao programa de um médico italiano e passa a usar todos os tipos de drogas experimentais para melhorar a sua performance. Rapidamente, ele se torna o melhor ciclista do mundo, vencendo sete edições do Tour de France, contando com um indetectável esquema de doping e com a conivência das instituições esportivas. Mas um dia, a verdade por trás de suas conquistas é revelada ao público.\r\n', 'https://i.ytimg.com/vi_webp/ubBQ4XU-wTg/movieposter.webp', 'https://www.youtube.com/watch?v=IwzjRH-f3yU', '1:43', 2016),
(68, 'O Mestre dos Gênios', 13, 'Biografia de Max Perkins, um dos editores literários mais famosos do mundo. Apostando em jovens talentos, ele descobriu nomes fundamentais da literatura como F. Scott Fitzgerald, Ernest Hemingway e Thomas Wolfe. O filme acompanha a vida pessoal e Perkins e sua relação complicada com os escritores, cujas obras foram fortemente influenciadas pelo trabalho do editor.\r\n', 'https://i.ytimg.com/vi_webp/JGFoJRc_IdU/movieposter.webp', 'https://www.youtube.com/watch?v=AgcvXloDQAw', '1:44', 2016),
(69, 'O Aviador', 13, '\r\nHoward Hughes (Leonardo DiCaprio) ficou milionário já aos 18 anos, devido à herança que seu pai, um inventor texano, deixou para ele. Pouco depois se mudou para Los Angeles, onde passou a investir na indústria do cinema. Hughes ajudou a carreira de vários astros, como Jean Harlow (Gwen Stefani), e ainda trabalhou em filmes de grande sucesso, como \"Hell\"s Angels\", que dirigiu. Paralelamente se dedicou a uma de suas maiores paixões, a aviação, e se envolveu com as atrizes Katharine Hepburn (Cate Blanchett) e Ava Gardner (Kate Beckinsale).\r\n', 'https://i.ytimg.com/vi_webp/SVY4f5B9AWY/movieposter.webp', 'https://www.youtube.com/watch?v=SVY4f5B9AWY', '2:50', 2005),
(70, 'Johnny & June ', 13, 'A história do cantor Johnny Cash (Joaquin Phoenix), desde sua juventude em uma fazenda de algodão até o início do sucesso em Memphis, onde gravou com Elvis Presley, Johnny Lee Lewis e Carl Perkins. Sua personalidade marginal e a infância tumultuada fazem com que Johnny entre em um caminho de auto-destruição, do qual apenas June Carter (Reese Whiterspoon), o grande amor de sua vida, pode salvar.\r\n', 'https://i.ytimg.com/vi_webp/PyArK1FEPUQ/movieposter.webp', 'https://www.youtube.com/watch?v=PYy0sfFwm4E', '2:15', 2006),
(71, 'Elvis & Nixon', 13, 'Em 21 de dezembro de 1970, teve lugar um dos acontecimentos mais peculiares da história recente dos Estados Unidos. Na ocasião, a Casa Branca recebeu um ilustre visitante, um homem que pediu uma audiência privada - uma reunião que viria a se tornar lendária - com o presidente Richard Nixon (Kevin Spacey): o rei do rock and roll, Elvis Presley (Michael Shannon).\r\n', 'https://i.ytimg.com/vi_webp/92J9Ga7rmoY/movieposter.webp', 'https://www.youtube.com/watch?v=6CvzwGIRUYk', '1:25', 2016),
(72, 'IP Men 3', 13, 'Donnie Yen terá uma luta explosiva com o ex-campeão mundial dos pesos pesados de boxe Mike Tyson. E a história ainda abordará parte da juventude do maior discípulo de Yip Man: Bruce Lee.\r\n', 'https://i.ytimg.com/vi_webp/E1cS8_zPipQ/movieposter.webp', 'https://www.youtube.com/watch?v=sLO_djfvvZU', '1:44', 2016),
(73, 'A Arte da Paixão ', 13, '\r\nNo começo do século XX, uma escola de artistas britânica reuniu alguns dos maiores talentos da época, como o rebelde Alfred Munnings, além de Harold e Laura Knight. Neste contexto, dois aspirantes a artistas começam um romance: Florence Carter-Wood e Gilbert Evans. No entanto, Florence começa a se apaixonar por Alfred, e abandona Gilbert para ficar com o talentoso pintor. Mesmo assim, o coração dela está dividido.\r\n', 'https://i.ytimg.com/vi_webp/gqfSonlL0mc/movieposter.webp', 'https://www.youtube.com/watch?v=LFCPhVcv7VA', '1:41', 2013),
(74, 'Steve Jobs', 13, 'Três momentos importantes da vida do inventor, empresário e magnata Steve Jobs: os bastidores do lançamento do computador Macintosh, em 1984; da empresa NeXT, doze anos depois e do iPod, no ano de 2001.\r\n', 'https://i.ytimg.com/vi_webp/LJDWR4QVmMI/movieposter.webp', 'https://www.youtube.com/watch?v=aEr6K1bwIVs', '2:02', 2016),
(75, 'Grace de Mônaco ', 13, 'O casamento de Grace Kelly (Nicole Kidman) e o príncipe Rainier III (Tim Roth) foi considerado um conto de fadas na vida real quando aconteceu, em 1956. Entretanto, cinco anos mais tarde e com dois filhos, a verdade é que Grace está insatisfeita com a vida no palácio e o distanciamento do marido. A chance de novamente sentir-se útil surge quando seu velho amigo, o diretor Alfred Hitchcock (Roger Ashton-Griffiths), a convida para retornar ao cinema como protagonista de seu próximo filme: \"Marnie - Confissões de uma Ladra\". O problema é que Rainier é terminantemente contra e, ainda por cima, está envolvido com uma ameaça vinda do presidente francês Charles de Gaule (André Penvern): caso Mônaco não pague impostos à França e acabe com o paraíso fiscal existente, o principado será invadido em seis meses. Em meio às inevitáveis tensões, Grace e Rainier buscam resolver seus problemas tentando evitar que eles causem o divórcio.\r\n', 'https://i.ytimg.com/vi_webp/6TPGeCzvY88/movieposter.webp', 'https://www.youtube.com/watch?v=nrG_KWGHFd4', '1:42', 2015),
(76, 'Woodlawn: Talento e Fé ', 13, 'Um jogador de futebol americano precisa lutar contra as pressões sociais e raciais para ser bem sucedido na vida. Talentoso, ele terá de se apegar à fé e à sua capacidade para romper as barreiras impostas pelo destino.', 'https://i.ytimg.com/vi_webp/1h1fmlMUU7U/movieposter.webp', 'https://www.youtube.com/watch?v=CELZqeyWBRM', '2:03', 2015),
(77, 'O Último Mestre do Ar ', 14, 'A Nação do Fogo está em guerra com as nações da Água, do Ar e da Terra porque pretende dominar o mundo. O conflito já dura um século e não há a menor previsão de quando chegará ao fim. Somente o aparecimento de um Avatar, único capaz de controlar os quatro elementos, poderá ajudar a restabelecer o equilíbrio. Quando Katara (Nicola Peltz) e seu irmão Sokka (Jackson Rathbone) encontram o jovem e poderoso Aang (Noah Ringer), logo percebem que estão diante de uma possível solução e para isso partem juntos numa grande e perigosa aventura em busca da paz.\r\n', 'https://i.ytimg.com/vi_webp/PwoqG6Av2lY/movieposter.webp', 'https://www.youtube.com/watch?v=K0Xl9xJt9T0', '1:43', 2010),
(78, 'Cinderela ', 14, 'Após a trágica e inesperada morte do seu pai, Ella (Lily James) fica à mercê da sua terrível madrasta, Lady Tremaine (Cate Blanchett), e suas filhas Anastasia e Drisella. A jovem ganha o apelido de Cinderela e é obrigada a trabalhar como empregada na sua própria casa, mas continua otimista com a vida. Passeando na floresta, ela se encanta por um corajoso estranho (Richard Madden), sem desconfiar que ele é o príncipe do castelo. Cinderela recebe um convite para o grande baile e acredita que pode voltar a encontrar sua alma gêmea, mas seus planos vão por água abaixo quando a madrasta má rasga seu vestido. Agora, será preciso uma fada madrinha (Helena Bonham Carter) para mudar o seu destino...\r\n', 'https://i.ytimg.com/vi_webp/JqFFm3_OMEo/movieposter.webp', 'https://www.youtube.com/watch?v=KsnlU2y-Lz0', '1:15', 2015),
(79, 'Karatê Kid', 14, 'https://www.youtube.com/watch?v=srUhUPirCHo', 'https://i.ytimg.com/vi_webp/PltBg1EzRHQ/movieposter.webp', 'https://www.youtube.com/watch?v=srUhUPirCHo', '2:20', 210),
(80, 'Bob Esponja: Um Herói Fora D¨Água', 14, 'Incomodado com o sucesso do Siri Cascudo, a lanchonete do Sr. Sirigueijo que tem a exclusividade na produção do hambúrguer de siri, Plankton, o dono da lanchonete Balde de Lixo, resolve traçar uma verdadeira estratégia de guerra para roubar a fórmula da iguaria, que é a base da alimentação da população da Fenda do Biquíni. Mas alguma coisa sai errado e a fórmula desaparece, deixando a uma vez pacata comunidade à beira do apocalipse. Agora, Bob Esponja, o funcionário padrão do Siri Cascudo, vai ter que unir forças com o ambicioso Plankton em uma viagem no tempo e no espaço para tentar recuperar a receita, contando com a ajuda da leal estrela-do-mar Patrick, do sarcástico Lula Molusco, da esquilo cientista Sandy e também o mercenário Sr. Sirigueijo. Outro interessado na fórmula é o malvado pirata Barba Burguer (Antonio Banderas), que os heróis terão de enfrentar em uma batalha fora da água.\r\n', 'https://i.ytimg.com/vi_webp/9NlStoSlFWo/movieposter.webp', 'https://www.youtube.com/watch?v=T4-EwjoS5VU', '1:32', 2015),
(81, 'A Fantástica Fábrica de Chocolate ', 14, 'Willy Wonka (Johnny Depp) é o excêntrico dono da maior fábrica de doces do planeta, que decide realizar um concurso mundial para escolher um herdeiro para seu império. Cinco crianças de sorte, entre elas Charlie Bucket (Freddie Highmore), encontram um convite dourado em barras de chocolate Wonka e com isso ganham uma visita guiada pela lendária fábrica de chocolate, que não era visitada por ninguém há 15 anos. Encantado com as maravilhas da fábrica, Charlie fica cada vez mais fascinado com a visita.\r\n', 'https://i.ytimg.com/vi_webp/XFqWp6Tfyc0/movieposter.webp', 'https://www.youtube.com/watch?v=jexHKaOGOlA', '1:55', 2005),
(82, 'Frozen: Uma Aventura Congelante ', 14, 'A caçula Anna (Kristen Bell/Gabi Porto) adora sua irmã Elsa (Idina Menzel/Taryn Szpilman), mas um acidente envolvendo os poderes especiais da mais velha, durante a infância, fez com que os pais as mantivessem afastadas. Após a morte deles, as duas cresceram isoladas no castelo da família, até o dia em que Elsa deveria assumir o reinado de Arendell. Com o reencontro das duas, um novo acidente acontece e ela decide partir para sempre e se isolar do mundo, deixando todos para trás e provocando o congelamento do reino. É quando Anna decide se aventurar pelas montanhas de gelo para encontrar a irmã e acabar com o frio.\r\n', 'https://i.ytimg.com/vi_webp/due0Hw44bkM/movieposter.webp', 'https://www.youtube.com/watch?v=96VwQEhELyY', '1:42', 2013),
(83, 'A Pequena Sereia II: O Retorno Para o Ma', 14, 'Ariel e o príncipe Eric agora estão casados e tem uma linda filha, Melody. Mas eles se deparam com uma terrível ameaça: Morgana, a vingativa de irmã de Úrsula, que quer dominar o reino do fundo do mar. Para proteger a filha, Ariel esconde de Melody seu passado como sereia e constrói um muro em volta do castelo. Mas a inocente jovem sente uma forte atração pelo mundo do mar, o que é um trunfo para os maléficos planos de Úrsula. Agora, Ariel vai contar com de seus amigos Sebastião, Linguado e Sabidão para retomar a paz de sua família.\r\n', 'https://i.ytimg.com/vi_webp/NOPSNQJHelw/movieposter.webp', 'https://www.youtube.com/watch?v=htZ4jt3dZ5s', '1:15', 2000),
(84, 'A Família Addams ', 14, 'https://upload.wikimedia.org/wikipedia/pt/5/58/A_Fam%C3%ADlia_Addams_P%C3%B4ster.jpg', 'https://upload.wikimedia.org/wikipedia/pt/5/58/A_Fam%C3%ADlia_Addams_P%C3%B4ster.jpg', 'https://www.youtube.com/watch?v=LyyJYyIexq8', '1:50', 1951),
(85, 'Mulan 2: A Lenda Continua ', 14, 'Mulan tem a surpresa de sua vida quando o seu grande amor, o general Shang a pede em casamento, só que essa é apenas uma das muitas surpresas que a esperam. Mushu, o seu dragão guarda-costas, está se sentindo ameaçado com o casamento, e faz de tudo para sabotar a relação dos dois, com medo de que perca o emprego. Só que antes do \"E viveram felizes para sempre\", Mulan e Shang são enviados a uma missão especial de guiar três princesas através da China para encontrarem seus futuros maridos. Durante a jornada, Mulan descobre que as meninas não estão nada empolgadas com o casamento, e vai tentar convencê-las a casar apenas por amor. Enquanto isso, os mongóis invadem a China, e a decisão de Mulan pode por ainda mais em risco a situação do país.\r\n', 'https://i.ytimg.com/vi_webp/FHXZmzcXhto/movieposter.webp', 'https://www.youtube.com/watch?v=gWf2Cg00kD0', '1:28', 1998),
(86, 'Madagascar 2: A Grande Escapada ', 14, 'Alex (Ben Stiller), Marty (Chris Rock), Melman (David Schwimmer), Gloria (Jada Pinkett Smith), rei Julien (Sacha Baron Cohen), Maurice (Cedric the Entertainer), os pingüins e os chimpanzés estão no longínquo litoral de Madagascar. Para deixar o local os pingüins consertam um velho avião de guerra, mas logo em seu 1º vôo ele cai. Isto faz com que os animais do zoológico de Nova York tenham que lidar, pela 1ª vez na vida, com espécies semelhantes a eles, só que habituadas à vida selvagem.\r\n', 'https://i.ytimg.com/vi_webp/lHV15-QYrgs/movieposter.webp', 'https://www.youtube.com/watch?v=mMQQa4Jww84', '1:29', 2008);
INSERT INTO `filmes` (`id_filmes`, `nome`, `categoria`, `resumo`, `poster`, `trailer`, `duracao`, `ano`) VALUES
(87, 'Sete Minutos Depois da Meia-Noite ', 14, 'Conor é um garoto de 13 anos de idade, com muitos problemas na vida. Seu pai é muito ausente, a mãe sofre um um câncer em fase terminal, a avó é uma megera, e ele é maltratado na escola pelos colegas. No entanto, todas as noites Conor tem o mesmo sonho, com uma gigantesca árvore que decide contar histórias para ele, em troca de escutar as histórias do garoto. Embora as conversas com a árvore tenham consequências negativas na vida real, elas ajudam Conor a escapar das dificuldades através do mundo da fantasia.\r\n', 'https://i.ytimg.com/vi_webp/rzG7ocoj1p8/movieposter.webp', 'https://www.youtube.com/watch?v=7oceCE4VjqI', '1:48', 2016),
(88, 'Não Me Abandone JamaiS', 14, 'Ruth (Keira Knightley), Tommy (Andrew Garfield) e Kathy (Carey Mulligan) cresceram juntos em um internato cheio de disciplinas rígidas nas questões da alimentação e na manutenção do corpo saudável. Criados, praticamente, sem contato com o mundo exterior na misteriosa escola, os três sempre foram muito unidos, mas uma revelação surpreendente sobre doação de órgãos e o objetivo de suas vidas pode mudar o rumo da história. Ainda mais pelo clima de romance entre Ruth (Keira) e Tommy (Andrew) incomodar cada vez mais Kathy (Carey).\r\n', 'https://i.ytimg.com/vi_webp/oyRf0if5-bE/movieposter.webp', 'https://www.youtube.com/watch?v=pnW-NlwZcds', '1:43', 2011),
(89, 'Ela Dança, Eu Danço 5: Tudo ou Nada', 14, 'Quinto filme da franquia Ela Dança, Eu Danço. Na nova trama, um grupo de dançarinos deve participar de uma importante competição de dança em Las Vegas. capaz de determinar o rumo de suas carreiras;\r\n', 'https://i.ytimg.com/vi_webp/hhBIDoyVdrw/movieposter.webp', 'https://www.youtube.com/watch?v=o-Bwv0DAmX4', '1:52', 2014),
(90, 'Ela Dança, Eu Danço 4 ', 14, 'Emily (Kathryn McCormick) é a filha de uma ocupada empresária que chega a Miami com o sonho de se tornar dançarina profissional. Logo ela se apaixona por Sean (Ryan Guzman), o responsável por criar elaboradas danças para a realização de flash mobs, aglomerações instantâneas de pessoas em um lugar público para realizar uma ação previamente combinada. Líder de um grupo chamado MOB, Sean resolve participar de uma disputa que pode render uma oportunidade de patrocínio.\r\n', 'https://i.ytimg.com/vi_webp/gIxBNgBhU-k/movieposter.webp', 'https://www.youtube.com/watch?v=IQXBxbgT2go', '1:39', 2013),
(91, 'Ela Dança, Eu Danço 2 ', 14, 'Andie (Briana Evigan) é uma dançarina de rua rebelde, que entrou para a conceituada Maryland School of the Arts. O local é frequentado pela elite da sociedade local, ou seja, o tipo de pessoa bem diferente das quais Andie costuma lidar. Precisando enfrentar barreiras para se ambientar com os novos colegas, ela inicia fora da escola um projeto ousado: formar um grupo de dança de rua. Para tanto conta com a ajuda de Chase (Robert Hoffman), o dono da escola de dança mais quente da região.\r\n', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTae4lwiufzEcvEbe0DfBPxO43gWOipU6e8nDFwplxxJvYfzIkEj4mQgQ', 'https://www.youtube.com/watch?v=TA60YSxdPMY', '1:38', 2008),
(92, 'Ela Dança, Eu Danço', 14, 'Após depredar um colégio, Tyler Gage (Channing Tatum) é enviado para fazer serviços comunitários em uma escola de artes. Lá ele conhece Nora Clark (Jenna Dewan), uma bela aluna de dança moderna que precisa urgentemente de um novo parceiro. Tyler está acostumado com as danças de rua, mas reluta à idéia de ser o novo parceiro de Nora. Aos poucos ele aceita a idéia e passa a se envolver com Nora.\r\n', 'https://i.ytimg.com/vi_webp/Eo9dhUd_wdk/movieposter.webp', 'https://www.youtube.com/watch?v=RtMh5XmTDnk', '1:43', 2006),
(93, 'Capitão Fantástico ', 14, 'Ben (Viggo Mortensen) tem seis filhos com quem vive longe da civilização, no meio da floresta, numa rígida rotina de aventuras. As crianças lutam, escalam, leem obras clássicas, debatem, caçam e praticam duros exercícios, tendo a autossuficiência sempre como palavra de ordem. Certo dia um triste acontecimento leva a família a deixar o isolamento e o reencontro com parentes distantes traz à tona velhos conflitos.\r\n', 'https://i.ytimg.com/vi_webp/1bvi_ohiHDI/movieposter.webp', 'https://www.youtube.com/watch?v=YgRo_taGWPg', '1:59', 2016),
(94, 'A Fabulosa Gilly Hopkins ', 14, 'Gilly Hopkins (Sophie Nélisse), uma incontrolável menina de 12 anos, vive indo e vindo de lares adotivos. Até que ela é enviada para a casa da estranha família Trotter e conhece Maime Trotter (Kathy Bates). As duas se unem e tentam armrar um plano de fuga e assim achar a mãe biológica de Gilly.\r\n', 'https://i.ytimg.com/vi_webp/ZjQO2oitqpY/movieposter.webp', 'https://www.youtube.com/watch?v=T0_MnBYJ8ck', '1:37', 2017),
(95, 'A Descoberta ', 14, 'Após comprovar cientificamente a existência de vida depois da morte, um cientista vê sua descoberta liberar um verdadeiro caos em meio a população, causando uma onda de suicídios. Em meio a este turbilhão, seu filho se apaixona por uma mulher que tem um passado marcado por eventos trágicos.\r\n', 'http://br.web.img2.acsta.net/pictures/17/02/22/18/17/527496.jpg', 'https://www.youtube.com/watch?v=6aaCtHRBWbE', '1:50', 2017),
(96, 'Um Limite Entre Nós ', 14, 'Anos 1950. Troy Maxson (Denzel Washington) tem 53 anos e mora com a esposa, Rose (Viola Davis), e o filho mais novo, Cory (Jovan Adepo). Ele trabalha recolhendo lixo das ruas e batalha na empresa para que consiga migrar para o posto de motorista do caminhão de lixo. Troy sente um profundo rancor por não ter conseguido se tornar jogador profissional de baseball, devido à cor de sua pele, e por causa disto não quer que o filho siga como esportista. Isto faz com que o jovem bata de frente com o pai, já que um recrutador está prestes a ser enviado para observá-lo em jogos de futebol americano.\r\n', 'https://i.ytimg.com/vi_webp/iIWSq6-KUtE/movieposter.webp', 'https://www.youtube.com/watch?v=IVBBJw5oFbU', '2:18', 2016),
(97, 'Cinquenta Tons Mais Escuros ', 7, 'Incomodada com os hábitos e atitudes de Christian Grey (Jamie Dornan), Anastasia (Dakota Johnson) decide terminar o relacionamento e focar no desenvolvimento de sua carreira. Ele, no entanto, não desiste tão fácil e fica sempre ao seu encalço, insistindo que aceita as regras dela. Tal cortejo acaba funcionando e ela reinicia o relacionamento com o jovem milionário, sendo que, aos poucos, passa a compreender melhor os jogos sexuais que ele tanto aprecia.\r\n', 'https://i.ytimg.com/vi_webp/PYIy2nwlWVI/movieposter.webp', 'https://www.youtube.com/watch?v=vJ41tFyuaFs', '1:57', 2017),
(98, 'Cinquenta Tons de Cinza', 7, 'Anastasia Steele (Dakota Johnson) é uma estudante de literatura de 21 anos, recatada e virgem. Uma dia ela deve entrevistar para o jornal da faculdade o poderoso magnata Christian Grey (Jamie Dornan). Nasce uma complexa relação entre ambos: com a descoberta amorosa e sexual, Anastasia conhece os prazeres do sadomasoquismo, tornando-se o objeto de submissão do sádico Grey.\r\n', 'https://i.ytimg.com/vi_webp/qCjPGqb5Z7c/movieposter.webp', 'https://www.youtube.com/watch?v=DEwIt4amgq4', '2:05', 2015),
(99, 'Deixa Rolar', 7, 'Um roteirista se vê em apuros quando um produtor lhe encomenda o roteiro de uma comédia romântica típica. O problema é que ele acredita que filmes deste tipo idealizam o amor de uma forma que ele nunca é na vida real, mas ele poderá escrever seu sonhado roteiro de um filme de ação em seguida.', 'https://i.ytimg.com/vi_webp/0ujCzx4AhEo/movieposter.webp', 'https://www.youtube.com/watch?v=PqOd-FJk95o', '1:34', 2014),
(100, ' Godzila Resurgence ', 3, 'Refilmagem do clássico original japonês sobre o monstro Godzilla. Com o novo aparecimento do monstro, o Japão mergulha em um cenário caótico.\r\n', ' http://t1.gstatic.com/images?q=tbn:ANd9GcRSXoaO2A1-iuFl31Ws9WFS_YcJ5UbIvzDg8Jld3JfAApkGfWBr', 'https://www.youtube.com/watch?v=hNwORVbNN-s', '2:00', 2016),
(104, 'Resident Evil 6', 3, 'Sobrevivente do massacre zumbi, Alice (Milla Jovovich) retorna para onde o pesadelo começou, Raccoon City, onde a Umbrella Corporation reúne suas forças para um ataque final contra os remanescentes do apocalipse. Para vencer a dura batalha final e salvar a raça humana, a heroína recruta velhos e novos amigos.\r\n', 'https://i.ytimg.com/vi_webp/_ACXY37p8qU/movieposter.webp', 'https://www.youtube.com/watch?v=17sInSM9kE0', '1:46', 2016),
(106, 'Shark¨s Planet', 3, 'Em um futuro próximo, o derretimento glacial cobriu 98% da Terra. Enquanto os sobreviventes se abrigam em embarcações, os tubarões se tornaram a espécie dominante do planeta, realizando um ataque mortal através da liderança de um tubarão alfa-mutante.\r\n', 'http://bocadoinferno.com.br/wp-content/uploads/2016/07/Planet-of-the-Sharks-2016-1.jpg', 'https://www.youtube.com/watch?v=lUuQhbHMzMU', '1:30', 2016),
(107, 'Resgate suicida', 3, 'O policial secreto Billy Tong infiltrou-se na Gangue Ching Tau e descobriu que eles estão planejando sequestrar Tiffany Long, a filha de um notório chefe da tríade Dragon Head Xi Long. Quando Billy descobre que Melinda, sua ex-mulher está grávida, ele questiona suas escolhas de carreira e arrisca a segurança da filha de Xi Long e de sua nova família.\r\n', 'http://br.web.img3.acsta.net/c_215_290/pictures/17/06/23/22/46/545614.jpg', 'https://www.youtube.com/watch?v=BM_J2DckAhI', '1:32', 1998),
(108, 'Passageiros', 1, 'Durante uma viagem de rotina no espaço, dois passageiros são despertados 90 anos antes do tempo programado, por causa de um mal funcionamento de suas cabines. Sozinhos, Jim (Chris Pratt) e Aurora (Jennifer Lawrence) começam a estreitar o seu relacionamento. Entretanto, a paz é ameaçada quando eles descobrem que a nave está correndo um sério risco e que eles são os únicos capazes de salvar os mais de cinco mil colegas em sono profundo.\r\n', 'https://i.ytimg.com/vi_webp/RN1STKnsq0w/movieposter.webp', 'https://www.youtube.com/watch?v=Q5MV9qMXH2I', '1:56', 2016),
(109, 'Horizonte profundo: desastre no golfo', 3, 'Baseada em eventos reais, a história se passa no Golfo do México, na plataforma de perfuração marítima Deepwater Horizon. Diante de um dos piores vazamentos de petróleo na história dos EUA, Mike Williams (Mark Wahlberg) e os demais trabalhadores embarcados lutam para escapar com vida do terrível acidente.\r\n', 'https://i.ytimg.com/vi_webp/MIrG_bWafhI/movieposter.webp', 'https://www.youtube.com/watch?v=doKipfsbzPM', '1:47', 2016),
(110, 'Hancock', 3, 'Hancock (Will Smith) é um super-herói que perdeu a popularidade que tinha, devido às suas tentativas de resgate pouco convencionais. Após salvar Ray Embrey (Jason Bateman), um agente de relações públicas, ele se oferece para ajudá-lo a melhorar sua imagem. A idéia não é bem aceita por Mary (Charlize Theron), a esposa de Ray, que mostra ao marido que Hancock teve uma ordem de prisão contra si lançada. Ray então sugere que Hancock se entregue, mesmo podendo escapar da prisão na hora que quisesse, para dar o exemplo e iniciar a mudança de sua imagem junto ao público. Ray acredita que, com Hancock preso, a criminalidade irá disparar e, com isso, a população chamará de volta seu herói.\r\n', 'https://i.ytimg.com/vi_webp/Tb6Fq7dBgUo/movieposter.webp', 'https://www.youtube.com/watch?v=SkX1VuXLRSc', '1:42', 2008),
(111, 'Call to Duty: Fora de Alcance', 3, 'Parte do batalhão de operações especiais, o Esquadrão Alpha tinha uma missão de reconhecimento que parecia ser simples. Entretanto, eles são atacados por um grupo de zumbis sanguinários - e sua guerra será pela sobrevivência e continuidade da raça humana.\r\nNo filme Call of Duty: Fora de Alcance, os membros do Esquadrão Alpha terão que liderar uma nova missão. O que era para ser uma simples missão se transforma em uma guerra pela sobrevivência quando descobrem uma onda de experimentos com mortos-vivos. Agora o Esquadrão Alpha deve lutar, não apenas pela sobrevivência de seus membros, mas também pelos habitantes da terra, pois o destino do mundo está em jogo.', 'https://img.fstatic.com/ZE_2vsetcKurd79K64eI6AYanjg=/fit-in/290x478/smart/https://cdn.fstatic.com/media/movies/covers/2017/03/Call-to-Duty-Fora-de-Alcance.jpg', 'https://www.youtube.com/watch?v=UKqmFjQw2fg', '1:42', 2017),
(112, 'A volta do juízo final', 1, 'Selene (Kate Beckinsale) é uma guerreira vampira que luta para acabar com a guerra eterna entre o clã Lycan de lobisomens sanguinários e a facção de vampiros que a traiu. Quando um novo levante parece tomar forma, ela irá utilizar sua influência e relacionamento com ambas as partes para negociar um cessar fogo.\r\n', 'http://megafilmesonline.net/wp-content/uploads/2017/02/a-volta-do-juizo-final.jpg', 'https://www.youtube.com/watch?v=FGzpX-4ihXM', '1:46', 2016),
(114, 'A volta do juízo final.', 8, 'Selene (Kate Beckinsale) é uma guerreira vampira que luta para acabar com a guerra eterna entre o clã Lycan de lobisomens sanguinários e a facção de vampiros que a traiu. Quando um novo levante parece tomar forma, ela irá utilizar sua influência e relacionamento com ambas as partes para negociar um cessar fogo.\r\n', 'http://megafilmesonline.net/wp-content/uploads/2017/02/a-volta-do-juizo-final.jpg', 'https://www.youtube.com/watch?v=FGzpX-4ihXM', '1:46', 2016),
(115, 'Não é Mais Um Besteirol Americano', 4, 'O filme não mostra misericórdia conforme espeta as convenções e clichês do gênero que você odeia amar. Junte-se Janey Briggs, um aspirante à artista que é motivo de riso de seus colegas por usar óculos, um rabo de cavalo e um macacão manchado, e Jake Wyler, o astro do futebol americano.', 'http://br.web.img3.acsta.net/pictures/15/07/14/18/44/513310.jpg', 'https://www.youtube.com/watch?v=7UilTSut5W8', '1:29', 2001),
(116, 'Vizinhos Nada Secretos', 4, 'Um casal suburbano se envolve em uma trama de espionagem internacional quando descobre que seus aparentemente perfeitos novos vizinhos são agentes secretos.', 'http://telecineon.com.br/arquivo/filme/217ed012305be55aad3aae88035ac1a14.jpg', 'https://www.youtube.com/watch?v=2UtReT84w28', '1:46', 2016);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `senha` varchar(35) COLLATE utf8_bin NOT NULL,
  `categoria_favorita` int(11) NOT NULL,
  `privilegio` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `categoria_favorita`, `privilegio`) VALUES
(5, 'Brunos', 'badmin@supreme.com', 'ba2fe69ce80f9172f9313241e638fc4f', 3, 1),
(7, 'Lucas Jose', 'lucas@gmail.com', 'f1b71c9df6cbaaa9e8739c3bcd2be1bc', 5, 0);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_filme` (`id_filme`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `categoria` (`categoria`);

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_filme` (`id_filme`);

--
-- Índices de tabela `filmes`
--
ALTER TABLE `filmes`
  ADD PRIMARY KEY (`id_filmes`),
  ADD UNIQUE KEY `nome_filme` (`nome`),
  ADD KEY `categoria` (`categoria`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `categoria_favorita` (`categoria_favorita`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de tabela `filmes`
--
ALTER TABLE `filmes`
  MODIFY `id_filmes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_filme` FOREIGN KEY (`id_filme`) REFERENCES `filmes` (`id_filmes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `filmes`
--
ALTER TABLE `filmes`
  ADD CONSTRAINT `filmes_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
