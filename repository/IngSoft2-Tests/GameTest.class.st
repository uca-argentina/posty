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
	#instVars : [
		'players',
		'jack',
		'ben',
		'aGame',
		'theGame',
		'louis',
		'threePlayers',
		'empty',
		'moonwalk',
		'atomicbomb',
		'speedup',
		'boxes',
		'aBoard',
		'threePlayerGame',
		'returnsFour',
		'returnsFive',
		'returnsSix',
		'returnsSeven'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
GameTest >> setUp [
	"Players creation"
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	louis := Player called: 'Louis'.
	threePlayers := OrderedCollection with: jack with: ben with: louis.
	"Dice Creation"
	returnsFour := SameFaceDice withFaces: 4.
	returnsFive := SameFaceDice withFaces: 5.
	returnsSix := SameFaceDice withFaces: 6.
	returnsSeven := SameFaceDice withFaces: 7.
	"Board Creation"
	empty := Empty withProbability: 0.55.
	moonwalk := Moonwalk withProbability: 0.15.
	atomicbomb := AtomicBomb withProbability: 0.02.
	speedup := SpeedUp withProbability: 0.15.
	boxes := OrderedCollection with: empty with: speedup with: moonwalk with: atomicbomb with:empty with: moonwalk.
	boxes add: empty.
	boxes add: speedup.
	boxes add: empty.
	boxes add: atomicbomb.
	aBoard := Board with: boxes.
	"Game creation"
	aGame := Game withBoard: aBoard withLaps: 5  withPlayers:  players.
	theGame := Game withBoard: aBoard withLaps: 2  withPlayers:  players.
	threePlayerGame := Game withBoard: aBoard withLaps: 5  withPlayers:  threePlayers.
]

{ #category : #tests }
GameTest >> testAfterAPlayerPlaysTwoTimesPositionIncrease [
	aGame newTurnWithDice: returnsFour.
	aGame newTurnWithDice: returnsSix.
	aGame newTurnWithDice: returnsFive.
	self assert: (aGame positionOf: jack) equals: 6.
	self assert: (aGame lapOf: jack) equals: -1.
	self assert: (aGame positionOf: ben) equals: 7.
	self assert: (aGame lapOf: ben) equals: -1.
]

{ #category : #tests }
GameTest >> testAfterJackPlaysItsBenTurn [
	aGame newTurnWithDice: returnsFour.
	self assert: aGame actualTurn equals: 2.
]

{ #category : #tests }
GameTest >> testJackAndBenArePlayersOfTheGame [
	self assert:  ( aGame player at: 1) name equals: 'Jack'.
	self assert:  ( aGame player at: 2) name equals: 'Ben'
]

{ #category : #tests }
GameTest >> testJackGoesFirstThenBen [
	self assert: ( aGame listOfTurns at: 1) name equals: 'Jack'.
	self assert: ( aGame listOfTurns at: 2) name equals: 'Ben'.
]

{ #category : #tests }
GameTest >> testJackPlaysAndChangePosition [
	aGame newTurnWithDice: returnsFive.
	self assert: (aGame positionOf: jack) equals: 5.
	self assert: (aGame lapOf: jack) equals: 1.
]

{ #category : #tests }
GameTest >> testJackReachsFinalLapAndGameEnds [
	theGame newTurnWithDice: returnsFive.
	theGame newTurnWithDice: returnsSeven.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsSix.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsSix.
	self assert: theGame isOver.
]

{ #category : #tests }
GameTest >> testLapsOfAGame [
	self assert: aGame laps equals: 5.
]

{ #category : #tests }
GameTest >> testLastPositionOfJack [
	aGame newTurnWithDice: returnsFour.
	aGame newTurnWithDice: returnsFour.
	aGame newTurnWithDice: returnsFour.
	aGame newTurnWithDice: returnsFour.
	aGame newTurnWithDice: returnsFour.
	self assert: (aGame lastPositionOf: jack ) equals: 0.
	self assert: (aGame lastLapOf: jack) equals: 1.
]

{ #category : #tests }
GameTest >> testNoOneCanPlayAfterGameIsOver [
	theGame newTurnWithDice: returnsFive.
	theGame newTurnWithDice: returnsSeven.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsSix.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsSix.
	self should: [ theGame newTurnWithDice: returnsFour ] raise: Error.
]

{ #category : #tests }
GameTest >> testPlayerCompletesALap [
	aGame newTurnWithDice: returnsSeven.
	aGame newTurnWithDice: returnsFive.
	aGame newTurnWithDice: returnsFour.
	self assert: (aGame positionOf: jack )equals: 1.
	self assert: (aGame lapOf: jack) equals: 2.
]

{ #category : #tests }
GameTest >> testPlayerPlaysWithDifferentDices [
	aGame newTurnWithDice: returnsFive.
	aGame newTurnWithDice: returnsFour.
	aGame newTurnWithDice: returnsSix.
	aGame newTurnWithDice: returnsFive.
	self assert: (aGame positionOf: jack) equals: 7.
	self assert: (aGame lapOf: jack) equals: -1
]

{ #category : #tests }
GameTest >> testStepsOfAGame [
	self assert: aGame steps equals: 10. 
]

{ #category : #tests }
GameTest >> testTheRankingOfTheGame [
	threePlayerGame newTurnWithDice: returnsFive.
	threePlayerGame newTurnWithDice: returnsSeven.
	threePlayerGame newTurnWithDice: returnsFour.
	threePlayerGame newTurnWithDice: returnsFive.
	threePlayerGame newTurnWithDice: returnsSeven.
	self assert: (threePlayerGame ranking at: 1) equals: ben.
	self assert: (threePlayerGame ranking at: 2) equals: jack.
	self assert: (threePlayerGame ranking at: 3) equals: louis
]

{ #category : #tests }
GameTest >> testTheWinnerOfTheGame [
	theGame newTurnWithDice: returnsFive.
	theGame newTurnWithDice: returnsSeven.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsSix.
	theGame newTurnWithDice: returnsFour.
	theGame newTurnWithDice: returnsSix.
	self assert: theGame winner equals: jack.
]
