"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Manage turns of the game""
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
	#name : #AssignTurn,
	#superclass : #Object,
	#instVars : [
		'numberOfPlayers',
		'turnNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
AssignTurn class >> withAmountOfPlayers: aNumberOfPlayers [
	^ self new 
	initializeWithAmountOfPlayers: aNumberOfPlayers;
	yourself.
]

{ #category : #initialization }
AssignTurn >> initializeWithAmountOfPlayers: aNumberOfPlayers [
	numberOfPlayers := aNumberOfPlayers.
	turnNumber := 1.
]

{ #category : #action }
AssignTurn >> returnTurn [
	^ turnNumber .
]

{ #category : #action }
AssignTurn >> updateTurn [
	| newTurnNumber |
	newTurnNumber := turnNumber + 1.
	turnNumber:= newTurnNumber > numberOfPlayers
		ifTrue: [ newTurnNumber - numberOfPlayers ]
		ifFalse: [ newTurnNumber ]
]
