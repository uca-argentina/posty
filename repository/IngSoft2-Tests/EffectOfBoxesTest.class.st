"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Here we test the different effects""
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
	aGame:		<Object>
	albert:		<Object>
	diceOne:		<Object>
	diceTwo:		<Object>
	robert:		<Object>


    Implementation Points
"
Class {
	#name : #EffectOfBoxesTest,
	#superclass : #TestCase,
	#instVars : [
		'albert',
		'robert',
		'aGame',
		'diceOne',
		'diceTwo'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
EffectOfBoxesTest >> setUp [
	| players |
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 4.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game withSteps: 5 withLaps: 2 withPlayers: players.
	aGame board = aGame createDeterminatedBoard  
]

{ #category : #tests }
EffectOfBoxesTest >> testAtomicBombEffect [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := AtomicBomb create.
	aBox effect: aGame.
	self assert: albert position equals: 0.
]

{ #category : #tests }
EffectOfBoxesTest >> testMoonWalkEffect [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := MoonWalk  create.
	aBox effect: aGame.
	self assert: albert position equals: 2.
]

{ #category : #tests }
EffectOfBoxesTest >> testSpeedUpEffect [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := SpeedUp  create.
	aBox effect: aGame.
	self assert: albert position equals: 8.
]

{ #category : #tests }
EffectOfBoxesTest >> testTimeMachineReturnAPlayerToItsLastPosition [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := TimeMachine create.
	aBox effect: aGame.
	self assert: albert position equals: 4.
	
]

{ #category : #tests }
EffectOfBoxesTest >> testVacioHasNotAnEspecialEffect [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := Empty create.
	aBox effect: aGame.
	self assert: albert position equals: 4.
]

{ #category : #tests }
EffectOfBoxesTest >> testWhormHoleMovesFourBoxesBack [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := WormHole create.
	aBox effect: aGame.
	self assert: albert position equals: 0.
]
