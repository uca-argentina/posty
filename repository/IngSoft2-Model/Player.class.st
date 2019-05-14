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

{ #category : #action }
Player >> AddPositionRecord: aNumber [
	lastPosition add: aNumber .
]

{ #category : #action }
Player >> changePosition: aNumber [ 
	"When the player changes its position dependending it last postion"
	position := position + aNumber.
]

{ #category : #initialize }
Player >> initializeWithName: aName [
	"Create a player with a name and locate him at the begining of the game"

	playerName := aName.
	position := 0.
	lastPosition := OrderedCollection with: 0.
]

{ #category : #description }
Player >> lastPosition [
	^ lastPosition at: (lastPosition size -1)
]

{ #category : #accessing }
Player >> move: aNumber [
	"When the player changes its position not dependending it last postion"
	position := aNumber
]

{ #category : #description }
Player >> name [
	^ playerName 
]

{ #category : #description }
Player >> position [
	^ position
]
