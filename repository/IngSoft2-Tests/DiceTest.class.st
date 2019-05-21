"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Testing dice messages""
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
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testADiceCantHaveLessThanThreeFaces [
	self should: [SameFaceDice withFaces: 3 ]raise: Error.
]

{ #category : #tests }
DiceTest >> testASameFaceDiceReturnsAlwaysTheSameNumber [
	| aDice |
	aDice := SameFaceDice withFaces: 5.
	self assert: aDice roll equals: 5.
]

{ #category : #tests }
DiceTest >> testSixFaceRandomDiceReturnsValuesFromOneToSix [
	| aDice |
	aDice := RandomDice withFaces: 6.
	self assert: ( aDice roll between: 1 and: 6). 
]
