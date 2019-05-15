"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Testing box behavior""
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
	#name : #BoxTest,
	#superclass : #TestCase,
	#instVars : [
		'jack',
		'ben',
		'players',
		'atomicBomb',
		'aGame',
		'moonWalk',
		'speedUp',
		'timeMachine',
		'vacio',
		'wormHole',
		'boxes',
		'aBoard',
		'returnsFour',
		'returnsFive',
		'returnsSix',
		'returnsSeven',
		'returnsNine',
		'returnsEight'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
BoxTest >> setUp [
	"Dice Creation"
	returnsFour := SameFaceDice withFaces: 4.
	returnsFive := SameFaceDice withFaces: 5.
	returnsSix := SameFaceDice withFaces: 6.
	returnsSeven := SameFaceDice withFaces: 7.
	returnsEight := SameFaceDice withFaces: 8.
	returnsNine := SameFaceDice withFaces: 9.
	"Player Creation"
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	"Effects Creation"
	atomicBomb := AtomicBomb withProbability: 0.2.
	moonWalk := Moonwalk withProbability: 0.05.
	speedUp := SpeedUp withProbability: 0.15.
	timeMachine := TimeMachine withProbability: 0.08.
	vacio := Empty withProbability: 0.55.
	wormHole := WormHole withProbability: 0.15.
	"Board creation"
	boxes := OrderedCollection with: vacio with: speedUp with: moonWalk with: atomicBomb with: vacio with: moonWalk.
	boxes add: timeMachine .
	boxes add: speedUp .
	boxes add: vacio.
	boxes add: wormHole.
	aBoard := Board with: boxes.
	"Game Creation"
	aGame := Game withBoard: aBoard withLaps: 5  withPlayers:  players.
]

{ #category : #tests }
BoxTest >> testAtomicBomb [
	"When second player gets a Four he reaches atomic bomb"
	aGame newTurnWithDice: returnsFive.
	aGame newTurnWithDice: returnsFour.
	self assert: (aGame positionOf: jack) equals: 0.
	self assert: (aGame positionOf: ben) equals: 0.
	
	
]

{ #category : #tests }
BoxTest >> testMoonWalk [
	aGame newTurnWithDice: returnsFive.
	aGame newTurnWithDice: returnsSix.
	self assert: (aGame positionOf: jack) equals: 6.
	self assert: (aGame lapOf: jack) equals: -1.
	self assert: (aGame positionOf: ben) equals: 6.
	self assert: (aGame lapOf: ben) equals: 1.
	
]

{ #category : #tests }
BoxTest >> testSpeedUp [
	aGame newTurnWithDice: returnsFive.
	aGame newTurnWithDice: returnsNine.
	aGame newTurnWithDice: returnsSeven.
	self assert: (aGame positionOf: jack) equals: 6.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 9.
	self assert: (aGame lapOf: ben) equals: 1.
]

{ #category : #tests }
BoxTest >> testTimeMachine [
	aGame newTurnWithDice: returnsFive.
	aGame newTurnWithDice: returnsNine.
	aGame newTurnWithDice: returnsFour.
	aGame newTurnWithDice: returnsSix.
	aGame newTurnWithDice: returnsEight.
	self assert: (aGame positionOf: jack) equals: 5.
	self assert: (aGame lapOf: jack) equals: 1.
	self assert: (aGame positionOf: ben) equals: 5.
	self assert: (aGame lapOf: ben) equals: 2
]

{ #category : #tests }
BoxTest >> testVacio [
	aGame newTurnWithDice: returnsFive.
	aGame newTurnWithDice: returnsNine.
	self assert: (aGame positionOf: jack) equals: 5.
	self assert: (aGame lapOf: jack) equals: 1.
	self assert: (aGame positionOf: ben) equals: 9.
	self assert: (aGame lapOf: ben) equals: 1
]

{ #category : #tests }
BoxTest >> testWormHole [
	aGame newTurnWithDice: returnsFive.
	aGame newTurnWithDice: returnsNine.
	aGame newTurnWithDice: returnsFive.
	self assert: (aGame positionOf: jack) equals: 6.
	self assert: (aGame lapOf: jack) equals: 1.
	self assert: (aGame positionOf: ben) equals: 9.
	self assert: (aGame lapOf: ben) equals: 1
]
