"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Here there are the tests that evaluates Board behaviour""
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	aGame:		<Object>
	albert:		<Object>
	diceOne:		<Object>
	diceTwo:		<Object>
	robert:		<Object>


    Implementation Points
"
Class {
	#name : #TableroTest,
	#superclass : #TestCase,
	#instVars : [
		'albert',
		'robert',
		'aGame',
		'diceOne',
		'diceTwo',
		'slotBombaAtomica',
		'slotWormHole',
		'slotVacio',
		'slotMoonWalk',
		'slotSpeedUp',
		'slotTimeMachine'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
TableroTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	| typeOfSlots |
	slotBombaAtomica := BombaAtomica withProbability.
	slotWormHole := WormHole withProbability. 
	slotVacio := Vacio withProbability.
	slotMoonWalk := MoonWalk withProbability.
	slotSpeedUp := SpeedUp withProbability.
	slotTimeMachine := TimeMachine withProbability.
	typeOfSlots := OrderedCollection with: slotBombaAtomica with: slotWormHole with: slotVacio with: slotMoonWalk with: slotSpeedUp with:  slotTimeMachine.
]

{ #category : #tests }
TableroTest >> testSlots [
	self assert: slotBombaAtomica probability  equals: 2.
	
	
]
