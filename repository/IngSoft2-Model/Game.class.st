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
Game class >> withBoard: aBoard withLaps: aNumberOfLaps withPlayers: players [ 
	^ self new 
		initializeWithBoard: aBoard
		withLaps: aNumberOfLaps
		withPlayers: players;
		yourself
]

{ #category : #description }
Game >> actualTurn [
	"returns which turn number has now to play"
	^ turn
]

{ #category : #asserting }
Game >> assertGameIsOver [
	"ask if the game is over"
	self isOver
		ifTrue: [ self error: 'The game has ended' ]
]

{ #category : #initialization }
Game >> initializeWithBoard: aBoard withLaps: aNumberOfLaps withPlayers: players [ 
	"Creates the game with a board, players and a number of laps."
	board := aBoard.
	listOfPlayers := players.
	numberOfLaps := aNumberOfLaps.
	turn := 1.
]

{ #category : #actions }
Game >> isOver [
	"ask if any player has reached the end of the game"
	^ listOfPlayers anySatisfy: [ :player | player position > (numberOfLaps * (board amountOfBoxes)) ]
]

{ #category : #description }
Game >> lapOf: aPlayer [ 
	"ask the player its position to calculate in which lap it is"
	aPlayer position < 0
	ifTrue: [ ^-1 ]
	ifFalse: [ ^ ((aPlayer position / board amountOfBoxes)+1) asInteger. ]
	
	
]

{ #category : #description }
Game >> laps [
	"returns number of laps of the game"
	^ numberOfLaps .
]

{ #category : #description }
Game >> lapsMade: aPlayer [
	"ask how many laps has completed the player"
	^ (aPlayer position / board amountOfBoxes) asInteger
		* board amountOfBoxes 
]

{ #category : #description }
Game >> lastLapOf: aPlayer [ 
	"ask the player its last position to calculate in which lap was"
	^ ((aPlayer lastPosition / board amountOfBoxes) + 1) asInteger 
]

{ #category : #description }
Game >> lastPositionOf: aPlayer [ 
	"ask the player its last position"
	^ aPlayer lastPosition
]

{ #category : #description }
Game >> listOfTurns [
	"ask in which order are the players"
	^ listOfPlayers 
]

{ #category : #action }
Game >> newTurnWithDice: aDice [ 
	"Picks the player that has to play according to turns and plays"
	| thePlayer|
	self assertGameIsOver.
	thePlayer := listOfPlayers at: self actualTurn.
	thePlayer AddPositionRecord: (self positionOf: thePlayer).
	thePlayer changePosition: aDice roll.
	(board atIndex: (self positionOf: thePlayer)) effectOn: self.
	self updateTurn: self actualTurn + 1.
]

{ #category : #accessing }
Game >> numberOfLaps [
	"number of laps of the game"
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
	"ask the player its position and calculates according to the game structure its location on the board"
	aPlayer position < 0
		ifTrue: [ ^ aPlayer position + board amountOfBoxes  ].
	aPlayer position <= board amountOfBoxes
		ifTrue: [ ^ aPlayer position ]
		ifFalse: [ ^ aPlayer position - (self lapsMade: aPlayer) ]
]

{ #category : #description }
Game >> ranking [
	"sort players according to position so it makes a ranking"
	^ listOfPlayers sort: [ :player1 :player2 | player1 position > player2 position ]
]

{ #category : #description }
Game >> steps [
	"Return number of steps"
	^ board amountOfBoxes
]

{ #category : #actions }
Game >> updateTurn: aNumber [
	"update turns according the players in the game"
	turn := aNumber > listOfPlayers size
		ifTrue: [ aNumber - listOfPlayers size ]
		ifFalse: [ aNumber ]
]

{ #category : #description }
Game >> winner [
	"the winner is the one that is first at the ranking"
	^ self ranking at: 1.
]
