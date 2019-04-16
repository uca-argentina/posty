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
PostyTest >> testAPlayerCalledRobert [
	| player aDice|
	aDice := RandomDice withFaces: 4.
	player := Player call: 'Robert' with: aDice.
	self assert: player name equals: 'Robert'
]

{ #category : #tests }
PostyTest >> testAPlayerCalledRobertRollsARandomDiceWith4Faces [
	| robert aDice|
	aDice := RandomDice withFaces: 4.
	robert := Player call: 'Robert' with: aDice.
	robert plays.
	self assert: (robert position between: 1 and: 4).
]

{ #category : #tests }
PostyTest >> testBoardHas5StepsAndIsPlayableBy5Players [
	| aGame |
	aGame := Game WithStepsToWin: 5 andPlayers: 5.
	self assert: aGame stepsToWin equals: 5.
	self assert: aGame players equals: 5
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
	self assert: fourFaceDice roll >= 1.
	self assert: fourFaceDice roll <= 4
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
	albert := Player call: 'albert' with: diceOne.
	robert := Player call: 'Robert' with: diceTwo.
	players := OrderedCollection new: 2.
	players add: albert.
	players add: robert.
	aGame := Game WithStepsToWin: 8 andPlayers: players.
	albert plays.
	robert plays.
	self assert: (aGame isOver) equals: false.
]

{ #category : #tests }
PostyTest >> testGameIsOverTrue [
	| aGame albert robert diceOne diceTwo players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 5.
	albert := Player call: 'albert' with: diceOne.
	robert := Player call: 'Robert' with: diceTwo.
	players := OrderedCollection new: 2.
	players add: albert.
	players add: robert.
	aGame := Game WithStepsToWin: 8 andPlayers: players.
	albert plays.
	albert plays.
	robert plays.
	self assert: (aGame isOver) equals: true.
]

{ #category : #tests }
PostyTest >> testIfIGetAFourIMoveFourBlocks [
	| fourFaceDice robert |
	fourFaceDice := SameFaceDice withFaces: 4.
	robert := Player call: 'Robert' with: fourFaceDice .
	robert plays.
	self assert: robert position equals: 4
]

{ #category : #tests }
PostyTest >> testIfIRollTwoTimesASameFaceDiceMyPositionIncrease [
	| robert aDice |
	aDice := SameFaceDice withFaces: 4.
	robert := Player call: 'Robert' with: aDice.
	robert plays. 
	robert plays. 
	self assert: (robert position ) equals: 8.
]

{ #category : #tests }
PostyTest >> testIfPlayerReachTheFinalPositionWinsTheGame [
	| albert aDice aBoard |
	aDice := SameFaceDice withFaces: 6.
	albert := Player call: 'Albert' with: aDice.
	aBoard := Game WithStepsToWin: 8 andPlayers: albert.
	albert plays.
	albert plays.
	self assert: (albert position)  equals: (aBoard stepsToWin ).
]

{ #category : #tests }
PostyTest >> testInThisTurnThePositionOfRobertIsFourAndAlbertIsEigth [
	| aGame albert robert diceOne diceTwo players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 5.
	albert := Player call: 'albert' with: diceOne.
	robert := Player call: 'Robert' with: diceTwo.
	players := OrderedCollection new: 2.
	players add: albert.
	players add: robert.
	aGame := Game WithStepsToWin: 10 andPlayers: players.
	albert plays.
	albert plays.
	robert plays.
	self assert: ((aGame players at: 1) position ) equals: 8.
	self assert: ((aGame players at: 2) position ) equals: 4.
]

{ #category : #tests }
PostyTest >> testInitialPositionOfRobertIsZero [
	| robert aDice|
	aDice := RandomDice withFaces: 4.
	robert := Player call: 'Robert' with: aDice.
	self assert: robert position equals: 0
]

{ #category : #tests }
PostyTest >> testTheWinnerOfTheGameIsAlbert [
	| aGame albert robert diceOne diceTwo players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 5.
	albert := Player call: 'albert' with: diceOne.
	robert := Player call: 'Robert' with: diceTwo.
	players := OrderedCollection new: 2.
	players add: albert.
	players add: robert.
	aGame := Game WithStepsToWin: 8 andPlayers: players.
	albert plays.
	albert plays.
	robert plays.
	self assert: (aGame winner) name equals: 'albert'.
]
