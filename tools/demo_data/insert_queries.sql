-- SQL queries to insert data into the tables

-- Insert data into companies table
INSERT INTO companies (company_id, name, addr, created_at, updated_at) VALUES
(1, 'Mcdaniel-Chapman', '382 Sabrina Radial Suite 031
Port Michaelstad, WI 60796', '2024-05-20 02:30:10', '2024-01-06 10:12:41'),
(2, 'Henderson Ltd', '845 Mejia Road Apt. 030
Elliottfurt, CO 07716', '2024-04-08 23:43:34', '2024-04-03 01:15:26'),
(3, 'Chandler, Knox and French', '476 Vasquez Port
West Joseph, MN 02818', '2024-04-05 18:06:22', '2024-05-29 23:21:36'),
(4, 'Sweeney, Fischer and Butler', '9094 Nicole Trafficway Apt. 223
Howeborough, NH 85001', '2024-03-10 14:05:31', '2024-05-04 13:41:00'),
(5, 'Bennett-Hughes', '207 Meyer Well
Frankton, MA 67319', '2024-02-15 02:56:27', '2024-01-22 13:01:38');

-- Insert data into users table
INSERT INTO users (user_id, company_id, username, email, password, salt, role, created_at, updated_at, firstname, surname) VALUES
(1, 4, 'ruizjane', 'jennifer01@example.org', '902aa553b594377b5a3e1846c598e73231bf011d935cd8002082d14fc57c9b7b', 'd23e6570ea2a3660', 'Admin', '2024-04-02 05:59:16', '2024-03-28 20:00:07', 'Rachel', 'Orr'),
(2, 1, 'jsmith', 'cunninghamamber@example.com', '8a0a2abb7fd8d0e16baadcac8ef14be2757943f65330e641a9c83f3ddbe515e4', '7d50a8274cc4a00b', 'Employee', '2024-05-15 11:36:31', '2024-06-13 05:53:12', 'Alan', 'Mcdaniel'),
(3, 5, 'ballangel', 'smay@example.org', '8eb3ce06f439e43517fbb6780f9f80b6c4a90e3e765e931c599341538a53dd94', '51b6a45a3c332fed', 'Admin', '2024-03-17 14:18:18', '2024-05-03 12:34:44', 'Cindy', 'Downs'),
(4, 4, 'hwhite', 'wilsonkevin@example.com', '4defd0fec6d1ebe38417d4d7a7649ca663adc9488de97230e94eac5b488f5bce', '80f167699a4b4bb2', 'Admin', '2024-04-29 16:23:28', '2024-02-02 08:10:20', 'Latoya', 'Valenzuela'),
(5, 4, 'catherine03', 'jasonbray@example.org', 'f114637dcacbbc6169c0b23310f749c792418d93913911fe50cafff9656643fb', 'eb165f4d7a5f2f20', 'Admin', '2024-05-28 01:29:33', '2024-01-30 22:19:36', 'Brian', 'Stone'),
(6, 3, 'johnhanson', 'samueldavis@example.org', '4c9feb4fef80289938abf121b7c1fd578cd8ac19567e396de25b2342ac5d25ce', 'ab85962b8df2c373', 'Employee', '2024-01-07 22:43:33', '2024-02-23 20:40:29', 'Ian', 'Robinson'),
(7, 5, 'danielle70', 'hle@example.net', '8966110a0ab5d8beab3b8db0d574119d9bcfad3f89e6cbb1fcc5ae47a1103bfc', '8524acb966875803', 'Admin', '2024-05-18 09:16:46', '2024-04-15 17:34:16', 'Tonya', 'Patton'),
(8, 5, 'rmendoza', 'bcarpenter@example.com', 'd592e42d39fb46e2e090670e508cbdb952dc11e7b5f8d87e0d83e142ce854ee7', '8475ee400c972b54', 'Employee', '2024-04-19 16:46:12', '2024-04-27 03:24:40', 'Haley', 'Nixon'),
(9, 2, 'sgeorge', 'russellteresa@example.com', '4d44fca4f782d556d69e75b9343d3b9fab3d5009e62e869c5574eaaef7e75b2a', '331ac02c7d571f69', 'Employee', '2024-05-29 11:56:02', '2024-01-14 17:30:39', 'Melissa', 'Barnes'),
(10, 5, 'jesse42', 'wburns@example.org', '28611e0f8238e1806d7da0e7ce97dd7fa7189a678b9a700fd7f9d672a87aa4b2', 'd068b4927238960f', 'Employee', '2024-01-27 05:44:20', '2024-06-08 17:40:42', 'Joshua', 'Adams'),
(11, 1, 'williamschristopher', 'brittanychristensen@example.net', '6666c9e199edf25b9da1dea895ceca8d128b027dcbb23118c43918030b3202cd', '09fe2ab9954ef21c', 'Employee', '2024-01-31 15:53:39', '2024-05-11 22:00:58', 'Ashley', 'Hill'),
(12, 5, 'patelcarrie', 'wilcoxjon@example.net', 'c554992d434aa90c860337e2768b9f5ee8c4dc99fde9997a20e186493e1c858c', '8a4f7701fb70fc4d', 'Employee', '2024-03-01 03:10:13', '2024-03-08 16:11:02', 'Benjamin', 'Pratt'),
(13, 5, 'hlucero', 'bennettglenn@example.com', 'e3d772512a6cb10082a947d7db21f973da3c2301317a57c21536974fd854592a', '2f57b4b3bce0d28e', 'Employee', '2024-03-05 02:33:25', '2024-01-19 21:26:18', 'Joseph', 'Dorsey'),
(14, 4, 'amandahamilton', 'uthompson@example.org', 'd4b5c56c0143f54455898bcbc047c9e5b39a2908891535a712944585198db699', 'b80d9ad8e7edd133', 'Employee', '2024-02-21 00:21:37', '2024-01-03 13:47:53', 'Joshua', 'Dudley'),
(15, 3, 'jonathanthomas', 'erika53@example.net', '47507c005ec1a2bd7b5142e11b5debf6f9804b9ad31b305a87d89a3f22f52fc4', '8a6fdd2e4a5b0a83', 'Employee', '2024-04-24 09:41:43', '2024-05-22 16:07:42', 'Nancy', 'Alvarado'),
(16, 1, 'ghill', 'millskelly@example.org', '1ce906a6645f8dda8b807977331ceee860399ceb223fb4bfd866e736727ad972', '89cc6c79ff3c2df2', 'Admin', '2024-02-07 14:41:31', '2024-01-06 04:38:32', 'Jacob', 'Reyes'),
(17, 5, 'rnelson', 'anthonywells@example.net', '24834ce045f09668002c60816e1378ef979093140f3fbc322c06feaa93aedc1b', '1d0d5280ef5fd1e3', 'Admin', '2024-03-16 02:26:53', '2024-05-02 19:26:27', 'Robert', 'Lopez'),
(18, 5, 'debrachapman', 'roy27@example.net', 'c4cc76e8a82d391b1fe74223152cef27a475d1cda74bf53227d323a13a1de17c', '1a8edf00c2aaeb98', 'Employee', '2024-03-14 22:42:59', '2024-03-08 03:29:54', 'Michael', 'Carlson'),
(19, 4, 'matthew98', 'lindalewis@example.com', '4479fa4bd9bfd2e68d8b24b3fcb33b156a513db435ccd92c6b005c994a39b1e9', '5bfc2630087e5f7b', 'Admin', '2024-05-14 09:04:26', '2024-03-31 18:36:38', 'Angela', 'Owens'),
(20, 3, 'kathleenparker', 'zamorathomas@example.org', '6478dcbb158de3899ca96187e5b58274f26f98bb7cdb0038e34a4e701122d691', '716a5e78ee89ba09', 'Employee', '2024-03-23 13:31:42', '2024-03-11 12:02:27', 'Diana', 'Griffith');

-- Insert data into locations table
INSERT INTO locations (location_id, company_id, location, addr, created_at, updated_at) VALUES
(1, 1, 'Rhodesburgh', 'Unit 8025 Box 5472
DPO AA 59540', '2024-05-11 13:05:59', '2024-05-17 11:03:54'),
(2, 5, 'New Molly', '0760 Tiffany Crescent
Whiteburgh, NE 13787', '2024-01-29 00:52:58', '2024-01-13 22:48:31'),
(3, 4, 'Tylerhaven', 'PSC 3386, Box 9209
APO AP 84914', '2024-03-12 18:33:21', '2024-05-16 07:25:28'),
(4, 3, 'North Daniel', '26491 Paul Forest Suite 171
Jimmyville, WA 94462', '2024-05-22 12:02:31', '2024-05-22 19:06:48'),
(5, 4, 'Port Beverly', '6918 Jessica Union Suite 828
Nicolemouth, IA 95691', '2024-02-11 11:48:38', '2024-01-14 20:19:43'),
(6, 2, 'Cowanstad', '91420 Morgan Dale Suite 377
Perezstad, AR 18826', '2024-05-19 05:25:22', '2024-06-13 05:13:29'),
(7, 4, 'Port Philipchester', '284 Lin View
East Rachelmouth, MH 01662', '2024-04-19 08:41:19', '2024-06-01 08:19:29'),
(8, 5, 'North Jessicastad', 'USNS Cain
FPO AE 75351', '2024-05-10 01:04:15', '2024-04-09 03:18:27'),
(9, 1, 'East Jason', '099 Scott Meadow Suite 577
Lewisstad, DE 44398', '2024-02-07 21:00:15', '2024-02-06 11:11:54'),
(10, 4, 'Alexanderland', '724 Watkins Hills Apt. 686
Lake Joannshire, PR 18204', '2024-03-23 14:09:12', '2024-02-24 04:18:32'),
(11, 5, 'Crawfordside', '40599 Jenny Crest Apt. 157
Amandaberg, MA 91034', '2024-02-10 06:58:54', '2024-02-27 07:58:11'),
(12, 3, 'Bryanville', '5355 Cox Ways
Villanuevastad, ID 75024', '2024-05-03 21:58:23', '2024-04-27 18:56:15'),
(13, 3, 'South Robertville', '565 Scott Stravenue Apt. 690
Frankburgh, ME 12898', '2024-05-09 05:04:28', '2024-06-03 09:17:19'),
(14, 1, 'Catherineberg', '468 Paige Tunnel Apt. 513
Norrisview, MT 77558', '2024-02-20 20:36:30', '2024-04-25 00:15:41'),
(15, 3, 'Taylorhaven', '7644 Johnson Bypass Apt. 125
Michaelhaven, SC 32151', '2024-02-12 23:23:28', '2024-03-20 13:05:30');

-- Insert data into items table
INSERT INTO items (sku, name, description, category, unit_type, metadata, created_at, updated_at) VALUES
(2419800137645, 'wide', 'Attorney third business do sister.', 'to', 'fractional', '{"color": "DarkTurquoise", "weight": 72.67084827773442}', '2024-05-25 06:10:49', '2024-01-29 08:34:12'),
(9605163951315, 'smile', 'Worry hand weight himself upon end.', 'two', 'fractional', '{"color": "DarkKhaki", "weight": 61.21726827038164}', '2024-04-30 06:28:50', '2024-04-10 03:16:48'),
(7588673499176, 'simple', 'Movement here sure go.', 'store', 'fractional', '{"color": "Lime", "weight": 88.78525583413102}', '2024-05-07 23:22:15', '2024-04-17 19:21:23'),
(8272422255043, 'clear', 'Teacher minute no send though.', 'road', 'whole', '{"color": "DimGray", "weight": 96.99375615495306}', '2024-03-14 09:24:35', '2024-02-14 17:29:12'),
(7200976850767, 'group', 'Little late policy page community.', 'land', 'measured', '{"color": "HotPink", "weight": 72.23369762344409}', '2024-01-04 01:49:21', '2024-01-23 12:18:08'),
(1319230535633, 'enjoy', 'Land skill allow build cup sea her add.', 'instead', 'whole', '{"color": "LavenderBlush", "weight": 13.4462906670604}', '2024-01-21 23:45:34', '2024-05-10 05:48:44'),
(5138184309208, 'society', 'Whatever page century able.', 'best', 'whole', '{"color": "LightGoldenRodYellow", "weight": 27.94414097825144}', '2024-03-08 19:16:24', '2024-05-20 17:25:46'),
(4038403844286, 'pull', 'Help notice specific company nice happen care.', 'prepare', 'fractional', '{"color": "GoldenRod", "weight": 6.893091532975572}', '2024-03-17 04:41:46', '2024-01-28 17:23:20'),
(4255873067674, 'body', 'Assume several visit third career.', 'term', 'measured', '{"color": "SteelBlue", "weight": 99.66139885672439}', '2024-02-16 09:38:04', '2024-05-01 16:52:58'),
(4444039222143, 'system', 'Describe major team mouth.', 'give', 'whole', '{"color": "Khaki", "weight": 53.29505006431438}', '2024-05-25 15:24:17', '2024-01-05 20:34:00'),
(9904092791284, 'herself', 'Boy because will building hundred often cold.', 'remember', 'fractional', '{"color": "Orange", "weight": 3.1366601444037476}', '2024-03-24 10:01:03', '2024-01-07 18:55:50'),
(2237128745911, 'him', 'Summer catch ok employee true.', 'difficult', 'whole', '{"color": "SandyBrown", "weight": 88.90673139623462}', '2024-04-25 01:01:03', '2024-01-05 22:59:22'),
(290984023885, 'wrong', 'School history late analysis middle.', 'senior', 'fractional', '{"color": "Coral", "weight": 36.91406054750522}', '2024-04-18 14:15:21', '2024-02-17 06:51:55'),
(926907508145, 'three', 'Against something place fish member career.', 'size', 'fractional', '{"color": "WhiteSmoke", "weight": 34.557376132171576}', '2024-01-10 17:48:33', '2024-04-11 05:21:42'),
(764961794797, 'much', 'Manager body significant.', 'image', 'fractional', '{"color": "DarkOrange", "weight": 37.167058123109896}', '2024-04-03 16:45:12', '2024-05-10 19:22:24'),
(5950084810482, 'fight', 'Country travel boy court happen.', 'first', 'measured', '{"color": "Moccasin", "weight": 33.85721901718438}', '2024-05-13 17:47:21', '2024-05-31 17:29:08'),
(4334418113257, 'once', 'With notice economic really whole.', 'method', 'fractional', '{"color": "Bisque", "weight": 18.965494832178127}', '2024-04-18 01:02:32', '2024-01-28 23:22:49'),
(1504901534248, 'military', 'Then standard art hair cup.', 'finally', 'fractional', '{"color": "PaleTurquoise", "weight": 35.54447741128395}', '2024-05-16 19:40:18', '2024-05-04 04:49:40'),
(8580938118715, 'arrive', 'Sense up although analysis media.', 'produce', 'whole', '{"color": "CornflowerBlue", "weight": 26.344219103651266}', '2024-01-19 17:16:19', '2024-02-02 06:07:01'),
(9044510988107, 'few', 'Choose about camera party off turn purpose reflect.', 'have', 'fractional', '{"color": "Salmon", "weight": 67.99424576776524}', '2024-04-25 14:27:38', '2024-01-17 00:23:21'),
(6620204926186, 'job', 'Similar later class shoulder senior.', 'appear', 'measured', '{"color": "Aqua", "weight": 52.1426080616244}', '2024-03-16 19:15:04', '2024-02-20 01:28:06'),
(2815401310089, 'trouble', 'Road window involve report six.', 'say', 'fractional', '{"color": "Green", "weight": 2.6523747104239357}', '2024-02-13 06:23:53', '2024-05-14 00:53:54'),
(98779214988, 'study', 'Almost black when pay old.', 'those', 'whole', '{"color": "Cyan", "weight": 89.50482428063104}', '2024-03-17 14:52:54', '2024-03-13 04:29:33'),
(6057784308338, 'specific', 'Significant around establish for parent prevent.', 'media', 'whole', '{"color": "Brown", "weight": 61.14915593031511}', '2024-03-14 19:48:58', '2024-01-31 18:20:40'),
(4367246304283, 'fast', 'Region language market.', 'front', 'fractional', '{"color": "Sienna", "weight": 92.98254274357184}', '2024-03-04 17:04:14', '2024-01-30 10:10:36'),
(9804570082876, 'media', 'Rock home though know measure argue laugh.', 'alone', 'measured', '{"color": "Linen", "weight": 17.01727406958492}', '2024-02-23 10:09:39', '2024-04-05 09:15:32'),
(7028690810245, 'really', 'Perhaps full hit trade general ground.', 'product', 'fractional', '{"color": "MediumOrchid", "weight": 94.1047552531568}', '2024-05-31 19:51:57', '2024-06-13 00:10:35'),
(5788754254041, 'break', 'Grow parent long nice expert.', 'most', 'whole', '{"color": "LightBlue", "weight": 23.972405775691787}', '2024-03-01 12:34:55', '2024-05-04 05:40:22'),
(9220647914145, 'citizen', 'Trial boy end lose.', 'apply', 'whole', '{"color": "PeachPuff", "weight": 82.61342698904718}', '2024-06-04 23:30:49', '2024-03-06 03:10:48'),
(8658012079396, 'subject', 'Family executive rather natural financial loss.', 'anything', 'whole', '{"color": "LavenderBlush", "weight": 98.18116874885271}', '2024-05-03 18:25:18', '2024-04-17 08:57:42'),
(7052590299695, 'admit', 'Production lay through until factor.', 'shake', 'fractional', '{"color": "Salmon", "weight": 79.22465770984661}', '2024-06-16 05:33:13', '2024-01-14 08:31:58'),
(6782412987653, 'meeting', 'Rise police quite again open employee right.', 'nothing', 'whole', '{"color": "SlateGray", "weight": 80.2385874189132}', '2024-02-06 03:44:16', '2024-01-11 16:18:43'),
(9260927333211, 'available', 'Mouth ago town stock use mean event.', 'face', 'measured', '{"color": "Crimson", "weight": 66.7856433858535}', '2024-02-09 11:14:12', '2024-05-03 18:42:02'),
(71074055036, 'challenge', 'Prevent however picture like by almost understand read.', 'likely', 'measured', '{"color": "LightPink", "weight": 62.455183279944386}', '2024-03-24 13:17:13', '2024-01-27 19:45:32'),
(982902377216, 'picture', 'Answer watch bank effort no agency situation attention.', 'particular', 'fractional', '{"color": "FireBrick", "weight": 18.59540522631525}', '2024-01-16 22:38:15', '2024-03-31 03:50:42'),
(1132438820222, 'week', 'Think participant nature thing ago blood.', 'should', 'whole', '{"color": "OliveDrab", "weight": 90.08359648793449}', '2024-02-11 12:07:27', '2024-04-05 12:39:38'),
(8431585785020, 'suffer', 'Yes general page strong teacher.', 'middle', 'measured', '{"color": "SlateBlue", "weight": 11.573223341504173}', '2024-05-07 22:14:09', '2024-06-07 10:31:32'),
(4021415530018, 'save', 'Unit race collection.', 'financial', 'measured', '{"color": "LightCoral", "weight": 35.40648326972859}', '2024-04-19 19:08:54', '2024-01-15 02:07:24'),
(4420058723793, 'interesting', 'Every score so name.', 'air', 'fractional', '{"color": "Fuchsia", "weight": 2.7994575359353786}', '2024-02-24 04:49:38', '2024-06-03 23:56:51'),
(8950391767025, 'executive', 'Tell deep behind.', 'treat', 'whole', '{"color": "DarkOliveGreen", "weight": 29.509834515209672}', '2024-03-14 04:16:55', '2024-06-14 20:39:59'),
(5967342231613, 'democratic', 'Forget cell resource next from.', 'least', 'whole', '{"color": "Khaki", "weight": 28.81555734730785}', '2024-06-16 06:03:33', '2024-04-08 03:52:26'),
(7389288787845, 'change', 'Admit yourself plan nor summer position.', 'majority', 'fractional', '{"color": "SteelBlue", "weight": 67.5423785240456}', '2024-04-14 10:35:52', '2024-05-21 19:29:52'),
(5075900324292, 'reflect', 'Life thing evidence enjoy both.', 'others', 'whole', '{"color": "MediumBlue", "weight": 57.64889647952532}', '2024-02-15 11:25:23', '2024-05-30 02:41:43'),
(5672570746449, 'voice', 'Wife material read.', 'pull', 'fractional', '{"color": "RoyalBlue", "weight": 8.707094186703719}', '2024-06-09 00:03:32', '2024-01-16 13:43:02'),
(1720320738948, 'street', 'Teacher figure hear school page significant so hear.', 'answer', 'measured', '{"color": "Indigo", "weight": 36.56928544349964}', '2024-01-22 10:32:08', '2024-03-02 02:50:29'),
(1981654973027, 'key', 'Sense person understand.', 'risk', 'whole', '{"color": "Yellow", "weight": 11.158631861350424}', '2024-05-14 01:36:48', '2024-05-10 17:20:33'),
(2378725145428, 'bill', 'Enough learn recent change crime check.', 'himself', 'measured', '{"color": "BurlyWood", "weight": 72.97415521979981}', '2024-05-22 02:04:13', '2024-04-10 09:44:20'),
(4679414815140, 'charge', 'Sense adult itself read firm agreement.', 'economic', 'measured', '{"color": "Lavender", "weight": 45.05703690194499}', '2024-02-14 15:41:58', '2024-02-21 08:15:58'),
(6197301828588, 'fear', 'Space quickly meet thus day month simple sister.', 'culture', 'whole', '{"color": "Wheat", "weight": 14.897547501167606}', '2024-04-24 15:31:50', '2024-06-07 22:06:40'),
(1941230285500, 'manage', 'Leader government close inside.', 'walk', 'measured', '{"color": "SkyBlue", "weight": 49.06226884764088}', '2024-03-05 22:00:05', '2024-01-20 02:22:07');

-- Insert data into inventory table
INSERT INTO inventory (inventory_id, location_id, item_sku, quantity, created_at, updated_at) VALUES
(1, 4, 6620204926186, 8.55, '2024-02-04 21:12:15', '2024-01-27 06:52:32'),
(2, 6, 9804570082876, 37.82, '2024-02-18 06:41:54', '2024-03-24 04:16:05'),
(3, 13, 2419800137645, 24.13, '2024-04-15 08:17:10', '2024-06-08 20:06:30'),
(4, 5, 7389288787845, 15.72, '2024-05-18 00:22:24', '2024-02-02 20:46:13'),
(5, 13, 5967342231613, 67.46, '2024-01-21 00:54:16', '2024-06-09 21:26:24'),
(6, 6, 6782412987653, 82.12, '2024-05-27 19:51:26', '2024-01-28 13:05:46'),
(7, 9, 9804570082876, 91.0, '2024-05-02 07:19:49', '2024-04-29 22:23:06'),
(8, 13, 1981654973027, 53.47, '2024-06-09 19:13:35', '2024-01-13 22:35:38'),
(9, 8, 9904092791284, 5.84, '2024-02-10 00:02:16', '2024-02-03 14:22:27'),
(10, 3, 4255873067674, 58.44, '2024-06-15 07:24:00', '2024-03-31 00:41:49'),
(11, 8, 8658012079396, 29.22, '2024-02-27 13:16:05', '2024-02-11 08:30:00'),
(12, 11, 6197301828588, 95.91, '2024-05-10 06:48:29', '2024-03-05 10:45:16'),
(13, 15, 6782412987653, 25.83, '2024-02-05 14:26:36', '2024-02-28 21:37:06'),
(14, 10, 98779214988, 16.23, '2024-01-09 08:48:09', '2024-01-13 02:12:01'),
(15, 9, 4038403844286, 80.26, '2024-06-13 21:38:29', '2024-03-26 17:29:52'),
(16, 10, 9904092791284, 80.81, '2024-03-26 05:35:46', '2024-03-27 21:43:18'),
(17, 3, 7200976850767, 55.13, '2024-02-25 15:43:44', '2024-02-06 21:14:11'),
(18, 12, 6782412987653, 35.04, '2024-01-19 14:54:28', '2024-03-26 16:12:24'),
(19, 15, 8272422255043, 78.71, '2024-04-30 05:16:22', '2024-05-19 05:42:30'),
(20, 15, 4444039222143, 96.53, '2024-03-12 06:24:49', '2024-01-30 19:47:34'),
(21, 9, 1132438820222, 76.89, '2024-05-21 15:39:13', '2024-05-02 22:51:43'),
(22, 11, 7389288787845, 4.28, '2024-02-03 04:41:03', '2024-03-06 02:02:41'),
(23, 4, 6057784308338, 47.05, '2024-04-30 20:55:46', '2024-05-13 01:17:52'),
(24, 15, 8431585785020, 38.51, '2024-05-23 06:17:21', '2024-02-15 10:18:35'),
(25, 3, 982902377216, 57.26, '2024-05-17 11:50:42', '2024-05-03 12:53:17'),
(26, 6, 982902377216, 19.48, '2024-05-16 11:26:58', '2024-06-10 13:25:42'),
(27, 10, 8272422255043, 71.76, '2024-05-16 02:49:13', '2024-01-26 12:04:43'),
(28, 2, 4444039222143, 14.26, '2024-01-17 20:35:22', '2024-04-28 13:15:18'),
(29, 8, 8431585785020, 16.67, '2024-05-18 06:20:30', '2024-04-05 02:45:09'),
(30, 6, 8950391767025, 48.86, '2024-04-20 20:21:26', '2024-02-23 10:25:49'),
(31, 12, 9804570082876, 18.7, '2024-04-12 15:32:06', '2024-04-13 03:54:21'),
(32, 15, 5075900324292, 14.39, '2024-06-04 03:41:55', '2024-03-03 10:16:18'),
(33, 2, 6782412987653, 61.23, '2024-03-20 11:32:45', '2024-03-25 13:54:16'),
(34, 13, 9904092791284, 12.64, '2024-03-15 23:19:16', '2024-05-26 18:16:48'),
(35, 10, 5672570746449, 30.83, '2024-01-21 01:43:15', '2024-01-07 05:12:59'),
(36, 11, 5075900324292, 80.49, '2024-01-16 19:46:02', '2024-01-07 00:46:29'),
(37, 15, 98779214988, 30.7, '2024-01-17 08:56:16', '2024-02-04 15:11:58'),
(38, 8, 1132438820222, 78.26, '2024-03-31 14:45:18', '2024-04-22 23:15:37'),
(39, 1, 1319230535633, 64.11, '2024-04-23 22:47:16', '2024-01-09 11:33:48'),
(40, 5, 8658012079396, 3.79, '2024-04-23 10:01:34', '2024-06-08 08:24:21'),
(41, 1, 9605163951315, 54.08, '2024-01-25 23:19:40', '2024-05-20 02:58:21'),
(42, 5, 7389288787845, 44.06, '2024-01-18 02:01:58', '2024-04-16 07:17:27'),
(43, 12, 290984023885, 92.6, '2024-04-07 01:33:15', '2024-02-23 03:51:09'),
(44, 8, 6057784308338, 49.25, '2024-04-24 23:12:43', '2024-04-02 12:25:21'),
(45, 13, 1319230535633, 16.08, '2024-03-20 03:33:59', '2024-01-30 14:11:26'),
(46, 14, 1132438820222, 62.26, '2024-02-02 14:44:28', '2024-02-27 14:05:39'),
(47, 15, 1720320738948, 66.64, '2024-04-02 22:31:25', '2024-02-21 09:14:05'),
(48, 14, 5950084810482, 71.51, '2024-05-04 06:35:07', '2024-01-02 04:46:48'),
(49, 7, 9260927333211, 20.3, '2024-04-06 12:49:53', '2024-02-19 19:32:09'),
(50, 12, 1132438820222, 28.27, '2024-05-14 17:38:03', '2024-01-24 23:37:51'),
(51, 9, 6057784308338, 67.44, '2024-04-07 00:57:45', '2024-04-04 08:54:41'),
(52, 2, 7588673499176, 78.65, '2024-01-02 12:17:01', '2024-06-03 11:36:17'),
(53, 7, 9804570082876, 51.84, '2024-03-17 06:58:48', '2024-03-14 19:28:51'),
(54, 4, 4420058723793, 33.31, '2024-05-31 22:43:36', '2024-03-06 21:17:09'),
(55, 10, 71074055036, 40.41, '2024-02-26 01:16:54', '2024-05-07 02:45:00'),
(56, 3, 1132438820222, 8.44, '2024-05-14 04:52:03', '2024-05-18 03:41:24'),
(57, 15, 6057784308338, 84.58, '2024-03-26 14:24:02', '2024-04-19 16:19:55'),
(58, 14, 5967342231613, 34.59, '2024-05-31 21:42:29', '2024-04-12 17:19:01'),
(59, 14, 1504901534248, 32.36, '2024-02-04 23:59:14', '2024-06-14 13:06:53'),
(60, 1, 7028690810245, 55.31, '2024-06-10 10:35:40', '2024-03-19 07:05:28'),
(61, 7, 8272422255043, 89.26, '2024-02-01 05:48:21', '2024-01-03 14:27:48'),
(62, 15, 7052590299695, 78.74, '2024-02-08 05:14:47', '2024-02-05 20:20:33'),
(63, 13, 2815401310089, 83.88, '2024-01-19 13:42:14', '2024-04-24 17:09:14'),
(64, 3, 9260927333211, 1.63, '2024-01-19 01:53:16', '2024-05-06 18:02:17'),
(65, 5, 4679414815140, 15.1, '2024-04-24 03:06:57', '2024-04-15 00:01:07'),
(66, 14, 2419800137645, 22.2, '2024-06-05 19:04:42', '2024-05-05 16:19:53'),
(67, 7, 1720320738948, 86.55, '2024-06-12 04:06:24', '2024-05-02 03:51:15'),
(68, 8, 9260927333211, 17.92, '2024-01-30 09:13:32', '2024-04-26 00:22:46'),
(69, 8, 9044510988107, 76.93, '2024-05-13 09:48:38', '2024-03-15 03:17:26'),
(70, 10, 9605163951315, 77.46, '2024-04-17 04:09:26', '2024-03-27 17:46:18'),
(71, 11, 8658012079396, 86.29, '2024-06-09 01:25:28', '2024-02-04 06:30:44'),
(72, 7, 5788754254041, 40.21, '2024-03-19 21:34:20', '2024-02-04 00:23:18'),
(73, 1, 4255873067674, 66.5, '2024-01-09 19:04:12', '2024-03-06 06:14:42'),
(74, 3, 2237128745911, 7.98, '2024-04-05 18:40:22', '2024-04-07 04:28:41'),
(75, 11, 9044510988107, 80.92, '2024-01-30 04:19:44', '2024-03-26 03:59:54'),
(76, 7, 9220647914145, 28.23, '2024-05-11 21:18:49', '2024-05-28 08:24:04'),
(77, 15, 1132438820222, 56.28, '2024-03-03 01:46:35', '2024-04-14 23:28:23'),
(78, 11, 4679414815140, 55.22, '2024-01-28 16:21:57', '2024-03-25 08:09:56'),
(79, 10, 4420058723793, 2.12, '2024-03-15 07:12:55', '2024-05-26 11:23:35'),
(80, 7, 4038403844286, 93.34, '2024-04-12 11:20:14', '2024-02-26 12:28:28'),
(81, 6, 5950084810482, 63.45, '2024-03-11 13:55:04', '2024-06-04 05:22:49'),
(82, 7, 7389288787845, 62.52, '2024-03-17 16:42:47', '2024-02-10 13:22:45'),
(83, 14, 290984023885, 71.92, '2024-04-07 23:52:16', '2024-06-16 03:31:12'),
(84, 7, 290984023885, 89.17, '2024-02-18 00:35:18', '2024-04-30 17:39:56'),
(85, 1, 1981654973027, 66.6, '2024-05-15 09:56:04', '2024-03-14 00:10:08'),
(86, 9, 7389288787845, 86.46, '2024-01-08 14:41:54', '2024-02-16 18:49:59'),
(87, 6, 982902377216, 36.31, '2024-03-07 04:12:47', '2024-01-06 17:37:36'),
(88, 3, 7028690810245, 44.89, '2024-03-07 00:25:33', '2024-05-23 16:39:58'),
(89, 7, 8950391767025, 48.81, '2024-02-26 23:27:21', '2024-05-20 14:41:27'),
(90, 6, 8431585785020, 6.34, '2024-02-04 19:47:56', '2024-01-28 17:46:30'),
(91, 13, 8658012079396, 41.83, '2024-04-19 18:59:13', '2024-06-07 04:48:41'),
(92, 12, 4038403844286, 4.56, '2024-01-18 12:55:17', '2024-02-08 23:43:44'),
(93, 3, 4255873067674, 61.8, '2024-01-10 12:25:04', '2024-06-05 22:09:57'),
(94, 7, 5075900324292, 85.96, '2024-06-12 08:11:29', '2024-03-10 11:20:35'),
(95, 3, 5075900324292, 74.88, '2024-04-20 20:19:42', '2024-05-17 00:27:56'),
(96, 5, 6620204926186, 73.43, '2024-03-14 09:18:09', '2024-06-03 17:03:14'),
(97, 14, 6620204926186, 34.74, '2024-06-02 20:59:10', '2024-01-14 22:46:38'),
(98, 1, 1319230535633, 86.33, '2024-01-13 04:22:32', '2024-06-02 20:13:46'),
(99, 14, 2419800137645, 34.15, '2024-06-02 10:53:51', '2024-03-21 00:46:53'),
(100, 10, 8950391767025, 64.1, '2024-02-01 23:44:03', '2024-05-20 15:02:36');

