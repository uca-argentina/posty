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
		'cards',
		'cardsInPlay',
		'positionManager'
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
	(cardsOfEachPlayer at: (self indexInListOf: aPlayer)) add: 3.
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

{ #category : #accessing }
Game >> cardsInPlay [

^cardsInPlay 
]

{ #category : #accessing }
Game >> cardsOfEachPlayer [
	^cardsOfEachPlayer
]

{ #category : #initializing }
Game >> createPositionRecordsFor: aListOfPlayers [
	positionManager := Dictionary new.
	1 to: (aListOfPlayers size) do: [ :indexOfPlayer | 
		positionManager
			at: (aListOfPlayers at: indexOfPlayer)
			put: (PositionHandler withInitialPosition: 0) ]
]

{ #category : #description }
Game >> currentPlayer [
	^ listOfPlayers  at: turnManager returnTurn.
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
	numberOfLaps := aNumberOfLaps.
	turnManager := TurnManager withAmountOfPlayers: players size.
	listOfPlayers := players.
	self createPositionRecordsFor: players.
	cardsOfEachPlayer := OrderedCollection new.
	cards := deckOfCards .
	1 to: players size do: [ :eachElement | cardsOfEachPlayer add: (OrderedCollection with: 1 with: 2)   ].
	"self createCardsOfEachPlayerFor: players."
]

{ #category : #description }
Game >> isAPlayer: aPlayer [ 
	^ (positionManager keys) anySatisfy: [ :player | player = aPlayer ]
]

{ #category : #actions }
Game >> isOver [
	^ (positionManager values) anySatisfy: [ :eachPositionManager | eachPositionManager position > (numberOfLaps * (board amountOfBoxes)) ]
]

{ #category : #description }
Game >> lapOf: aPlayer [ 
	^ board lapAccordingToBoard: (positionManager at: aPlayer) position .
]

{ #category : #description }
Game >> lastLapOf: aPlayer [ 
	^ board lapAccordingToBoard: (positionManager at: aPlayer) lastPosition
]

{ #category : #description }
Game >> lastPositionOf: aPlayer [ 
	^ board positionAccordingToBoard: (positionManager at: aPlayer) lastPosition.
]

{ #category : #actions }
Game >> move: aPlayer anAmountOfBoxes: aNumber [
	(positionManager at: aPlayer) addNewRecord: aNumber 
]

{ #category : #actions }
Game >> newTurnWithDice: aDice [ 
	| thePlayer|
	self assertGameIsOver.
	thePlayer := self currentPlayer.
	self move: thePlayer anAmountOfBoxes: aDice roll.
	board doEffectOn: thePlayer in: self.
	turnManager updateTurn.
]

{ #category : #description }
Game >> positionOf: aPlayer [
	| position |
	position := (positionManager at: aPlayer) position.
	^ board positionAccordingToBoard: position.
	
]

{ #category : #description }
Game >> ranking [
	| ranking sorted|
	ranking := OrderedCollection new.
	sorted := (positionManager values) sort: [ :element1 :element2 | element1 position > element2 position].
	1 to: (positionManager size) do: [ :each | ranking add: (positionManager keyAtValue: (sorted at: each)) ].
	^ ranking
]

{ #category : #description }
Game >> rankingPositionOf: aPlayer [
	self ranking doWithIndex: [ :element :index | element = aPlayer 
		ifTrue: [ ^ index ]].
]

{ #category : #removing }
Game >> removeCard: aCard [

	(self cardsInPlay includes: aCard)
	ifTrue: [ self cardsInPlay includes: aCard ]
]

{ #category : #actions }
Game >> restOfPlayers [
	^ (positionManager keys )
		select: [ :player | player ~= (self currentPlayer) ]
]

{ #category : #actions }
Game >> sendAllPlayersToPosition: aPosition [
	1 to: (positionManager size) do: [ :each |  (positionManager values at: each) moveToZero ]
]

{ #category : #actions }
Game >> sendToLastPosition: aPlayer [
	(positionManager at: aPlayer) deleteLastRecord.
]

{ #category : #description }
Game >> steps [
	^ board amountOfBoxes
]

{ #category : #description }
Game >> winner [
	^ self ranking at: 1.
]
