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
	#name : #DiceTest,
	#superclass : #TestCase,
	#instVars : [
		'albert',
		'robert',
		'aGame',
		'aDice'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
DiceTest >> setUp [
	| players|
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert .
	aDice := RandomDice withFaces: 4.
	aGame := Game withStepsPerLap: 5 withNumberOfLaps: 2 withPlayers: players.
]

{ #category : #tests }
DiceTest >> testAPlayerCalledAlbertRollsARandomDiceWith4Faces [
	albert plays: aGame with: aDice.
	self assert: (albert position between: 1 and: 4)
]

{ #category : #tests }
DiceTest >> testAPlayerCalledRobertRollsARandomDiceWith4Faces [
	albert plays: aGame with: aDice.
	self assert: (albert position between: 1 and: 4)
]

{ #category : #tests }
DiceTest >> testDiceCantHaveLessThanFourFaces [
	self should: [ Dice withFaces: 3 ] raise: Error.
	self should: [ Dice withFaces: 0 ] raise: Error.
	self should: [ Dice withFaces: -1 ] raise: Error
]

{ #category : #tests }
DiceTest >> testDiceRollsAndReturnsAValidNumber [
	| fourFaceDice |
	fourFaceDice := RandomDice withFaces: 4.
	self assert: (fourFaceDice roll between: 1 and:  4)
]

{ #category : #tests }
DiceTest >> testFourFaceDiceHasFourFaces [
	| fourFaceDice |
	fourFaceDice := Dice withFaces: 4.
	self assert: fourFaceDice numberOfFaces equals: 4
]
