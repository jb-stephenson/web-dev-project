-- DROP SCHEMA WebProject;
CREATE SCHEMA WebProject;

-- ’
USE WebProject;

-- Create the users table
CREATE TABLE users (
	id int NOT NULL,
    name varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    type varchar(1) NOT NULL,
    PRIMARY KEY(id)
);

-- Initialize the users table
INSERT INTO users (
	id,
    name,
    password,
    type
)
VALUES
(1, 'john', '12345', 'A'),
(2, 'emily', '45678', 'A'),
(3, 'bob', '15973', 'U'),
(4, 'jane', '85204', 'U'),
(5, 'mike', '20486', 'U');

-- Create the hotels table
CREATE TABLE hotels (
	id int NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(1000) NOT NULL,
    bedsOneAvailable int NOT NULL,
    bedsOneTotal int NOT NULL,
    bedsTwoAvailable int NOT NULL,
    bedsTwoTotal int NOT NULL,
    bedsThreeAvailable int NOT NULL,
    bedsThreeTotal int NOT NULL,
    bedsFourAvailable int NOT NULL,
    bedsFourTotal int NOT NULL,
    PRIMARY KEY (id)
);

-- Initialize the hotels table
INSERT INTO hotels (
	id,
    name,
    description,
    bedsOneAvailable,
    bedsOneTotal,
    bedsTwoAvailable,
    bedsTwoTotal,
    bedsThreeAvailable,
    bedsThreeTotal,
    bedsFourAvailable,
    bedsFourTotal
)
VALUES
(
	1,
	'Celadon',
    'The Celadon Hotel is a luxurious hotel building located in the southeastern part of the city. The hotel is located near the famous Celadon Department Store, the Kanto region’s largest department store. Another icon is the Celadon Game Corner, a hub for those willing to risk it all on black (or red, we don’t discriminate). For those looking for a more physical thrill, guests and travel past the city’s fountain and reach Route 16, which connects to Kanto’s Cycling Road. Also known as Route 17, the Cycling Road connects Celadon and Fuschia City and spans a great distance. Guests can also visit the city’s gym, led by Erika, a master of Grass-type pokemon. Ms. Erika’s also runs a delightful perfume shop where she manufactures all her perfume in-house. The shop is directly connected to her gym. The Celadon Hotel is very often booked full, so please make reservations as far ahead of time as possible.',
    8,
	8,
    15,
    15,
    10,
    10,
    5,
    5
);

-- Create the reservations table
CREATE TABLE reservations (
	userID int NOT NULL,
    hotelID int NOT NULL,
    numBeds int NOT NULL,
    startDate varchar(8) NOT NULL,
    endDate varchar(8) NOT NULL,
    removalDate varchar(8) NOT NULL,
    PRIMARY KEY(userID, hotelID),
    FOREIGN KEY (userID) REFERENCES users(id),
    FOREIGN KEY (hotelID) REFERENCES hotels(id)
);

-- Create the landmarks table
CREATE TABLE landmarks (
	id int NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(575) NOT NULL,
    PRIMARY KEY(id)
);

-- Initialize the landmarks table
INSERT INTO landmarks (
	id,
    name,
    description
)
VALUES
(7, 'Celadon Department Store', ''),
(11, 'Fuschia City', ''),
(10, 'Cycling Road', ''),
(16,'Underground Path', ''),
(17, 'Saffron City', '');

-- Create the nearbyLandmarks table
CREATE TABLE nearbyLandmarks (
	hotelID int NOT NULL,
    landmarkID int NOT NULL,
    FOREIGN KEY (hotelID) REFERENCES hotels(id),
    FOREIGN KEY (landmarkID) REFERENCES landmarks(id)
);

-- Initialize the nearbyLandmarks table
INSERT INTO nearbyLandmarks (
	hotelID,
    landmarkID
)
VALUES
(1, 7),
(1, 10),
(1, 11),
(1, 16),
(1, 17);

