"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Here there are the tests that evaluates game behaviour""
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
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'aGame',
		'robert',
		'albert',
		'diceOne',
		'diceTwo'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
GameTest >> setUp [
	| players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 4.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game withSteps: 5 withLaps: 2 withPlayers: players
]

{ #category : #tests }
GameTest >> testAfterAGameHasEndedNoOneCouldPlay [
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	self should: [ robert plays: aGame with: diceTwo ] raise: Error.
	self should: [ albert plays: aGame with: diceTwo ] raise: Error.
]

{ #category : #tests }
GameTest >> testGameHas5StepsAndIsPlayableBy2Players [
	self assert: aGame stepsToWin equals: 10.
	self assert: (aGame players size) equals: 2
]

{ #category : #tests }
GameTest >> testGameIsOverFalse [
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	self assert: aGame isOver equals: false
]

{ #category : #tests }
GameTest >> testGameIsOverTrue [
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	self assert: aGame isOver equals: true
]

{ #category : #tests }
GameTest >> testSpeedUpMovesFourBoxesAhead [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := SpeedUp create.
	aBox effect: aGame.
	self assert: albert position equals: 8.
]

{ #category : #tests }
GameTest >> testTheGameHasTwoLaps [
	self assert: aGame numberOfLaps equals: 2.
]

{ #category : #tests }
GameTest >> testTheWinnerOfTheGameIsAlbert [
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	self assert: aGame winner name equals: 'Albert'
]

{ #category : #tests }
GameTest >> testTimeMachineReturnAPlayerToItsLastPosition [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := TimeMachine create.
	aBox effect: aGame.
	self assert: albert position equals: 0.
	
]

{ #category : #tests }
GameTest >> testVacioHasNotAnEspecialEffect [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := Vacio create.
	aBox effect: aGame.
	self assert: albert position equals: 4.
]

{ #category : #tests }
GameTest >> testWhormHoleMovesFourBoxesBack [
	| aBox |
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	aBox := WormHole create.
	aBox effect: aGame.
	self assert: albert position equals: 0.
]
