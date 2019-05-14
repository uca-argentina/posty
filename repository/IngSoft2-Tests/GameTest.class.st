"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Test game behavior ""
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
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testAfterAPlayerPlaysTwoTimesPositionIncrease [
	| aDice jack ben aGame players |
	aDice := SameFaceDice withFaces: 4.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	self assert: (aGame positionOf: jack) equals: 8.
	self assert: (aGame lapOf: jack) equals: 1.
	self assert: (aGame positionOf: ben) equals: 4.
	self assert: (aGame lapOf: ben) equals: 1.
]

{ #category : #tests }
GameTest >> testAfterJackPlaysItsBenTurn [
	| aDice jack ben aGame players |
	aDice := SameFaceDice withFaces: 4.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: aDice.
	self assert: aGame actualTurn equals: 2.
]

{ #category : #tests }
GameTest >> testJackAndBenArePlayersOfTheGame [
	| jack ben aGame players |
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	self assert:  ( aGame player at: 1) name equals: 'Jack'.
	self assert:  ( aGame player at: 2) name equals: 'Ben'
]

{ #category : #tests }
GameTest >> testJackGoesFirstThenBen [
	| jack ben aGame players |
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers: players.
	self assert: ( aGame listOfTurns at: 1) name equals: 'Jack'.
	self assert: ( aGame listOfTurns at: 2) name equals: 'Ben'.
]

{ #category : #tests }
GameTest >> testJackPlaysAndChangePosition [
	| aDice jack ben aGame players |
	aDice := SameFaceDice withFaces: 4.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: aDice.
	self assert: (aGame positionOf: jack) equals: 4.
	self assert: (aGame lapOf: jack) equals: 1.
]

{ #category : #tests }
GameTest >> testJackReachsFinalLapAndGameEnds [
	| diceOne diceTwo jack ben aGame players |
	diceOne := SameFaceDice withFaces: 8.
	diceTwo := SameFaceDice withFaces: 4.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 2  withPlayers:  players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	self assert: aGame isOver.
]

{ #category : #tests }
GameTest >> testLapsOfAGame [
	| jack ben aGame players |
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5 withPlayers: players.
	self assert: aGame laps equals: 5.
]

{ #category : #tests }
GameTest >> testLastPositionOfJack [
	| aDice jack ben aGame players |
	aDice := SameFaceDice withFaces: 4.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	self assert: (aGame lastPositionOf: jack ) equals: 4.
	self assert: (aGame lastLapOf: jack) equals: 1.
]

{ #category : #tests }
GameTest >> testNoOneCanPlayAfterGameIsOver [
	| diceOne diceTwo jack ben aGame players |
	diceOne := SameFaceDice withFaces: 8.
	diceTwo := SameFaceDice withFaces: 4.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 2  withPlayers:  players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	self should: [ aGame newTurnWithDice: diceOne ] raise: Error.
]

{ #category : #tests }
GameTest >> testPlayerCompletesALap [
	| aDice jack ben aGame players |
	aDice := SameFaceDice withFaces: 4.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	aGame newTurnWithDice: aDice.
	self assert: (aGame positionOf: jack )equals: 2.
	self assert: (aGame lapOf: jack) equals: 2.
]

{ #category : #tests }
GameTest >> testPlayerPlaysWithDifferentDices [
	| diceOne diceTwo jack ben aGame players |
	diceOne := SameFaceDice withFaces: 5.
	diceTwo := SameFaceDice withFaces: 7.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5 withPlayers: players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	self assert: (aGame positionOf: jack) equals: 9.
	self assert: (aGame lapOf: jack) equals: 2
]

{ #category : #tests }
GameTest >> testStepsOfAGame [
	| jack ben aGame players |
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers: players.
	self assert: aGame steps equals: 10. 
]

{ #category : #tests }
GameTest >> testTheRankingOfTheGame [
	| diceOne diceTwo jack ben louis aGame players |
	diceOne := SameFaceDice withFaces: 5.
	diceTwo := SameFaceDice withFaces: 6.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	louis := Player called: 'Louis'.
	players := OrderedCollection with: jack with: ben with: louis.
	aGame := Game withSteps: 10 withLaps: 5  withPlayers:  players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceTwo.
	self assert: (aGame ranking at: 1) equals: ben.
	self assert: (aGame ranking at: 2) equals: jack.
	self assert: (aGame ranking at: 3) equals: louis
]

{ #category : #tests }
GameTest >> testTheWinnerOfTheGame [
	| diceOne diceTwo jack ben aGame players |
	diceOne := SameFaceDice withFaces: 8.
	diceTwo := SameFaceDice withFaces: 4.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	aGame := Game withSteps: 10 withLaps: 2  withPlayers:  players.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	aGame newTurnWithDice: diceTwo.
	aGame newTurnWithDice: diceOne.
	self assert: aGame winner equals: jack.
]
