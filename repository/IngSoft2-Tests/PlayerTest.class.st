"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Here there are the tests that evaluates player behaviour""
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
	#name : #PlayerTest,
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
PlayerTest >> setUp [
	| players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 4.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game withStepsPerLap: 5 withNumberOfLaps: 3 withPlayers: players.
]

{ #category : #tests }
PlayerTest >> testAPlayerCalledRobert [
	| player |
	player := Player called: 'Robert'.
	self assert: player name equals: 'Robert'
]

{ #category : #tests }
PlayerTest >> testAfterAlbertPlaysItsRobertTurn [
	albert plays: aGame with: diceOne.
	self assert: robert turn equals: aGame actualTurn.
]

{ #category : #tests }
PlayerTest >> testIfIGetAFourIMoveFourBlocks [
	albert plays: aGame with: diceTwo  .
	self assert: albert position equals: 5
]

{ #category : #tests }
PlayerTest >> testIfIRollTwoTimesASameFaceDiceMyPositionIncrease [
	albert plays: aGame with: diceTwo.
	robert plays: aGame with: diceTwo .
	albert plays: aGame with: diceTwo.
	self assert: albert position equals: 4
]

{ #category : #tests }
PlayerTest >> testInThisTurnThePositionOfRobertIsFourAndAlbertIsEigth [
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	self assert: (aGame players at: 1) lapNumber equals: 2.
	self assert: (aGame players at: 2) position equals: 5
]

{ #category : #tests }
PlayerTest >> testInitialPositionOfRobertIsZero [
	robert := Player called: 'Robert'.
	self assert: robert position equals: 1
]

{ #category : #tests }
PlayerTest >> testItsNotAlbertTurn [
	albert plays: aGame with: diceOne.
	self should: [ albert plays: aGame with: diceOne  ] raise: Error
]

{ #category : #tests }
PlayerTest >> testTheOrderInTurnsIsAlbertFirstRobertSecond [
	self assert: albert turn equals: 1.
	self assert: robert turn equals: 2.
]
