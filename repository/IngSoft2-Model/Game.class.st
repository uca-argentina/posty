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
	"Because every player has a number of turn, actualTurn returns which player can play"

	^ turn
]

{ #category : #description }
Game >> chart [
	listOfPlayers sort: [ " insert criterio" ].
	^ listOfPlayers
]

{ #category : #actions }
Game >> createBoard [
]

{ #category : #initialize }
Game >> initializeWithSteps: aNumberOfStepsPerLap withLaps: aNumberOfLaps withPlayers: players [
	"Create a game with n steps to win and list of players, then assign first turn number"
	numberOfSlotsPerLap := aNumberOfStepsPerLap.
	listOfPlayers := players.
	numberOfLaps := aNumberOfLaps.
	turn := 1.
	self start.
	self createBoard
]

{ #category : #actions }
Game >> isOver [
	"Looks if a player has reached the end of the game"

	^ listOfPlayers 
		anySatisfy: [ :player | (player position >=  (numberOfSlotsPerLap * numberOfLaps) )] 
]

{ #category : #actions }
Game >> nextTurn: aNumber [
	"Updates the collaborator turn with a new value"

	turn := aNumber
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

	^ numberOfSlotsPerLap
]

{ #category : #description }
Game >> players [
	"Return all the players of the game"

	^ listOfPlayers
]

{ #category : #accessing }
Game >> start [
	"Everytime the game is created it assign turns to all players"

	| turns |
	turns := 1 to: listOfPlayers size.
	listOfPlayers
		with: turns
		do: [ :player :number | player assignTurn: number ]
]

{ #category : #description }
Game >> stepsToWin [
	"Returns how long the game is"

	^ numberOfSlotsPerLap * numberOfLaps
]

{ #category : #actions }
Game >> winner [
	"Returns a player that has already win"

	^ listOfPlayers
		detect: [ :player | (player position >= 0 ) & (player lap = numberOfLaps ) ]
]
