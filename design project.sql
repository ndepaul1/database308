--Nick DePaul--
--Design Project--
--12/04/2017--

DROP VIEW IF EXISTS CurrentPlayers;
DROP VIEW IF EXISTS LeaderClass;

DROP TABLE IF EXISTS Card;
DROP TABLE IF EXISTS Minion;
DROP TABLE IF EXISTS Special;
DROP TABLE IF EXISTS Deck;
DROP TABLE IF EXISTS Faction;
DROP TABLE IF EXISTS Collection;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Leader;
DROP TABLE IF EXISTS CreditCard;
DROP TABLE IF EXISTS PlayerQuests;
DROP TABLE IF EXISTS Quest;

--Card--
CREATE TABLE Card (
	cardID			CHAR(20),
	cardName		CHAR(100),
    illustratedBy	CHAR(50),
    cardEffect		CHAR(300),
    flavorText		CHAR(300),
    factionID		CHAR(20),
    isBronzeCard	CHAR(3),
    isSilverCard	CHAR(3),
    isGoldCard		CHAR(3),
    scrapValue		INTEGER,
    millValue		INTEGER,
    PRIMARY KEY(cardID)
);

--Minion--
CREATE TABLE Minion (
	minionID	CHAR(20),
    health		INTEGER,
    PRIMARY KEY(minionID)
);

--Special--
CREATE TABLE Special (
	specialID	CHAR(20),
    PRIMARY KEY(specialID)
);

--Deck--
CREATE TABLE Deck (
	deckID			CHAR(20),
    deckName		CHAR(20),
    factionID		CHAR(20),
    playerID		CHAR(20),
    leaderID		CHAR(20),
    cardID			CHAR(20),
    collectionID	CHAR(20),
    PRIMARY KEY(deckID)
);

--Faction--
CREATE TABLE Faction (
	factionID		CHAR(20),
    factionName		CHAR(20),
    PRIMARY KEY(factionID)
);

--Collection--
CREATE TABLE Collection (
	collectionID	CHAR(20),
    playerID		CHAR(20),
    cardID			CHAR(20),
    PRIMARY KEY(collectionID)
);

--Player--
CREATE TABLE Player (
	playerID			CHAR(20),
    playerFirstName		CHAR(20),
    playerLastName		CHAR(20),
    playerDisplayName	CHAR(20),
    roundsWonToday		INTEGER,
    scrapTotal			INTEGER,
    PRIMARY KEY(playerID)
);

--Leader--
CREATE TABLE Leader (
	leaderID				CHAR(20),
    leaderClass				CHAR(20),
    leaderName				CHAR(20),
    leaderAbility			CHAR(200),
    thanksEmote				CHAR(20),
    wellPlayedEmote			CHAR(20),
    badMoveEmote			CHAR(20),
    watchThisEmote			CHAR(20),
    dammitEmote				CHAR(20),
    youAreGoingDownEmote	CHAR(20),
    PRIMARY KEY(leaderID)
);

--Credit Card--
CREATE TABLE CreditCard (
	creditCardID		CHAR(10),
    playerID			CHAR(20),
    creditCardNumber	CHAR(16),
    CSV					CHAR(3),
    expDate				DATE,
    PRIMARY KEY(creditCardID)
);

--Player Quests--
CREATE TABLE PlayerQuests (
	playerQuestsID	CHAR(20),
    playerID		CHAR(20),
    questID			CHAR(20),
    PRIMARY KEY(playerQuestsID)
);

--Quest--
CREATE TABLE Quest (
	questID		CHAR(20),
    text		CHAR(20),
    reward		CHAR(20),
   PRIMARY KEY(questID)
);

--Filling the tables with information--

--Player--
INSERT INTO Player(playerID, playerFirstName, playerLastName, playerDisplayName, roundsWonToday, scrapTotal)
	VALUES('1', 'Nick', 'DePaul', 'GwentMaster', '20', '1024');
