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
		'myTurn'
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
	aGameStatus ifTrue: [ self error: 'Game has already ended' ]
]

{ #category : #assertions }
Player >> assertIsMyTurn: gameTurn [
	gameTurn  = myTurn 
		ifFalse: [ self error: 'Its not your turn' ]
]

{ #category : #actions }
Player >> assignTurn: aNumber [
	myTurn := aNumber.
]

{ #category : #initialize }
Player >> initializeWithName: aName [
	playerName := aName.
	position := 0
]

{ #category : #actions }
Player >> move: aNumberOfSteps [ 
	 position := position + aNumberOfSteps
]

{ #category : #description }
Player >> name [
	^ playerName
]

{ #category : #actions }
Player >> plays: aGame with: aDice [
	self assertGameIsOver: aGame isOver.
	self assertIsMyTurn: aGame actualTurn.
	self updateTurn: aGame.
	self move: aDice roll.
	
	
]

{ #category : #actions }
Player >> position [ 
	^ position
]

{ #category : #description }
Player >> turn [
	^ myTurn
]

{ #category : #updates }
Player >> updateTurn: aGame [
	aGame nextTurn: (myTurn + 1).
	self assignTurn: (myTurn + (aGame numberOfPlayers)).
]
