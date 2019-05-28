"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

""Im the board game""
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	numberOfPlayers:		<Object>
	numberOfStepsToWin:		<Object>
	position:		<Object>
	stepsToWin:		<Object>


    Implementation Points
"
Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'numberOfLaps',
		'listOfPlayers',
		'board',
		'turnManager',
		'listOfPositions',
		'listOfLastDiceResult',
		'cardsOfEachPlayer',
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Game class >> assertIsAPositiveNumber: aNumber [
	aNumber > 0
		ifFalse: [ self error: 'Invalid' ]
	
]

{ #category : #creation }
Game class >> withBoard: aBoard withLaps: aNumberOfLaps withPlayers: players with: deckOfCards [ 
	self assertIsAPositiveNumber: aBoard amountOfBoxes.
	self assertIsAPositiveNumber: aNumberOfLaps.
	self assertIsAPositiveNumber: players size.
	^ self new 
		initializeWithBoard: aBoard
		withLaps: aNumberOfLaps
		withPlayers: players
		with: deckOfCards ;
		yourself
]

{ #category : #actions }
Game >> addCardToPlayer: aPlayer [ 
	(cardsOfEachPlayer at: (self indexInListOf: aPlayer)) add: cards removeLast.
]

{ #category : #description }
Game >> amountOfCardsOf: aPlayer [ 
	^ (cardsOfEachPlayer at: (self indexInListOf: aPlayer)) size.
]

{ #category : #asserting }
Game >> assertGameIsOver [
	self isOver
		ifTrue: [ self error: 'The game has ended' ]
]

{ #category : #description }
Game >> indexInListOf: aPlayer [
	| indexOfPlayer |
	indexOfPlayer := 0.
	listOfPlayers
		doWithIndex: [ :eachPlayer :playerIndex | 
			eachPlayer = aPlayer
				ifTrue: [ indexOfPlayer := playerIndex ] ].
	^ indexOfPlayer
]

{ #category : #initializing }
Game >> initializeWithBoard: aBoard withLaps: aNumberOfLaps withPlayers: players with: deckOfCards [ 
	board := aBoard.
	listOfPlayers := players.
	numberOfLaps := aNumberOfLaps.
	turnManager := GameTurn withAmountOfPlayers: players size.
	listOfPositions := OrderedCollection new.
	listOfLastDiceResult := OrderedCollection new.
	cardsOfEachPlayer := OrderedCollection new.
	cards := deckOfCards .
	(1 to: players size) do: [ :eachElement | listOfPositions add: 0. listOfLastDiceResult add: 0 . cardsOfEachPlayer add: (OrderedCollection with: 1 with: 2)   ]
]

{ #category : #description }
Game >> isAPlayer: aPlayer [ 
	^ listOfPlayers anySatisfy: [ :player | player = aPlayer ]
]

{ #category : #actions }
Game >> isOver [
	^ listOfPositions anySatisfy: [ :position | position > (numberOfLaps * (board amountOfBoxes)) ]
]

{ #category : #description }
Game >> lapOf: aPlayer [ 
	| position |
	position := listOfPositions at: (self indexInListOf: aPlayer) .
	^ board lapAccordingToBoard: position
]

{ #category : #accessing }
Game >> lastDiceResultFrom: aPlayer [
	^ listOfLastDiceResult at: (self indexInListOf: aPlayer).
]

{ #category : #description }
Game >> lastLapOf: aPlayer [ 
	^ board lapAccordingToBoard: (self lastPositionOf: aPlayer)
]

{ #category : #description }
Game >> lastPositionOf: aPlayer [ 
	^ board positionAccordingToBoard: ((self positionOf: aPlayer) - (self lastDiceResultFrom: aPlayer)).
]

{ #category : #actions }
Game >> move: aPlayer anAmountOfBoxes: aNumber [
	| indexOfPlayer actualPosition |
	indexOfPlayer := self indexInListOf: aPlayer.
	actualPosition := listOfPositions at: indexOfPlayer .
	listOfPositions at: indexOfPlayer put: (actualPosition + aNumber).
	listOfLastDiceResult at: indexOfPlayer put: aNumber.
]

{ #category : #actions }
Game >> newTurnWithDice: aDice [ 
	| thePlayer|
	self assertGameIsOver.
	thePlayer := self nowPlays.
	self move: thePlayer anAmountOfBoxes: aDice roll.
	board doEffectOn: thePlayer in: self.
	turnManager updateTurn.
]

{ #category : #description }
Game >> nowPlays [
	^ listOfPlayers at: turnManager returnTurn.
]

{ #category : #description }
Game >> positionOf: aPlayer [
	| position |
	position := listOfPositions at: (self indexInListOf: aPlayer).
	^ board positionAccordingToBoard: position.
	
]

{ #category : #description }
Game >> ranking [
	| ranking  |
	ranking := OrderedCollection new.
	(1 to: listOfPlayers size) do: [ :each | ranking add: (OrderedCollection with: each) ].
	(1 to: listOfPlayers size) do: [ :each | (ranking at: each) add: (listOfPositions at: each) ].
	ranking sort: [ :element1 :element2 | (element1 at: 2) > (element2 at: 2) ].
	^ ranking
]

{ #category : #description }
Game >> rankingPositionOf: aPlayer [
	| indexOfPlayer |
	indexOfPlayer := self indexInListOf: aPlayer.
	self ranking doWithIndex: [ :element :index | (element at: 1) = indexOfPlayer 
		ifTrue: [ ^ index ]].
]

{ #category : #actions }
Game >> restOfPlayers [
	^ listOfPlayers 
		select: [ :player | player ~= (self nowPlays) ]
]

{ #category : #actions }
Game >> sendAllPlayersToPosition: aPosition [
	(1 to: listOfPositions size) do: [ :eachPosition | listOfPositions at: eachPosition put: 0 ]
]

{ #category : #description }
Game >> steps [
	^ board amountOfBoxes
]

{ #category : #description }
Game >> winner [
	^ listOfPlayers at: ((self ranking at: 1) at: 1).
]
