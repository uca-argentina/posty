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
		'numberOfSlotsPerLap',
		'numberOfLaps',
		'listOfPlayers',
		'turn',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Game class >> withSteps: aNumberOfStepsPerLap withLaps: aNumberOfLaps withPlayers: players [
	^ self new
		initializeWithSteps: aNumberOfStepsPerLap
			withLaps: aNumberOfLaps
			withPlayers: players;
		yourself
]

{ #category : #description }
Game >> actualTurn [
	^ turn
]

{ #category : #asserting }
Game >> assertGameIsOver [
	self isOver
		ifTrue: [ self error: 'The game has ended' ]
]

{ #category : #initialize }
Game >> initializeWithSteps: aNumberOfStepsPerLap withLaps: aNumberOfLaps withPlayers: players [
	"Create a game with n steps to win and list of players, then assign first turn number"
	numberOfSlotsPerLap := aNumberOfStepsPerLap.
	listOfPlayers := players.
	numberOfLaps := aNumberOfLaps.
	turn := 1.
	
]

{ #category : #actions }
Game >> isOver [
	^ listOfPlayers anySatisfy: [ :player | player position > (numberOfLaps * numberOfSlotsPerLap) ]
]

{ #category : #description }
Game >> lapOf: aPlayer [ 
	aPlayer position < 0
	ifTrue: [ ^-1 ]
	ifFalse: [ ^ ((aPlayer position / numberOfSlotsPerLap)+1) asInteger. ]
	
	
]

{ #category : #description }
Game >> laps [
	^ numberOfLaps .
]

{ #category : #description }
Game >> lapsMade: aPlayer [
	^ (aPlayer position / numberOfSlotsPerLap) asInteger
		* numberOfSlotsPerLap
]

{ #category : #description }
Game >> lastLapOf: aPlayer [ 
	^ ((aPlayer lastPosition / numberOfSlotsPerLap) + 1) asInteger 
]

{ #category : #description }
Game >> lastPositionOf: aPlayer [ 
	^ aPlayer lastPosition
]

{ #category : #description }
Game >> listOfTurns [
	^ listOfPlayers 
]

{ #category : #action }
Game >> newTurnWithDice: aDice [ 
	"Picks the player that has to play according to turns and plays"
	| thePlayer|
	self assertGameIsOver.
	thePlayer := listOfPlayers at: self actualTurn.
	thePlayer AddPositionRecord: thePlayer position .
	thePlayer changePosition: aDice roll.
	self updateTurn: self actualTurn + 1.
]

{ #category : #accessing }
Game >> numberOfLaps [
	^ numberOfLaps 
]

{ #category : #description }
Game >> numberOfPlayers [
	"Returns the amount of players that are playing the game"

	^ listOfPlayers size
]

{ #category : #description }
Game >> numberOfSlotsPerLap [
	"Return length of the board"
	^ numberOfSlotsPerLap
]

{ #category : #description }
Game >> player [
	"Returns Game's players"
	^ listOfPlayers .
]

{ #category : #description }
Game >> positionOf: aPlayer [
	aPlayer position < 0
		ifTrue: [ ^ aPlayer position + numberOfSlotsPerLap ].
	aPlayer position <= numberOfSlotsPerLap
		ifTrue: [ ^ aPlayer position ]
		ifFalse: [ ^ aPlayer position - (self lapsMade: aPlayer) ]
]

{ #category : #description }
Game >> ranking [
	^ listOfPlayers sort: [ :player1 :player2 | player1 position > player2 position ]
]

{ #category : #description }
Game >> steps [
	"Return number of steps"
	^ numberOfSlotsPerLap 
]

{ #category : #actions }
Game >> updateTurn: aNumber [
	turn := aNumber > listOfPlayers size
		ifTrue: [ aNumber - listOfPlayers size ]
		ifFalse: [ aNumber ]
]

{ #category : #description }
Game >> winner [
	^ self ranking at: 1.
]
