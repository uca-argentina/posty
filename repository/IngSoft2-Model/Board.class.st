"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""aBoard""
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
	listOfBoxes:		<Object>


    Implementation Points
"
Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'listOfBoxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Board class >> with: boxes [ 
	^ self new
	initializeWith: boxes;
	yourself 
]

{ #category : #actions }
Board >> amountOfBoxes [
	^ listOfBoxes size
]

{ #category : #actions }
Board >> doEffectOn: aPlayer in: aGame [
	(listOfBoxes at: (aGame positionOf: aPlayer)) effectOn: aGame
]

{ #category : #actions }
Board >> doEffectOnLastPosition: aPlayer in: aGame [
	(listOfBoxes at: (aGame lastPositionOf: aPlayer)) effectOn: aGame
]

{ #category : #initialize }
Board >> initializeWith: boxes [ 
	"creates the board"
	listOfBoxes := boxes.
]

{ #category : #actions }
Board >> lapAccordingToBoard: aPosition [
	^ (aPosition // self amountOfBoxes)
]

{ #category : #actions }
Board >> positionAccordingToBoard: aPosition [
	aPosition < 0
		ifTrue: [ ^ aPosition + self amountOfBoxes ].
	aPosition <= self amountOfBoxes
		ifTrue: [ ^ aPosition  ]
		ifFalse: [ ^ aPosition - (aPosition // self amountOfBoxes * self amountOfBoxes) ]
]
