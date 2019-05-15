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

{ #category : #description }
Board >> amountOfBoxes [
	"returns size of the board"
	^ listOfBoxes size
]

{ #category : #actions }
Board >> atIndex: aBoardPosition [
	"return an effect from an specific position"
	^ listOfBoxes at: aBoardPosition.
]

{ #category : #initialize }
Board >> initializeWith: boxes [ 
	"creates the board"
	listOfBoxes := boxes.
]
