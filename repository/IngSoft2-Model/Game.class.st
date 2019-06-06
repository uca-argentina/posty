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
		'cardsInHandOfEachPlayer',
		'deckOfCards',
		'positionManager',
		'permanentCards'
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
	(cardsInHandOfEachPlayer at: aPlayer) add: deckOfCards pickACard .
]

{ #category : #description }
Game >> amountOfCardsOf: aPlayer [ 
	^ (cardsInHandOfEachPlayer at: aPlayer) size.
]

{ #category : #'effect of cards' }
Game >> applyCardEffectsTo: aPlayer [
	(permanentCards at: aPlayer) isNotEmpty 
		ifTrue: [ ^ self permanentCardsEffectsAppliableTo: aPlayer ]
		ifFalse: [ ^ 0 ]
]

{ #category : #'effect of cards' }
Game >> applyEffect: anEffect to: aPlayer [ 
	(permanentCards at: aPlayer) add: anEffect.
]

{ #category : #'effect of cards' }
Game >> applyEffectToAll: anEffect [ 
	listOfPlayers do: [ :eachPlayer | (permanentCards at: eachPlayer) add: anEffect ]
]

{ #category : #asserting }
Game >> assertGameIsOver [
	self isOver
		ifTrue: [ self error: 'The game has ended' ]
]

{ #category : #creation }
Game >> createCardsOfEachPlayerFor: aListOfPlayers [
	cardsInHandOfEachPlayer := Dictionary new.
	1 to: (aListOfPlayers size) do: [ :indexOfPlayer | 
		cardsInHandOfEachPlayer
			at: (aListOfPlayers at: indexOfPlayer)
			put: self pickTwoRandomCards ]
]

{ #category : #creation }
Game >> createEffectOnPlayer: aListOfPlayers [
	permanentCards := Dictionary new.
	1 to: (aListOfPlayers size) do: [ :indexOfPlayer | 
		permanentCards
			at: (aListOfPlayers at: indexOfPlayer)
			put: (OrderedCollection new) ]
]

{ #category : #creation }
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

{ #category : #initializing }
Game >> initializeWithBoard: aBoard withLaps: aNumberOfLaps withPlayers: players with: aDeckOfCards [ 
	board := aBoard.
	numberOfLaps := aNumberOfLaps.
	turnManager := TurnManager withAmountOfPlayers: players size.
	listOfPlayers := players.
	deckOfCards := aDeckOfCards .
	self createEffectOnPlayer: players.
	self createPositionRecordsFor: players.
	self createCardsOfEachPlayerFor: players.
]

{ #category : #description }
Game >> isAPlayer: aPlayer [ 
	^ (positionManager keys) anySatisfy: [ :player | player = aPlayer ]
]

{ #category : #asserting }
Game >> isOver [
	^ (positionManager values) anySatisfy: [ :eachPositionManager | eachPositionManager position > (numberOfLaps * (board amountOfBoxes)) ]
]

{ #category : #positions }
Game >> lapOf: aPlayer [ 
	^ board lapAccordingToBoard: (positionManager at: aPlayer) position .
]

{ #category : #positions }
Game >> lastLapOf: aPlayer [ 
	^ board lapAccordingToBoard: (positionManager at: aPlayer) lastPosition
]

{ #category : #positions }
Game >> lastPositionOf: aPlayer [ 
	^ board positionAccordingToBoard: (positionManager at: aPlayer) lastPosition.
]

{ #category : #actions }
Game >> move: aPlayer anAmountOfBoxes: aNumber [
	(positionManager at: aPlayer) addNewRecord: aNumber + (self applyCardEffectsTo: aPlayer).
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

{ #category : #'effect of cards' }
Game >> permanentCardsEffectsAppliableTo: aPlayer [
	^ (permanentCards at: aPlayer) inject: 0 into:  [ :sum :eachCard | sum + (eachCard effect)  ].
]

{ #category : #'ways to use cards' }
Game >> pickTwoRandomCards [
	^ OrderedCollection with: deckOfCards pickACard with: deckOfCards pickACard .
]

{ #category : #positions }
Game >> positionOf: aPlayer [
	| position |
	position := (positionManager at: aPlayer) position.
	^ board positionAccordingToBoard: position.
	
]

{ #category : #'ranking of the game' }
Game >> ranking [
	| ranking sorted|
	ranking := OrderedCollection new.
	sorted := (positionManager values) sort: [ :element1 :element2 | element1 position > element2 position].
	1 to: (positionManager size) do: [ :each | ranking add: (positionManager keyAtValue: (sorted at: each)) ].
	^ ranking
]

{ #category : #'ranking of the game' }
Game >> rankingPositionOf: aPlayer [
	self ranking doWithIndex: [ :element :index | element = aPlayer 
		ifTrue: [ ^ index ]].
]

{ #category : #removing }
Game >> removeCard: aCard [

	(self cardsInPlay includes: aCard)
	ifTrue: [ self cardsInPlay includes: aCard ]
]

{ #category : #description }
Game >> restOfPlayers [
	^ (positionManager keys )
		select: [ :player | player ~= (self currentPlayer) ]
]

{ #category : #positions }
Game >> sendAllPlayersToPosition: aPosition [
	1 to: (positionManager size) do: [ :each |  (positionManager values at: each) moveToZero ]
]

{ #category : #positions }
Game >> sendToLastPosition: aPlayer [
	(positionManager at: aPlayer) deleteLastRecord.
]

{ #category : #description }
Game >> steps [
	^ board amountOfBoxes
]

{ #category : #'ways to use cards' }
Game >> thePlayer: aPlayer usesTheCard: aCard [ 
	(cardsInHandOfEachPlayer at: aPlayer) remove: aCard. 
]

{ #category : #'ways to use cards' }
Game >> thePlayer: aPlayer wantsToUseTheCard: anEffect [ 
	self thePlayer: aPlayer usesTheCard: anEffect.
	self applyEffectToAll: anEffect.
]

{ #category : #'ways to use cards' }
Game >> thePlayer: aPlayer wantsToUseTheCard: anEffect on: anotherEffect [ 
	self thePlayer: aPlayer usesTheCard: anEffect . 
	permanentCards valuesDo: [ :effect | effect remove: anotherEffect ]
]

{ #category : #'ways to use cards' }
Game >> thePlayer: aPlayer wantsToUseTheCard: anEffect with: anotherPlayer [ 
	self thePlayer: aPlayer usesTheCard: anEffect.
	self applyEffect: anEffect to: anotherPlayer.
	
]

{ #category : #'ways to use cards' }
Game >> thePlayer: aPlayer willHaveTheCards: aCollection [ 
	cardsInHandOfEachPlayer at: aPlayer put: aCollection.
]

{ #category : #'ranking of the game' }
Game >> winner [
	^ self ranking at: 1.
]