-- Create the pokemon table 
CREATE TABLE pokemon (
	PokedexNum int NOT NULL,
    Description varchar(575)  NOT NULL,
    Name varchar(255)  NOT NULL,
    Type1 varchar(255)  NOT NULL,
    Type2 varchar(255)  NOT NULL,
    PreviousForm varchar(15)  NOT NULL,
    NextForm varchar(15)  NOT NULL,
    Health int  NOT NULL,
    Attack int  NOT NULL,
    Defense int  NOT NULL,
    SpecialAttack int  NOT NULL,
    SpecialDefense int  NOT NULL,
    Speed int  NOT NULL,
    HealthColor varchar(7)  NOT NULL,
    AttackColor varchar(7)  NOT NULL,
    DefenseColor varchar(7)  NOT NULL,
    SpecialAttackColor varchar(7)  NOT NULL,
    SpecialDefenseColor varchar(7)  NOT NULL,
    SpeedColor varchar(7)  NOT NULL,
    nearbyHotelID int NOT NULL,
    FOREIGN KEY (nearbyHotelID) REFERENCES hotels(id),
    PRIMARY KEY(PokedexNum)
);

-- Initialize the pokemon table
INSERT INTO pokemon (
	PokedexNum,
    Name,
    Description,
    Type1,
    Type2,
    Health,
    Attack,
    Defense,
    SpecialAttack,
    SpecialDefense,
    Speed,
    PreviousForm,
    NextForm,
    HealthColor,
    AttackColor,
    DefenseColor,
    SpecialAttackColor,
    SpecialDefenseColor,
    SpeedColor,
    nearbyHotelID
)
VALUES
	(
		1,
        'Bulbasaur',
        'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger. A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokemon. It can go for days without eating a single morsel. In the bulb on its back, it stores energy. While it is young, it uses the nutrients that are stored in the seeds on its back in order to grow.',
        'grass',
        'poison',
        45,
        49,
        49,
        65,
        65,
        45,	
        'n/a',
        'Ivysaur',
        '#D4A411',
        '#D4B111',
        '#D4B111',
        '#C4D411',
        '#C4D411',
        '#D4A411',
        1
    ),
    (
		2,
        'Ivysaur',
        'There is a bud on this Pokémon’s back. To support its weight, Ivysaur’s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it’s a sign that the bud will bloom into a large flower soon.The bulb on its back grows by drawing energy. It gives off an aroma when it is ready to bloom. When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs. Exposure to sunlight adds to its strength. Sunlight also makes the bud on its back grow larger.',
        'grass',
        'poison',
        60,
        62,
        63,
        80,
        80,
        60,
        'Bulbasaur',
        'Venusaur',
        '#D4D411',
        '#CED411',
        '#CBD411',
        '#93D411',
        '#93D411',
        '#D4D411',
        1
    ),
    (
		3,
        'Venusaur',
        'There is a large flower on Venusaur’s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower’s aroma soothes the emotions of people. The plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight. The flower on its back catches the sun’s rays. The sunlight is then absorbed and used for energy. By spreading the broad petals of its flower and catching the sun’s rays, it fills its body with power After a rainy day, the flower on its back smells stronger. The scent attracts other Pokémon.',
        'grass',
        'poison',
        80,
        82,
        83,
        100,
        100,
        80,	
        'Ivysaur',
        'n/a',
        '#93D411',
        '#8DD411',
        '#8AD411',
        '#52D411',
        '#52D411',
        '#93D411',
        1
    ),
    (
		4,
        'Charmander',
        'From the time it is born, a flame burns at the tip of its tail. Its life would end if the flame were to go out. The flame at the tip of its tail makes a sound as it burns. The flame on its tail shows the strength of its life force. If it is weak, the flame also burns weakly. If it is healthy, its tail burns brightly. If Charmander becomes enraged, the flame burns fiercely. You can only hear it in quiet places. It has a preference for hot places. When it rains, steam is said to spout from the tip of its tail.',
        'fire',
        'n/a',
        39,
        52,
        43,
        60,
        50,
        65,
        'n/a',
        'Charmeleon',
        '#D49011',
        '#D4BA11',
        '#D49D11',
        '#D4D411',
        '#D4B411',
        '#C4D411',
        1
    ),
    (
		5,
        'Charmeleon',
        'Charmeleon’s barbaric nature causes it to mercilessly destroys its foes with claws and tail. If it encounters a strong foe, it turns aggresive. Tough fights also tend to excite and agitate Charmeleon. When excited, it may blow out bluish-white flames. When it swings its burning tail, it elevates the temperature to unbearably high levels. It tears up foes with sharp claws after knocking them down with its tail. In the rocky mountains where Charmeleon live, their fiery tails shine at night like stars.',
        'fire',
        'n/a',
        58,
        64,
        58,
        80,
        65,
        80,
        'Charmander',
        'Charizard',
        '#D4CE11',
        '#C7D411',
        '#D4CE11',
        '#93D411',
        '#C4D411',
        '#93D411',
        1
    ),
    (
		6,
        'Charizard',
        'Its fiery breath reaches incredible temperatures. It can quickly melt glaciers weighing 10,000 tons. If Charizard becomes furious, the flame at the tip of its tail flares up in a whitish-blue color. It uses its wings to fly high. The temperature of its fire increases as it gains experience in battle. Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself. Its wings can carry this Pokémon close to an altitude of 4,600 feet.',
        'fire',
        'flying',
        78,
        84,
        78,
        109,
        85,
        100,
        'Charmeleon',
        'n/a',
        '#9ad411',
        '#86d411',
        '#9ad411',
        '#35d411',
        '#83d411',
        '#52d411',
        1
    ),
    (
		7,
        'Squirtle',
        'After birth, its back swells and hardens into a shell. It can powerfully spray foam from its mouth. Squirtle can shoot water at its prey while in the water. When to senses danger, it withdraws into its shell and sprays powerful foam and water from its mouth. The shell is quite resilient. If you poke it, you will bounce back. The shell isn’t just for protection. The shell’s rounded shape and grooves on its surface help minimze resistance in water, enabling Squirtle to swim at high speeds.',
        'water',
        'n/a',
        44,
        48,
        65,
        50,
        64,
        43,
        'n/a',
        'Wartortle',
        '#D4A011',
        '#D4AD11',
        '#C4D411',
        '#D4B411',
        '#C7D411',
        '#D49D11',
        1
	),
    (
		8,
        'Wartortle',
        'Wartortle is said to live 10,000 years. Its long, furry tail is a symbol of longevity, making it quite popular among older people. Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as it ages. The scratches on its shell are evidence of this Pokemon’s toughness as a battler. Wartortle often hides in water to stalk unwary prey. For swimming fast, it moves its ears and furry tail to maintain balance. When tapped, Wartortle will pull in its head, but the tail will still stick out for a little bit.',
        'water',
        'n/a',
        59,
        63,
        80,
        65,
        80,
        58,	
        'Squirtle',
        'Blastoise',
        '#D4D111',
        '#CBD411',
        '#93D411',
        '#C4D411',
        '#93D411',
        '#D4CE11',
        1
    ),
    (
		9,
        'Blastoise',
        'Blastoise is a brutal Pokemon with pressurized water jets on its shell. The jets are used for high speed tackles. Once it takes aim at its enemy, it blasts out water with even more force than a fire hose. Blastoise deliberately makes itself heavier to withstand the recoil of firing its water jets. The water jets are so accurate that they can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet. The jets of water are capable of punching through thick steel. In a pinch, it will withdraw insie its shell.',
        'water',
        'n/a',
        79,
        83,
        100,
        85,
        105,
        78,
        'Wartortle',
        'n/a',
        '#D4CE11',
        '#8AD411',
        '#52D411',
        '#83D411',
        '#42D411',
        '#9AD411',
        1
    ),
    (
		25,
        'Pikachu',
        'Pikachu keeps its tail raised to monitor its surroundings. If you yank its tail, it will try to bite you. It also has electricity-storing pouches on its cheeks. These appear to become electrically charged during the night while Pikachu sleeps. Whenever Pikachu comes across something new, it blasts it with a jolt of electricty. It’s intelligent enough to roast hard berries with its electricity to make them tender enough to eat. When several Pikachu gather, their electricty could build and cause lightning storms.',
        'electric',
        'n/a',
        35,
        55,
        40,
        50,
        50,
        90,
        'n/a',
        'Raichu',
        '#D48311',
        '#D4C411',
        '#D49311',
        '#D4B411',
        '#D4B411',
        '#73D411',
        1
    ),
    (
		26,
        'Raichu',
        'Raichu can loose 100,000-volt bursts of electricity. Careless contact can cause even an Indian elephant to faint. When electricity builds up inside its body, Raichu becomes feisty and more aggressive than usual. Both its ears will stand up straight if it becomes fully charged. If the electrical sacks become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near its nest. It also uses its long tail as a ground to protect itself from its high power voltage. Raichu also glows in the dark.',
        'electric',
        'n/a',
        60,
        90,
        55,
        90,
        80,
        110,
        'Pikachu',
        'n/a',
        '#D4D411',
        '#73D411',
        '#D4C411',
        '#73D411',
        '#93D411',
        '#32D411',
        1
    );