"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".
""extract data from positions""
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
	#name : #PositionOfAPlayer,
	#superclass : #Object,
	#instVars : [
		'player',
		'positionRecords'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PositionOfAPlayer class >> player: aPlayer positionRecords: aPositionRecord [
	^ self new 
		initializeWithPlayer: aPlayer
		positionRecords: aPositionRecord ;
		yourself
]

{ #category : #accessing }
PositionOfAPlayer >> allPositionRecord [
	^ positionRecords 
]

{ #category : #initialization }
PositionOfAPlayer >> initializeWithPlayer: aPlayer positionRecords: aPositionRecord [
	player := aPlayer.
	positionRecords := aPositionRecord .
]

{ #category : #accessing }
PositionOfAPlayer >> player [
	^ player 
]
