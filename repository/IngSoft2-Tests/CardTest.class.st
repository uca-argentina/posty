"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".
""Testing card behaviour""
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
	#name : #CardTest,
	#superclass : #TestCase,
	#instVars : [
		'players',
		'jack',
		'ben',
		'theGame',
		'empty',
		'boxes',
		'aBoard',
		'threePlayerGame',
		'diceOne',
		'diceTwo',
		'card'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
CardTest >> assertPosition: aPosition andLap: aLap for: aPlayer in: aGame. [
	self assert: (aGame positionOf: aPlayer) equals: aPosition.
	self assert: (aGame lapOf: aPlayer) equals: aLap
]

{ #category : #running }
CardTest >> setUp [
	super setUp.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
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
]

{ #category : #tests }
CardTest >> testADeckOfCardsHasSixTypesOfCards [
	| cardTypes overload speed acceleration cancellation redo repeat deckOfCards |
	overload := OverloadCard new.
	speed := SpeedCard new.
	acceleration := AccelerationCard new.
	cancellation := CancellationCard new.
	redo := RedoCard new.
	repeat := RepeatCard new.
	cardTypes := OrderedCollection with: overload with: speed with: acceleration with: cancellation with: redo with: repeat.
	deckOfCards := DeckOfCards withEffects: cardTypes .
	self assert: (deckOfCards isAValidEffect: overload).
	self assert: (deckOfCards isAValidEffect: speed).
	self assert: (deckOfCards isAValidEffect: acceleration).
	self assert: (deckOfCards isAValidEffect: cancellation).
	self assert: (deckOfCards isAValidEffect: redo).
	self assert: (deckOfCards isAValidEffect: repeat).	
]

{ #category : #tests }
CardTest >> testAcceleration [
	| cardTypes acceleration deckOfCards twoPlayerGame |
	acceleration := AccelerationCard new.
	cardTypes := OrderedCollection with: acceleration.
	deckOfCards := DeckOfCards withEffects: cardTypes .
	twoPlayerGame := Game withBoard: aBoard withLaps: 2  withPlayers: players with: deckOfCards.
	twoPlayerGame thePlayer: jack wantsToUseTheCard: acceleration.
	diceOne nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 5 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 5 andLap: 0  for: ben  in: twoPlayerGame . 
	diceOne nextRollNumber: 3.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 9 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 9 andLap: 0  for: ben  in: twoPlayerGame . 
]

{ #category : #tests }
CardTest >> testAnyRandomCardIPickIsOneOfTheTypesGiven [
	| cardTypes overload speed acceleration cancellation redo repeat deckOfCards aCard |
	overload := OverloadCard new.
	speed := SpeedCard new.
	acceleration := AccelerationCard new.
	cancellation := CancellationCard new.
	redo := RedoCard new.
	repeat := RepeatCard new.
	cardTypes := OrderedCollection with: overload with: speed with: acceleration with: cancellation with: redo with: repeat.
	deckOfCards := DeckOfCards withEffects: cardTypes .
	aCard := deckOfCards pickACard.
	self assert: (cardTypes anySatisfy: [ :anEffect | anEffect = aCard ] )
]

{ #category : #tests }
CardTest >> testCancellation [
	| cardTypes acceleration cancellation deckOfCards twoPlayerGame |
	acceleration := AccelerationCard new.
	cancellation := CancellationCard new.
	cardTypes := OrderedCollection with: acceleration.
	deckOfCards := DeckOfCards withEffects: cardTypes .
	twoPlayerGame := Game withBoard: aBoard withLaps: 2  withPlayers: players with: deckOfCards.
	twoPlayerGame thePlayer: jack willHaveTheCards: (OrderedCollection with: acceleration with: cancellation ).
	twoPlayerGame thePlayer: jack wantsToUseTheCard: acceleration.
	diceOne nextRollNumber: 4.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 5 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 5 andLap: 0  for: ben  in: twoPlayerGame . 
	twoPlayerGame thePlayer: jack wantsToUseTheCard: cancellation on: acceleration.
	diceOne nextRollNumber: 3.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 8 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 8 andLap: 0  for: ben  in: twoPlayerGame . 
	
]

{ #category : #tests }
CardTest >> testOverload [
	| cardTypes overload deckOfCards twoPlayerGame |
	overload := OverloadCard new.
	cardTypes := OrderedCollection with: overload.
	deckOfCards := DeckOfCards withEffects: cardTypes .
	twoPlayerGame := Game withBoard: aBoard withLaps: 2  withPlayers: players with: deckOfCards.
	twoPlayerGame thePlayer: jack wantsToUseTheCard: overload with: ben.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 5 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 3 andLap: 0  for: ben  in: twoPlayerGame . 
	diceOne nextRollNumber: 3.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 8 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 4 andLap: 0  for: ben  in: twoPlayerGame . 
]

{ #category : #tests }
CardTest >> testRedo [
	| cardTypes acceleration deckOfCards twoPlayerGame redo |
	acceleration := AccelerationCard new.
	redo := RedoCard new.
	cardTypes := OrderedCollection with: acceleration.
	deckOfCards := DeckOfCards withEffects: cardTypes .
	twoPlayerGame := Game withBoard: aBoard withLaps: 2  withPlayers: players with: deckOfCards.
	twoPlayerGame thePlayer: jack willHaveTheCards: (OrderedCollection with: acceleration with: acceleration ).
	twoPlayerGame thePlayer: ben willHaveTheCards: (OrderedCollection with: acceleration with: redo ).
	diceOne nextRollNumber: 3.
	twoPlayerGame thePlayer: jack wantsToUseTheCard: acceleration.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 4 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 4 andLap: 0  for: ben  in: twoPlayerGame . 
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame thePlayer: ben wantsToUseTheCard: redo.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 8 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 9 andLap: 0  for: ben  in: twoPlayerGame . 
]

{ #category : #tests }
CardTest >> testRepeat [ 
	| cardTypes repeat deckOfCards twoPlayerGame |
	repeat := RepeatCard new.
	cardTypes := OrderedCollection with: repeat.
	deckOfCards := DeckOfCards withEffects: cardTypes .
	twoPlayerGame := Game withBoard: aBoard withLaps: 2  withPlayers: players with: deckOfCards.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 5 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 5 andLap: 0  for: ben  in: twoPlayerGame . 
	diceOne nextRollNumber: 3.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 8 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 8 andLap: 0  for: ben  in: twoPlayerGame . 
	twoPlayerGame thePlayer: jack wantsToUseTheCard: repeat with: ben.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 1 andLap: 1  for: jack  in: twoPlayerGame . 
	self assertPosition: 1 andLap: 1  for: ben  in: twoPlayerGame .
]

{ #category : #tests }
CardTest >> testSpeed [ 
	| cardTypes speed deckOfCards twoPlayerGame |
	speed := SpeedCard new.
	cardTypes := OrderedCollection with: speed.
	deckOfCards := DeckOfCards withEffects: cardTypes .
	twoPlayerGame := Game withBoard: aBoard withLaps: 2  withPlayers: players with: deckOfCards.
	twoPlayerGame thePlayer: jack wantsToUseTheCard: speed with: ben.
	diceOne nextRollNumber: 5.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 5 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 6 andLap: 0  for: ben  in: twoPlayerGame . 
	diceOne nextRollNumber: 2.
	twoPlayerGame newTurnWithDice: diceOne.
	twoPlayerGame newTurnWithDice: diceOne.
	self assertPosition: 7 andLap: 0  for: jack  in: twoPlayerGame . 
	self assertPosition: 9 andLap: 0  for: ben  in: twoPlayerGame . 
]
