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
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoxTest >> testAtomicBomb [
	| diceOne diceTwo jack ben aGame players atomicBomb |
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 6.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	atomicBomb := AtomicBomb withProbability: 2.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	self assert: jack position equals: 4.
	self assert: ben position equals: 6.
	atomicBomb effectOn: aGame.
	self assert: (aGame positionOf: jack) equals: 0.
	self assert: (aGame positionOf: ben) equals: 0.
	
	
]

{ #category : #tests }
BoxTest >> testMoonWalk [
	| diceOne diceTwo jack ben aGame players moonWalk |
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 6.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	moonWalk := Moonwalk withProbability: 5.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	self assert: (aGame positionOf: jack) equals: 2.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2.
	moonWalk effectOn: aGame.
	self assert: (aGame positionOf: jack) equals: 2.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 9.
	self assert: (aGame lapOf: ben) equals: 1.
	
]

{ #category : #tests }
BoxTest >> testSpeedUp [
	| diceOne diceTwo jack ben aGame players speedUp |
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 6.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	speedUp := SpeedUp withProbability: 15.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	self assert: (aGame positionOf: jack) equals: 2.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2.
	speedUp effectOn: aGame.
	self assert: (aGame positionOf: jack) equals: 6.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2.
]

{ #category : #tests }
BoxTest >> testTimeMachine [
	| diceOne diceTwo jack ben aGame players timeMachine |
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 6.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	timeMachine := TimeMachine withProbability: 8.
	aGame := Game withSteps: 10 withLaps: 5 withPlayers: players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	self assert: (aGame positionOf: jack) equals: 2.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2.
	timeMachine effectOn: aGame.
	self assert: (aGame positionOf: jack) equals: 4.
	self assert: (aGame lapOf: jack) equals: 1.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2
]

{ #category : #tests }
BoxTest >> testVacio [
	| diceOne diceTwo jack ben aGame players vacio |
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 6.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	vacio := Vacio withProbability: 55.
	aGame := Game withSteps: 10 withLaps: 5 withPlayers: players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	self assert: (aGame positionOf: jack) equals: 2.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2.
	vacio effectOn: aGame.
	self assert: (aGame positionOf: jack) equals: 2.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2
]

{ #category : #tests }
BoxTest >> testWormHole [
	| diceOne diceTwo jack ben aGame players wormHole |
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 6.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	wormHole := WormHole withProbability: 15.
	aGame := Game withSteps: 10 withLaps: 5 withPlayers: players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	self assert: (aGame positionOf: jack) equals: 2.
	self assert: (aGame lapOf: jack) equals: 2.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2.
	wormHole effectOn: aGame.
	self assert: (aGame positionOf: jack) equals: 8.
	self assert: (aGame lapOf: jack) equals: 1.
	self assert: (aGame positionOf: ben) equals: 8.
	self assert: (aGame lapOf: ben) equals: 2
]

{ #category : #tests }
BoxTest >> testWormHoleNegativeLap [
	| diceOne diceTwo jack ben aGame players wormHole |
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 6.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	wormHole := WormHole withProbability: 15.
	aGame := Game withSteps: 10 withLaps: 5 withPlayers: players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	(aGame player at: 1) move: 2.
	self assert: (aGame positionOf: jack) equals: 2.
	self assert: (aGame lapOf: jack) equals: 1.
	self assert: (aGame positionOf: ben) equals: 6.
	self assert: (aGame lapOf: ben) equals: 1.
	wormHole effectOn: aGame.
	self assert: (aGame positionOf: jack) equals: 8.
	self assert: (aGame lapOf: jack) equals: -1.
	self assert: (aGame positionOf: ben) equals: 6.
	self assert: (aGame lapOf: ben) equals: 1
]
