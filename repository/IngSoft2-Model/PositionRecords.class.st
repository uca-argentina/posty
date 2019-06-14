"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".
""a position handler""
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
	#name : #PositionRecords,
	#superclass : #Object,
	#instVars : [
		'recordOfPositions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PositionRecords class >> withInitialPosition: aNumber [
	^ self new 
		initializeWithInitialPosition: aNumber;
		yourself
]

{ #category : #adding }
PositionRecords >> addNewRecord: aNumber [
	recordOfPositions add: aNumber.
]

{ #category : #adding }
PositionRecords >> deleteLastRecord [
	recordOfPositions remove: (recordOfPositions last).
]

{ #category : #initialization }
PositionRecords >> initializeWithInitialPosition: aNumber [
	recordOfPositions := OrderedCollection with: aNumber.
]

{ #category : #accessing }
PositionRecords >> lastPosition [
	^ recordOfPositions sum - recordOfPositions last.
]

{ #category : #accessing }
PositionRecords >> moveToBeginning [
	  recordOfPositions add: (self position) negated 
]

{ #category : #accessing }
PositionRecords >> position [
	^ recordOfPositions sum
]
