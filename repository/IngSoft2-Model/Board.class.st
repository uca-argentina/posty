"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""The Board""
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
		'listOfBoxes',
		'numberOfSteps',
		'listOfEffects'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Board class >> assertValidNumberOfSteps: aNumberOfSteps [
	aNumberOfSteps > 0
		ifFalse: [ self error: 'Number of steps must be 0 or greater' ]
]

{ #category : #creation }
Board class >> withSteps: aNumberOfSteps with: effects [
	self assertValidNumberOfSteps: aNumberOfSteps.
	^ self new
		initializeWithSteps: aNumberOfSteps 
		withEffects: effects;
		yourself
]

{ #category : #operations }
Board >> addTypeEffect: random number: aTypeOfEffect [
	(listOfBoxes select: [ :box | box = (listOfEffects at: aTypeOfEffect) ]) size
		< (numberOfSteps * ((listOfEffects at: aTypeOfEffect) probability))
		ifTrue: [ listOfEffects reject: [ :element | element ~= (listOfEffects at: aTypeOfEffect )].
			listOfBoxes add: (listOfEffects at: (random next * 6 + 1) asInteger) ].
	
]

{ #category : #description }
Board >> boxes [
	^listOfBoxes 
]

{ #category : #operations }
Board >> create [
	| random |
	random := Random new.
	1 to: numberOfSteps do:
		[ :b | self addTypeEffect: random number: 1. 
		self addTypeEffect: random number: 2. 
		self addTypeEffect: random number: 3. 
		self addTypeEffect: random number: 4. 
		self addTypeEffect: random number: 5. 
		self addTypeEffect: random number: 6. 
		]
]

{ #category : #description }
Board >> effects [
	^ listOfEffects 
	
]

{ #category : #initialization }
Board >> initializeWithSteps: aNumberOfSteps withEffects: alistOfEffects [
	numberOfSteps := aNumberOfSteps.
	listOfEffects := alistOfEffects.
	listOfBoxes := OrderedCollection new.
	self create.
]
