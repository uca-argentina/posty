"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Here we have the tests""
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
	#name : #PostyTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PostyTest >> testAPlayerCalledAlbertRollsARandomDiceWith4Faces [
	| albert robert aGame aDice players|
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert .
	aDice := RandomDice withFaces: 4.
	aGame := Game WithStepsToWin: 5 withPlayers: players.
	albert plays: aGame with: aDice.
	self assert: (albert position between: 1 and: 4)
]

{ #category : #tests }
PostyTest >> testAPlayerCalledRobert [
	| player  |
	player := Player called: 'Robert'.
	self assert: player name equals: 'Robert'
]

{ #category : #tests }
PostyTest >> testAPlayerCalledRobertRollsARandomDiceWith4Faces [
	| albert robert aGame aDice players|
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert .
	aDice := RandomDice withFaces: 4.
	aGame := Game WithStepsToWin: 5 withPlayers: players.
	albert plays: aGame with: aDice.
	self assert: (albert position between: 1 and: 4)
]

{ #category : #tests }
PostyTest >> testAfterAGameHasEndedNoOneCouldPlay [
	| aGame albert robert diceOne diceTwo players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 5.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game WithStepsToWin: 8 withPlayers: players.
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	self should: [ robert plays: aGame with: diceTwo ] raise: Error.
	self should: [ albert plays: aGame with: diceTwo ] raise: Error.
]

{ #category : #tests }
PostyTest >> testAfterAlbertPlaysItsRobertTurn [
	| albert robert aGame aDice players|
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert .
	aDice := SameFaceDice withFaces: 4.
	aGame := Game WithStepsToWin: 5 withPlayers: players.
	albert plays: aGame with: aDice.
	self assert: robert turn equals: aGame actualTurn.
]

{ #category : #tests }
PostyTest >> testBoardHas5StepsAndIsPlayableBy2Players [
	| aGame albert robert players|
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game WithStepsToWin: 5 withPlayers: players.
	self assert: aGame stepsToWin equals: 5.
	self assert: (aGame players size) equals: 2
]

{ #category : #tests }
PostyTest >> testDiceCantHaveLessThanFourFaces [
	self should: [ Dice withFaces: 3 ] raise: Error.
	self should: [ Dice withFaces: 0 ] raise: Error.
	self should: [ Dice withFaces: -1 ] raise: Error
]

{ #category : #tests }
PostyTest >> testDiceRollsAndReturnsAValidNumber [
	| fourFaceDice |
	fourFaceDice := RandomDice withFaces: 4.
	self assert: (fourFaceDice roll between: 1 and:  4)
]

{ #category : #tests }
PostyTest >> testFourFaceDiceHasFourFaces [
	| fourFaceDice |
	fourFaceDice := Dice withFaces: 4.
	self assert: fourFaceDice numberOfFaces equals: 4
]

{ #category : #tests }
PostyTest >> testGameIsOverFalse [
	| aGame albert robert diceOne diceTwo players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 5.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game WithStepsToWin: 8 withPlayers: players.
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	self assert: aGame isOver equals: false
]

{ #category : #tests }
PostyTest >> testGameIsOverTrue [
	| aGame albert robert diceOne diceTwo players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 5.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game WithStepsToWin: 8 withPlayers: players.
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	self assert: aGame isOver equals: true
]

{ #category : #tests }
PostyTest >> testIfIGetAFourIMoveFourBlocks [
	| albert robert aGame fourFaceDice players|
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert .
	fourFaceDice := SameFaceDice withFaces: 4.
	aGame := Game WithStepsToWin: 5 withPlayers: players.
	albert plays: aGame with: fourFaceDice .
	self assert: albert position equals: 4
]

{ #category : #tests }
PostyTest >> testIfIRollTwoTimesASameFaceDiceMyPositionIncrease [
	| aGame albert robert diceOne players |
	diceOne := SameFaceDice withFaces: 6.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game WithStepsToWin: 8 withPlayers: players.
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceOne.
	albert plays: aGame with: diceOne .
	self assert: albert position equals: 8
]

{ #category : #tests }
PostyTest >> testIfPlayerReachTheFinalPositionWinsTheGame [
	| albert aDice aGame robert players |
	aDice := SameFaceDice withFaces: 6.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game WithStepsToWin: 8 withPlayers: players.
	albert plays: aGame with: aDice.
	robert plays: aGame with: aDice.
	albert plays: aGame  with: aDice.
	self assert: albert position equals: aGame stepsToWin
]

{ #category : #tests }
PostyTest >> testInThisTurnThePositionOfRobertIsFourAndAlbertIsEigth [
	| aGame albert robert diceOne diceTwo players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 5.
	albert := Player called: 'albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection new: 2.
	players add: albert.
	players add: robert.
	aGame := Game WithStepsToWin: 10 withPlayers: players.
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceTwo.
	self assert: (aGame players at: 1) position equals: 8.
	self assert: (aGame players at: 2) position equals: 4
]

{ #category : #tests }
PostyTest >> testInitialPositionOfRobertIsZero [
	| robert |
	robert := Player called: 'Robert'.
	self assert: robert position equals: 0
]

{ #category : #tests }
PostyTest >> testItsNotAlbertTurn [
	| albert robert aGame aDice players|
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert .
	aDice := SameFaceDice withFaces: 4.
	aGame := Game WithStepsToWin: 5 withPlayers: players.
	albert plays: aGame with: aDice.
	self should: [ albert plays: aGame with: aDice  ] raise: Error
]

{ #category : #tests }
PostyTest >> testTheOrderInTurnsIsAlbertFirstRobertSecond [
	| albert robert aGame players|
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert .
	aGame := Game WithStepsToWin: 5 withPlayers: players.
	self assert: albert turn equals: 1.
	self assert: robert turn equals: 2.
]

{ #category : #tests }
PostyTest >> testTheWinnerOfTheGameIsAlbert [
	| aGame albert robert diceOne diceTwo players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 5.
	albert := Player called: 'albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game WithStepsToWin: 8 withPlayers: players.
	albert plays: aGame with: diceOne.
	robert plays: aGame with: diceTwo.
	albert plays: aGame with: diceOne.
	self assert: aGame winner name equals: 'albert'
]
