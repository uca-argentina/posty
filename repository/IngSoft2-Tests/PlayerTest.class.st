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
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert .
	diceOne := SameFaceDice withFaces: 4.
	diceTwo := SameFaceDice withFaces: 5.
	aGame := Game WithStepsToWin: 5 withPlayers: players.
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
	albert plays: aGame with: diceOne  .
	self assert: albert position equals: 4
]

{ #category : #tests }
PlayerTest >> testIfIRollTwoTimesASameFaceDiceMyPositionIncrease [
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceOne.
	albert plays: aGame with: diceOne.
	self assert: albert position equals: 8
]

{ #category : #tests }
PlayerTest >> testInThisTurnThePositionOfRobertIsFourAndAlbertIsEigth [
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	self assert: (aGame players at: 1) position equals: 8.
	self assert: (aGame players at: 2) position equals: 4
]

{ #category : #tests }
PlayerTest >> testInitialPositionOfRobertIsZero [
	robert := Player called: 'Robert'.
	self assert: robert position equals: 0
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
