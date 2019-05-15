"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Testing board creation acording to probability ""
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
	#name : #BoardTest,
	#superclass : #TestCase,
	#instVars : [
		'empty',
		'moonwalk',
		'atomicbomb',
		'speedup',
		'boxes',
		'aBoard',
		'timemachine',
		'wormhole'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
BoardTest >> setUp [
	empty := Empty withProbability: 0.55.
	moonwalk := Moonwalk withProbability: 0.05.
	atomicbomb := AtomicBomb withProbability: 0.02.
	speedup := SpeedUp withProbability: 0.15.
	timemachine := TimeMachine withProbability: 0.08.
	wormhole := WormHole withProbability: 0.15.
	boxes := OrderedCollection with: empty with: moonwalk with: atomicbomb with: speedup with:timemachine with: wormhole.
	aBoard := Board with: boxes.
]

{ #category : #tests }
BoardTest >> testAmountOfBoxes [
	self assert: aBoard amountOfBoxes equals: 6.
	
]

{ #category : #tests }
BoardTest >> testCreateABoardAccordingProbabilities [
	| collectionOfBoxes |
	collectionOfBoxes := BoardCreator with: boxes size: 15.
	collectionOfBoxes createBoard.
	self assert: collectionOfBoxes amountOfBoxes equals: 15.
]

{ #category : #tests }
BoardTest >> testCreateBoardListOfProbabilities [
	| collectionOfBoxes |
	collectionOfBoxes := BoardCreator with: boxes size: 15.
	self assert:  (collectionOfBoxes probability at: 1) equals: (empty probability).
	self assert:  (collectionOfBoxes probability at: 2) equals: (moonwalk probability).
	self assert:  (collectionOfBoxes probability at: 3) equals: (atomicbomb probability).
	self assert:  (collectionOfBoxes probability at: 4) equals: (speedup probability).
	self assert:  (collectionOfBoxes probability at: 5) equals: (timemachine probability).
	self assert:  (collectionOfBoxes probability at: 6) equals: (wormhole probability).
]

{ #category : #tests }
BoardTest >> testReturnEffectAtIndexN [
	self assert: (aBoard atIndex: 2) equals: moonwalk.
]
