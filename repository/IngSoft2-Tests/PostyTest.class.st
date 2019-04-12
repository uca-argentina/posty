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
	| player |
	player := Player call: 'Robert'.
	self assert: player name equals: 'Robert'
]

{ #category : #tests }
PostyTest >> testAPlayerCalledRobertRollsADiceWith4Faces [
	| player |
	player := Player call: 'Robert'.
	self assert: (player takeADiceWithFacesAndPlays: 4)equals: 2
]

{ #category : #tests }
PostyTest >> testBoardHas5StepsAndIsPlayableBy5Players [
	| board |
	board := Board WithStepsToWin: 5 andPlayers: 5.
	self assert: board stepsToWin equals: 5.
	self assert: board players equals: 5
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
	self assert: fourFaceDice roll > 1.
	self assert: fourFaceDice roll <= 4
]

{ #category : #tests }
PostyTest >> testFourFaceDiceHasFourFaces [
	| fourFaceDice |
	fourFaceDice := Dice withFaces: 4.
	self assert: fourFaceDice numberOfFaces equals: 4
]

{ #category : #tests }
PostyTest >> testIfIGetAFourIMoveFourBlocks [
	| fourFaceDice player |
	fourFaceDice := SameFaceDice withFaces: 4.
	player := Player call: 'Robert'.
	player move: fourFaceDice roll.
	self assert: player position equals: 4
]

{ #category : #tests }
PostyTest >> testInitialPositionOfRobertIsZero [
	| player |
	player := Player call: 'Robert'.
	self assert: player position equals: 0
]
