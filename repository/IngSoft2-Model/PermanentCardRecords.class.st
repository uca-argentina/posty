"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""""""
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
	#name : #PermanentCardRecords,
	#superclass : #Object,
	#instVars : [
		'permanentCards',
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
PermanentCardRecords class >> createForGame: aGame [
	^ self new initializePermanentCardRecordsForGame: aGame; yourself
]

{ #category : #adding }
PermanentCardRecords >> addCard: aCard [
	permanentCards add: aCard.
]

{ #category : #action }
PermanentCardRecords >> applyEffects [
	^ permanentCards
		inject: 0
		into: [ :sum :card | sum + (card cardOn: game) ]
]

{ #category : #initialization }
PermanentCardRecords >> initializePermanentCardRecordsForGame: aGame [
	permanentCards := OrderedCollection new.
	game:= aGame.
]

{ #category : #removing }
PermanentCardRecords >> removeCard: aCard [
	permanentCards remove: aCard.
]
