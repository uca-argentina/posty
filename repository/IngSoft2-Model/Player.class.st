"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Im a player of this game""
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
	playerName:		<Object>
	position:		<Object>


    Implementation Points
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'playerName',
		'position',
		'lapNumber',
		'myTurn',
		'lastPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Player class >> called: aName [
	^ self new
		initializeWithName: aName;
		yourself
]

{ #category : #assertions }
Player >> assertGameIsOver: aGameStatus [
	"Assertion to detect if the game has ended"

	aGameStatus
		ifTrue: [ self error: 'Game has already ended' ]
]

{ #category : #assertions }
Player >> assertIsMyTurn: gameTurn [
	"Assertion to know if it is the turn of the player"

	gameTurn = myTurn
		ifFalse: [ self error: 'Its not your turn' ]
]

{ #category : #actions }
Player >> assignTurn: aNumber [
	"Give a player a turn number"

	myTurn := aNumber
]

{ #category : #initialize }
Player >> initializeWithName: aName [
	"Create a player with a name and locate him at the begining of the game"

	playerName := aName.
	position := 0.
	lapNumber:= 0
]

{ #category : #description }
Player >> lap [ 
	^ lapNumber
]

{ #category : #accessing }
Player >> lastPosition [ 
	^ lastPosition .
]

{ #category : #actions }
Player >> move: aNumberOfSteps [
	"Change position of the player in the game"

	lastPosition:= position.
	position:= position + aNumberOfSteps.
]

{ #category : #description }
Player >> name [
	"Show player name"

	^ playerName
]

{ #category : #actions }
Player >> plays: aGame with: aDice [
	"When a player plays the game check if the game is still on, if it is its turn, roll the dice and update turn assignation"
	self assertGameIsOver: aGame isOver.
	self assertIsMyTurn: aGame actualTurn.
	self move: aDice roll.
	self updateLap: aGame numberOfSlotsPerLap.
	(aGame board at: (self position) )effect:aGame.
	self updateLap: aGame numberOfSlotsPerLap.
	self updateTurn: aGame.
]

{ #category : #description }
Player >> position [
	"Return where is the player in the game"

	^ position
]

{ #category : #description }
Player >> turn [
	"Return turn value of the player"

	^ myTurn
]

{ #category : #updates }
Player >> updateLap: numberOfSlots [
	"After the player plays it has to update its turn in the queue"

	position > numberOfSlots
		ifTrue: [ 
			position := position - numberOfSlots.
			lapNumber := self lap + 1 ]
]

{ #category : #updates }
Player >> updateTurn: aGame [
	"After the player plays it has to update its turn in the queue"
	
	aGame nextTurn: myTurn + 1.
	self assignTurn: myTurn + aGame numberOfPlayers
]
