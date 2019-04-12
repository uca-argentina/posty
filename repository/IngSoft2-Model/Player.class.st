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
		'playerDice',
		'move'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Player class >> call: aName withDice: aDice [
	^ self new
		initializeWithName: aName
			withDice: aDice;
		yourself
]

{ #category : #initialize }
Player >> initializeWithName: aName withDice: aDice [
	playerName := aName.
	playerDice := aDice.
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
Player >> plays [
	self move: (playerDice  roll).
]

{ #category : #actions }
Player >> position [ 
	^ position
]
