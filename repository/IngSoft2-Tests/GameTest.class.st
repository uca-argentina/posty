"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Test game behavior ""
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'players',
		'jack',
		'ben',
		'theGame',
		'louis',
		'threePlayers',
		'empty',
		'boxes',
		'aBoard',
		'threePlayerGame',
		'twoPlayerGame',
		'diceOne',
		'diceTwo',
		'card',
		'deckOfCards',
		'theBlanckCard',
		'theNoEffectCards'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
GameTest >> assertLastPosition: aPosition andLastLap: aLap for: aPlayer in: aGame [ 
	self assert: (aGame lastPositionOf: aPlayer) equals: aPosition.
	self assert: (aGame lastLapOf: aPlayer) equals: aLap.
]

{ #category : #asserting }
GameTest >> assertPosition: aPosition andLap: aLap for: aPlayer in: aGame. [
	self assert: (aGame positionOf: aPlayer) equals: aPosition.
	self assert: (aGame lapOf: aPlayer) equals: aLap
]

{ #category : #running }
GameTest >> setUp [
	super setUp.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	louis := Player called: 'Louis'.
	threePlayers := OrderedCollection with: jack with: ben with: louis.
	diceOne := SameFaceDice withFaces: 4.
	diceOne nextRollNumber: 4.
	diceTwo := SameFaceDice withFaces: 5.
	empty := EmptyEffect new.
	card := CardEffect new.
	boxes := OrderedCollection with: empty with: empty with: empty with: empty with:card with: empty.
	boxes add: empty.
	boxes add: empty.
	boxes add: empty.
	boxes add: empty.
	aBoard := Board with: boxes.
	theBlanckCard := CardWithNoEffect new.
	theNoEffectCards := OrderedCollection with: theBlanckCard.
	deckOfCards := DeckOfCards withEffects: theNoEffectCards .
	twoPlayerGame := Game withBoard: aBoard withLaps: 2  withPlayers:  players with: deckOfCards.
	threePlayerGame := Game withBoard: aBoard withLaps: 5  withPlayers:  threePlayers with: deckOfCards.
]

{ #category : #tests }
GameTest >> testAfterJackPlaysItsBenTurn [
	self assert: twoPlayerGame currentPlayer equals: jack.
	twoPlayerGame newTurnWithDice: diceOne.
	self assert: twoPlayerGame currentPlayer equals: ben.
]

{ #category : #tests }
GameTest >> testAtTheBeginingEachPlayerHasTwoCards [
	self assert: (twoPlayerGame amountOfCardsOf: jack) equals: 2.
	self assert: (twoPlayerGame amountOfCardsOf: ben) equals: 2.
]

{ #category : #tests }
GameTest >> testGameIsOver [
	diceOne nextRollNumber: 9.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 8.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceOne.
	self assert: twoPlayerGame isOver.
]

{ #category : #tests }
GameTest >> testJackAndBenArePlayersOfTheGame [
	self assert:  (twoPlayerGame isAPlayer: jack).
	self assert:  (twoPlayerGame isAPlayer: ben).
]

{ #category : #tests }
GameTest >> testJackPlaysAndChangePosition [
	self assertPosition: 0 andLap: 0  for: jack  in: twoPlayerGame. 
	diceOne nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 4 andLap: 0  for: jack  in: twoPlayerGame. 
]

{ #category : #tests }
GameTest >> testLastPositionOfJack [
	diceOne nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 8 andLap: 0  for: jack in: twoPlayerGame.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertLastPosition: 8 andLastLap: 0 for: jack in: twoPlayerGame.
]

{ #category : #tests }
GameTest >> testNoOneCanPlayAfterGameIsOver [
	diceOne nextRollNumber: 9.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 8.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceOne.
	self should: [ theGame newTurnWithDice: diceOne ] raise: Error.
]

{ #category : #tests }
GameTest >> testPlayerCompletesALap [
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 6.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 1 andLap: 1  for: jack  in: twoPlayerGame. 
]

{ #category : #tests }
GameTest >> testPlayerPlaysPositionChange [
	self assertPosition: 0 andLap: 0  for: jack  in: twoPlayerGame. 
	self assertPosition: 0 andLap: 0  for: ben  in: twoPlayerGame . 
	diceOne nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceOne. 
	diceOne nextRollNumber: 6.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 4 andLap: 0  for: jack  in: twoPlayerGame. 
	self assertPosition: 6 andLap: 0  for: ben  in: twoPlayerGame . 
]

{ #category : #tests }
GameTest >> testPlayerPlaysWithDifferentDices [
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceTwo nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceTwo.
	diceTwo nextRollNumber: 6.
	twoPlayerGame newTurnWithDice: diceTwo.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 1 andLap: 1 for: jack in: twoPlayerGame.
	self assertPosition: 9 andLap: 0 for: ben in: twoPlayerGame.
]

{ #category : #tests }
GameTest >> testPlayerUsesACardAndHaveOneLess [
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	self assert: (twoPlayerGame amountOfCardsOf: jack) equals: 3.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame thePlayer: jack usesTheCard: theBlanckCard.
	self assert: (twoPlayerGame amountOfCardsOf: jack) equals: 2.
	
	
]

{ #category : #tests }
GameTest >> testStepsOfAGame [
	self assert: twoPlayerGame steps equals: 10. 
]

{ #category : #tests }
GameTest >> testTheRankingOfTheGame [
	diceOne nextRollNumber: 5.
	threePlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 6.
	threePlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 4.
	threePlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 4.
	threePlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 5.
	threePlayerGame newTurnWithDice: diceOne.
	self assert: (threePlayerGame rankingPositionOf: jack) equals: 2.
	self assert: (threePlayerGame rankingPositionOf: ben) equals: 1.
	self assert: (threePlayerGame rankingPositionOf: louis) equals: 3.
]

{ #category : #tests }
GameTest >> testTheWinnerOfTheGame [
	diceOne nextRollNumber: 9.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 8.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	diceOne nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceOne.
	self assert: twoPlayerGame winner equals: jack.
]