INSERT INTO Player(playerID, playerFirstName, playerLastName, playerDisplayName, roundsWonToday, scrapTotal)
    VALUES('2', 'Chris', 'Algozzine', 'ISIsTheBest', '35', '12943');

--Faction--
INSERT INTO Faction(factionID, factionName)
	VALUES('1', 'Monster');
INSERT INTO Faction(factionID, factionName)
	VALUES('2', 'Skellige');

--Leader--
INSERT INTO Leader(leaderID, leaderClass,leaderName, leaderAbility, thanksEmote, wellPlayedEmote, badMoveEmote, watchThisEmote, dammitEmote, youAreGoingDownEmote)
	VALUES('1','Monster', 'Eredin', 'Doomed: Spawn a Bronze Wild Hunt Unit.', 'Thanks', 'Well Played', 'Bad Move', 'Watch This', 'Dammit', 'You Are Going Down');
INSERT INTO Leader(leaderID, leaderClass,leaderName, leaderAbility, thanksEmote, wellPlayedEmote, badMoveEmote, watchThisEmote, dammitEmote, youAreGoingDownEmote)
	VALUES('2', 'Skellige', 'King Bran', 'Deploy: Discard up to 3 cards from your Deck and Stregthen all Units among them by 1. Then shuffle your Deck.', 'Thanks', 
           'Well Played', 'Bad Move', 'Watch This', 'Dammit','You Are Going Down');

--Card--

--Monster Cards--
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('1', 'Nekker', 'Katarzyna Redesiuk', 'Whenever an Ally Consumes a card, Boost this Unit by 1 while in your Hand, Deck or on your side of the Board.',
            'These little guys are almost cute, if you ignore the whole vicious killer aspect.', '1', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('2', 'Wild Hunt Navigator', 'Diego De Almeida', 'Deploy: Choose a different Bronze Wild Hunt Ally. Play a copy of it from your Deck.',
            'For hundreds of years, Avallach tried to recreate the Elder Blood gene though back breeding - yet the elven children thus fostered were
             but dim sparks compared to Laras flame.', '1', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('3', 'Foglet', 'Bartlomiej Gawel', 'Whenever you apply a Fog Hazard, play 1 copy of this Unit from your Deck on the opposite row. If there
             are none, Resurrect 1 copy instead. Destroy when all Fog Hazards are cleared from the Board', 'Fog creeps on little cat feet. Foglets
             creep over the bodies of their victims.', '1', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('4', 'Ghoul', 'Adrian Smith', 'Deploy: Consume a Bronze or Silver Unit from your Graveyard.', 'If ghouls are part of the Circle of
             Life... then its one vicious circle.', '1', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('5', 'Wild Hunt Hound', 'Marek Madej', 'Deploy: Play a Biting Frost card from your Deck.', 'Cry Havoc!, and let slip the dogs of war.',
            '1', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('6', 'Ice Giant', 'Bartlomiej Gawel', 'If a Frost Hazard is anywhere on the Board, Boost self by 6.', 'Fled one time in my life. From the 
             Ice Giant. And Im not a bit ashamed.', '1', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('7', 'Wyvern', 'Alejandro Mirabal', 'Deploy: Damage an Enemy by 3. If you have any Draconids in your Hand, Stregthen self by 2.',
            'Imagine a cross between a winged snake and a nightmare. Wyverns are worse.', '1', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('8', 'Wild Hunt Warrior', 'Marta Dettlaff', 'Deploy: Damage an Enemy by 3. If it was under a Frost Hazard or Destroyed, Boost self by 2.',
            'The White Frost is coming', '1', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('9', 'Ekimmara', 'Bartlomiej Gawel', 'Deploy: Gain Resilience and Consume an Ally', 'Who would think that overgrown bats would have a
             taste for gaudy jewelry?', '1', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('10', 'Drowner', 'Adrian Smith', 'Deploy: Move a Unit to this row on its side. If its an Enemy, Damage it by 2. If the Enemy is under any 
             Hazard after being moved, Damage it by 4 instead.', 'Though the witchman lusts for gold, for the smiting of a drowner thou shalt give him
             but a silver penny, or three halfpence, at most.', '1', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('11', 'Wild Hunt Longship', 'Marek Madej', 'While on the Board, Boost all other Wild Hunt Allies by 1. When Destroyed or Locked,
             Damage all other Wild Hunt Allies by 1.', 'Waves pummel the shore, waves pushed by the prow of the spectral Naglfar. Hemdalls
             horn rings in the air, and Hemdall stands facing his enemies atop Bifrost, the burning rainbow.', '1', 'Yes', null, null,
             80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('12', 'Archgriffin', 'Anna Podedworna', 'Deploy: Clear Hazards from the row on your side. Move a Bronze card from one Graveyard to the other.',
            'It is a griffin, just more... griffiny.', '1', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('13', 'Wild Hunt Rider', 'Marek Madej', 'Increase by 1 the Damage dealt by Frost Hazards on the opposite row.', 'First the buffalo horns
             atop their helms penetrate ones view, then the crest betwixt them, and finally the skull-like face exposed beneath their visors.',
            '1', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('14', 'Crone: Whispess', 'Bartlomiej Gawel', 'Deploy: Play all other Crones from your Deck.', 'I would be your best - and last.',
            '1', null, 'Yes', null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('15', 'Crone: Weavess', 'Bartlomiej Gawel', 'Deploy: Play all other Crones from your Deck.', 'I sense your pain. I see your fear.',
            '1', null, 'Yes', null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('16', 'Crone: Brewess', 'Bartlomiej Gawel', 'Deploy: Play all other Crones from your Deck.', 'We will cut you up boy. A fine broth
             you will make.', '1', null, 'Yes', null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('17', 'Imlerith', 'Marek Madej', 'Deploy: Damage an Enemy by 4. If the Enemy is under a Frost Hazard, Damage it by 8 instead.', 
            'Ladd nahw! Kill them! Litter the earth with their entrails!', '1', null, null, 'Yes', 800, 200);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('18', 'Caranthir', 'Marek Madej', 'Deploy: Move an Enemy to this row on its side and apply a Frost Hazard to that row.', 'A favorite son
             who chose a life of villainy.', '1', null, null, 'Yes', 800, 200);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('19', 'Draug', 'Nemanja Stankkovic', 'Deploy: Spawn a Draugir on a random row on the side of each player with at least one Bronze or 
             Silver Card in their Graveyard.', 'Some men cannot admit defeat. Some keep fighting from beyond the grave.', '1', null, null, 'Yes',
             800, 200);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('20', 'Caretaker', 'Marek Madej', 'Deploy: Resurrect a Bronze or Silver Unit from your opponents Graveyard.', 'There are more things in 
             heaven and earth than all the worlds philosophers have dreamt.', '1', null, null, 'Yes', 800, 200);

--Skellige Cards--
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('21', 'Alan Labouseur', 'Nick DePaul', 'Deploy: Gains 2 query Allies on the same row.', 'It only has to be perfect.', '2',
             null, null, 'Yes', 800, 200);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('22', 'Herbalist', 'Lorenzo Mastroianni', 'Deploy: Play a random Bronze Organic or Hazard card from your deck.', 'We do not burn 
             cunning women in Skellige - we take their advice.', '2', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('23', 'Heymaey Battle Maiden', 'Grafit Studio', 'Deploy: Choose a Machine or Soldier Ally and play a copy of it from your Deck.
             Then Damage the chosen Ally by 1.', 'Skellige women are wild and unpredictable. All units are to treat them as serious threats and 
             never underestimate their capabilities.', '2', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('24', 'Clan Drummond Shieldmaiden', 'Grafit Studio', 'Deploy: Damage a Unit by 2. If it was already Damaged, play a copy of this Unit
             from your Deck.', 'They will shatter on our shields like waves on a craggy shore.', '2', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('25', 'Clan Dimun Pirate Captain', 'Grafit Studio', 'Every turn, at the end of your turn, if this Unit is in your Hand or Deck,
             Reset it and Boost it by the base Power of the Highest Bronze Unit discarded to your Graveyard during your turn.', 'Haul together,
             hoist the colors high!', '2', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('26', 'Clan An Craite Raider', 'Grafit Studio', 'Whenever this Unit is Discarded, Resurrect it immediately.', 'We are An Craite!
             What others buy with gold, we buy with our lifeblood.', '2', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('27', 'Clan Heymaey Skald', 'Grafit Studio', 'Deploy: Boost 3 Allies by 2.', 'The deeds of Clan Heymaey will go down in history.',
            '2', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('28', 'Clan Tuirseach Axeman', 'Marek Madej', 'Whenever an Enemy on the opposite row is Damaged, Boost self by 1.', 'Swords are for wenches.
             Get yourself an axe.', '2', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('29', 'Clan An Craite Warcrier', 'Nemanja Stankovic', 'Deploy: Boost 2 Damaged Allies by half their Power (rounding down).', 'Every man,
             woman and child in Skellige can split a foe with an axe. Only a select few can split enemy ears with a rage-filled cry.', '2', 'Yes',
             null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('30', 'Clan Tordarroch Shieldsmith', 'Grafit Studio', 'Deploy: Strengthen an Ally by 2 and give it 2 Armor.', 'Remember me words -
             a good shield can save yer life.', '2', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('31', 'Clan Tuirseach Skirmishers', 'Marek Madej', 'Whenever this Unit leaves the Graveyard, Strengthen it by 3.', 'Friends we show heart,
             foes we show our axe. Remember that.', '2', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('32', 'Clan An Craite Greatsword', 'Bartlomiej Gawel', 'Every 2 turns, if this Unit is Damaged at the start of your turn, Rest it and
             Strengthen it by 2.', 'Ahh, ye gave me a good laugh there, Nordling! Why, this bastard, ye could not even grip it, let alone gut me with it.', 
            '2', 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('33', 'Clan Brokvar Archer', 'Grafit Studio', 'Deploy: Damage 3 Units by 1.', 'So ye can hit a movin target at two hundred paces? Me,
             too. In a storm.', '2', 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('34', 'Skjall', 'Bruno Biazotto', 'Deploy: Play a random Bronze or Silver Cursed Unit from your Deck.', 'Strike his name from the saga
             of Elders! No one dare grant him shelter or sustenance!', '2', null, 'Yes', null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('35', 'Morkvarg', 'Marek Madej', 'Whenever this Unit is Discarded or Destroyed, Resurrect it and Weaken it by half its Power (rounding up)',
            'The vilest man Skelliges ever known.', '2', null, 'Yes', null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('36', 'Jutta An Dimun', 'Nemanja Stankovic', 'Deploy: Damage self by 1.', 'Some call her the Iron Maiden', '2', null, 'Yes', null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('37', 'Udalryk', 'Grafit Studio', 'Deploy: Look at the top 2 cards from your Deck. Draw one and Discard the other.', 'The gods have spoken:
             a sacrifice is required.', '2', null, 'Yes', null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('38', 'Birna Bran', 'Grafit Studio', 'Deploy: Apply a Skellige Storm Hazard to the opposite row.', 'Skellige must have a strong king. No 
             matter what it takes.', '2', null, null, 'Yes', 800, 200);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('39', 'Ermion', 'Grafit Studio', 'Deploy: Draw the top 2 cards from your Deck, then Discard 2 cards from your Hand.', 'Only the 
             ignorant dismiss the importance of myths.', '2', null, null, 'Yes', 800, 200);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('40', 'Hjalmar', 'Grafit Studio', 'Deploy: Spawn the Lord of Undvik on the leftmost side of the opposite row.', 'Instead of mournin the fallen,
             lets drink to their memory!', '2', null, null, 'Yes', 800, 200);
             
--Special Cards--
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('41', 'Impenetrable Fog', 'Bartlomiej Gawel', 'Fog Hazard: Every turn, at the start of your turn, Damage the Highest Unit on the row
             by 2.', 'A good commanders dream... and a bad ones horror.', null, 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('42', 'Biting Frost', 'Bartlomiej Gawel', 'Frost Hazard: Every turn, at the start of your turn, Damage the Lowest Unit on the row by 2.',
            'Best thing about frost? Bodies of the fallen do not rot so quickly.', null, 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('43', 'Lacerate', 'Anna Podedworna', 'Damage all Units on a row by 3.', 'A sight more horrid you have never seen... The poor soul
             lay shredded as the beast lapped up its blood from the ground all around.', null, 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('44', 'Commanders Horn', 'Bartlomiej Gawel', 'Boost 5 adjacent Units 4.', 'Plus one to morale, minus one to hearing.', null, null, 'Yes',
             null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('45', 'White Frost', 'Anna Podedworna', 'Frost Hazard: Every turn, at the start of your turn, Damage the Lowest Unit on the row by 2.',
            'Behold Tedd Deireadh, the Final Age. The world was destroyed by the Whit Frost.', null, null, 'Yes', null, 200, 50);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('46', 'Mahakam Ale', 'Bogna Gawronska', 'Boost a random Ally on each row by 4.', 'Considered to be the dwarves greatest
             contribution to world culture.', null, 'Yes', null, null, 80, 20);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('47', 'First Light', 'Bartlomiej Gawel', 'Clear Skies or Rally', 'The sun is shinin, Dromle! The sun is shinin! Maybe there is hope
             after all...', null, 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('48', 'Swallow Potion', 'Aleksandra Wojtas', 'Boost a Unit by 8.', 'Symbolizing spring and rejuvenation, the swallow lent its name to this
             potion that accelerates the rate at which wounds scab over and heal.', null, 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('49', 'Thunderbolt Potion', 'Aleksandra Wojtas', 'Add 2 Armor to 3 adjacent Units and Boost them by 3.', 'The witchers face changed...
             his mien turning inhuman, horrifying.', null, 'Yes', null, null, 30, 10);
INSERT INTO Card(cardID, cardName, illustratedBy, cardEffect, flavorText, factionID, isBronzeCard, isSilverCard, isGoldCard, scrapValue, millValue)
	VALUES('50', 'Scorch', 'Marek Madej', 'Destroy all the Highest Units.', 'Geralt took one step back. He would seen men hit by Scorch before.
             Or more accurately, seen what remained of them afterwards.', null, null, 'Yes', null, 200, 50);
			
--Minion Table--
INSERT INTO Minion(minionID, health)
	VALUES(1, 3);
INSERT INTO Minion(minionID, health)
	VALUES(2, 3);
INSERT INTO Minion(minionID, health)
	VALUES(3, 4);
INSERT INTO Minion(minionID, health)
	VALUES(4, 4);
INSERT INTO Minion(minionID, health)
	VALUES(5, 4);
INSERT INTO Minion(minionID, health)
	VALUES(6, 6);
INSERT INTO Minion(minionID, health)
	VALUES(7, 6);
INSERT INTO Minion(minionID, health)
	VALUES(8, 6);
INSERT INTO Minion(minionID, health)
	VALUES(9, 6);
INSERT INTO Minion(minionID, health)
	VALUES(10, 7);
INSERT INTO Minion(minionID, health)
	VALUES(11, 7);
INSERT INTO Minion(minionID, health)
	VALUES(12, 8);
INSERT INTO Minion(minionID, health)
	VALUES(13, 9);
INSERT INTO Minion(minionID, health)
	VALUES(14, 6);
INSERT INTO Minion(minionID, health)
	VALUES(15, 6);
INSERT INTO Minion(minionID, health)
	VALUES(16, 8);
INSERT INTO Minion(minionID, health)
	VALUES(17, 9);
INSERT INTO Minion(minionID, health)
	VALUES(18, 8);
INSERT INTO Minion(minionID, health)
	VALUES(19, 8);
INSERT INTO Minion(minionID, health)
	VALUES(20, 4);
INSERT INTO Minion(minionID, health)
	VALUES(21, 8);
INSERT INTO Minion(minionID, health)
	VALUES(22, 2);
INSERT INTO Minion(minionID, health)
	VALUES(23, 2);
INSERT INTO Minion(minionID, health)
	VALUES(24, 3);
INSERT INTO Minion(minionID, health)
	VALUES(25, 4);
INSERT INTO Minion(minionID, health)
	VALUES(26, 4);
INSERT INTO Minion(minionID, health)
	VALUES(27, 5);
INSERT INTO Minion(minionID, health)
	VALUES(28, 5);
INSERT INTO Minion(minionID, health)
	VALUES(29, 6);
INSERT INTO Minion(minionID, health)
	VALUES(30, 7);
INSERT INTO Minion(minionID, health)
	VALUES(31, 7);
INSERT INTO Minion(minionID, health)
	VALUES(32, 7);
INSERT INTO Minion(minionID, health)
	VALUES(33, 8);
INSERT INTO Minion(minionID, health)
	VALUES(34, 5);
INSERT INTO Minion(minionID, health)
	VALUES(35, 9);
INSERT INTO Minion(minionID, health)
	VALUES(36, 12);
INSERT INTO Minion(minionID, health)
	VALUES(37, 12);
INSERT INTO Minion(minionID, health)
	VALUES(38, 3);
INSERT INTO Minion(minionID, health)
	VALUES(39, 7);
INSERT INTO Minion(minionID, health)
	VALUES(40, 14);

--Special--

INSERT INTO Special(specialID)
	VALUES(41);
INSERT INTO Special(specialID)
	VALUES(42);
INSERT INTO Special(specialID)
	VALUES(43);
INSERT INTO Special(specialID)
	VALUES(44);
INSERT INTO Special(specialID)
	VALUES(45);
INSERT INTO Special(specialID)
	VALUES(46);
INSERT INTO Special(specialID)
	VALUES(47);
INSERT INTO Special(specialID)
	VALUES(48);
INSERT INTO Special(specialID)
	VALUES(49);
INSERT INTO Special(specialID)
	VALUES(50);
	
--Collection--

--Player 1 Collection--

INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(1, 1, 1);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(2, 1, 2);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(3, 1, 3);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(4, 1, 4);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(5, 1, 5);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(6, 1, 6);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(7, 1, 7);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(8, 1, 8);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(9, 1, 9);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(10, 1, 10);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(11, 1, 11);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(12, 1, 12);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(13, 1, 13);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(14, 1, 14);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(15, 1, 15);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(16, 1, 16);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(17, 1, 17);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(18, 1, 18);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(19, 1, 19);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(20, 1, 20);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(21, 1, 41);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(22, 1, 42);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(23, 1, 44);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(24, 1, 45);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(25, 1, 50);
	
--Player 2 Collection--

INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(26, 2, 21);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(27, 2, 22);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(28, 2, 23);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(29, 2, 24);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(30, 2, 25);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(31, 2, 26);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(32, 2, 27);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(33, 2, 28);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(34, 2, 29);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(35, 2, 30);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(36, 2, 31);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(37, 2, 32);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(38, 2, 33);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(39, 2, 34);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(40, 2, 35);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(41, 2, 36);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(42, 2, 37);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(43, 2, 38);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(44, 2, 39);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(45, 2, 40);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(46, 2, 43);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(47, 2, 46);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(48, 2, 47);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(49, 2, 48);
INSERT INTO Collection(collectionID, playerID, cardID)
	VALUES(50, 2, 49);
	
--Deck--

--Player 1 Deck--

INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(1, 'Monster', 1, 1, 1, 1, 1);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(2, 'Monster', 1, 1, 1, 2, 2);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(3, 'Monster', 1, 1, 1, 3, 3);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(4, 'Monster', 1, 1, 1, 4, 4);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(5, 'Monster', 1, 1, 1, 5, 5);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(6, 'Monster', 1, 1, 1, 6, 6);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(7, 'Monster', 1, 1, 1, 7, 7);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(8, 'Monster', 1, 1, 1, 8, 8);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(9, 'Monster', 1, 1, 1, 9, 9);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(10, 'Monster', 1, 1, 1, 10, 10);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(11, 'Monster', 1, 1, 1, 11, 11);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(12, 'Monster', 1, 1, 1, 12, 12);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(13, 'Monster', 1, 1, 1, 13, 13);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(14, 'Monster', 1, 1, 1, 14, 14);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(15, 'Monster', 1, 1, 1, 15, 15);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(16, 'Monster', 1, 1, 1, 16, 16);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(17, 'Monster', 1, 1, 1, 17, 17);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(18, 'Monster', 1, 1, 1, 18, 18);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(19, 'Monster', 1, 1, 1, 19, 19);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(20, 'Monster', 1, 1, 1, 20, 20);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(21, 'Monster', 1, 1, 1, 41, 21);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(22, 'Monster', 1, 1, 1, 42, 22);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(23, 'Monster', 1, 1, 1, 44, 23);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(24, 'Monster', 1, 1, 1, 45, 24);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(25, 'Monster', 1, 1, 1, 50, 25);

--Player 2 Deck--

INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(26, 'Skellige', 2, 2, 2, 21, 26);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(27, 'Skellige', 2, 2, 2, 22, 27);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(28, 'Skellige', 2, 2, 2, 23, 28);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(29, 'Skellige', 2, 2, 2, 24, 29);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(30, 'Skellige', 2, 2, 2, 25, 30);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(31, 'Skellige', 2, 2, 2, 26, 31);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(32, 'Skellige', 2, 2, 2, 27, 32);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(33, 'Skellige', 2, 2, 2, 28, 33);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(34, 'Skellige', 2, 2, 2, 29, 34);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(35, 'Skellige', 2, 2, 2, 30, 35);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(36, 'Skellige', 2, 2, 2, 31, 36);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(37, 'Skellige', 2, 2, 2, 32, 37);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(38, 'Skellige', 2, 2, 2, 33, 38);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(39, 'Skellige', 2, 2, 2, 34, 39);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(40, 'Skellige', 2, 2, 2, 35, 40);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(41, 'Skellige', 2, 2, 2, 36, 41);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(42, 'Skellige', 2, 2, 2, 37, 42);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(43, 'Skellige', 2, 2, 2, 38, 43);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(44, 'Skellige', 2, 2, 2, 39, 44);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(45, 'Skellige', 2, 2, 2, 40, 45);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(46, 'Skellige', 2, 2, 2, 43, 46);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(47, 'Skellige', 2, 2, 2, 46, 47);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(48, 'Skellige', 2, 2, 2, 47, 48);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(49, 'Skellige', 2, 2, 2, 48, 49);
INSERT INTO Deck(deckID, deckName, factionID, playerID, leaderID, cardID, collectionID)
	VALUES(50, 'Skellige', 2, 2, 2, 49, 50);
	
--Quest--

INSERT INTO Quest(questID, text, reward)
	VALUES(1, 'Win 2 Rounds', '15 scrap');
INSERT INTO Quest(questID, text, reward)
	VALUES(2, 'Win 4 Rounds', '15 scrap');
	
--Player Quest--
INSERT INTO PlayerQuests(playerQuestsID, playerID, questID)
	VALUES(1, 1, 1);
INSERT INTO PlayerQuests(playerQuestsID, playerID, questID)
	VALUES(2, 1, 2);
INSERT INTO PlayerQuests(playerQuestsID, playerID, questID)
	VALUES(3, 2, 1);
INSERT INTO PlayerQuests(playerQuestsID, playerID, questID)
	VALUES(4, 2, 2);
	
--Credit Card--
INSERT INTO CreditCard(creditCardID, playerID, creditCardNumber, CSV, expDate)
	VALUES(1, 1, 8002747600128364, 300, '01/20/2018');
INSERT INTO CreditCard(creditCardID, playerID, creditCardNumber, CSV, expDate)
	VALUES(2, 2, 4772037771203486, 120, '12/15/2020');
	
--Join Card Table--
SELECT     Card.cardName, Faction.factionName, Minion.health
FROM       Card
RIGHT JOIN Faction ON Card.factionID = Faction.factionID
RIGHT JOIN Minion  ON Card.cardID    = Minion.minionID
ORDER BY   Faction.factionName;

--Join Deck--
SELECT     Deck.deckName, Faction.factionName, Player.playerLastName, Leader.leaderName, Card.cardName
FROM       Deck
RIGHT JOIN Faction ON Deck.factionID = Faction.factionID
RIGHT JOIN Player  ON Deck.playerID  = Player.playerID
RIGHT JOIN Leader  ON Deck.leaderID  = Leader.leaderID
RIGHT JOIN Card    ON Deck.cardID    = Card.cardID
ORDER BY   Deck.deckName;

--Join Collection--
SELECT     Player.playerLastName, Card.cardName
FROM       Collection
RIGHT JOIN Player ON Collection.playerID = Player.playerID
RIGHT JOIN Card   ON Collection.cardID   = Card.cardID
ORDER BY   Player.playerLastName;

--Join Credit Card--
SELECT     Player.playerLastName, CreditCard.creditCardNumber, CreditCard.CSV, CreditCard.expDate
FROM       CreditCard
RIGHT JOIN Player ON CreditCard.playerID = Player.playerID
ORDER BY   Player.playerLastName;

--Join Player Quests--
SELECT     Player.playerLastName, quest.text, quest.reward
FROM       PlayerQuests 
RIGHT JOIN Player ON PlayerQuests.playerID = Player.playerID
RIGHT JOIN Quest  ON PlayerQuests.questID  = Quest.questID
ORDER BY   Player.playerLastName;

--Security--
CREATE ROLE Player;
GRANT SELECT ON ALL Tables IN SCHEMA PUBLIC TO Player;

CREATE ROLE Admin WITH Login Password 'alpaca';
GRANT SELECT, INSERT, UPDATE ON ALL Tables IN SCHEMA PUBLIC TO Admin;

--View--

--Current Players View--
CREATE VIEW CurrentPlayers 
AS
SELECT playerDisplayName
FROM Player;
SELECT * 
FROM CurrentPlayers
ORDER BY playerDisplayName ASC;

--Leader Class View--
CREATE VIEW LeaderClass 
AS
SELECT leaderClass, leaderName, leaderAbility
FROM Leader;
SELECT * 
FROM LeaderClass
ORDER BY leaderClass ASC;


--Store Procedure--
CREATE OR REPLACE FUNCTION playerRoundsWon()
RETURNS TRIGGER AS $$
DECLARE
BEGIN
IF roundsWonToday > 0 THEN
SET roundsWonToday = 1;
END IF;
RETURN new;
END;
$$ language plpgsql;

--TRIGGER--
CREATE TRIGGER playerRoundsWon
BEFORE UPDATE
ON Player
FOR EACH ROW
EXECUTE PROCEDURE playerRoundsWon();