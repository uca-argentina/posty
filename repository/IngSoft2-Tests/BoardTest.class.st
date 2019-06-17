"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Testing board creation acording to probability ""
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
	#name : #BoardTest,
	#superclass : #TestCase,
	#instVars : [
		'empty',
		'moonwalk',
		'atomicbomb',
		'speedup',
		'boxes',
		'aBoard',
		'timemachine',
		'atomicBomb',
		'effectOne',
		'moonWalk',
		'effectTwo',
		'speedUp',
		'effectThree',
		'timeMachine',
		'effectFour',
		'effectFive',
		'wormHole',
		'effectSix',
		'pickCard',
		'effectSeven'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
BoardTest >> setUp [
	super setUp.
	atomicBomb := AtomicBombEffect new.
	moonWalk := MoonwalkEffect numberOfStepsBack: 6.
	speedUp := SpeedUpEffect new.
	timeMachine := TimeMachineEffect new.
	empty := EmptyEffect new.
	wormHole := WormHoleEffect new.
	pickCard := Cards new.
	effectOne := BoxWithProbability effect: atomicBomb  withProbability: 0.02.
	effectTwo := BoxWithProbability effect: moonWalk withProbability: 0.05.
	effectThree := BoxWithProbability effect: speedUp  withProbability: 0.15.
	effectFour := BoxWithProbability effect: timeMachine  withProbability: 0.08.
	effectFive := BoxWithProbability effect: empty  withProbability: 0.45.
	effectSix := BoxWithProbability effect: wormHole  withProbability: 0.15.
	effectSeven := BoxWithProbability effect: pickCard withProbability: 0.10.
	boxes := OrderedCollection with: effectOne with: effectTwo with: effectThree with: effectFour with: effectFive with: effectSix.
	boxes add: effectSeven.
	aBoard:= Board with: boxes.
]

{ #category : #tests }
BoardTest >> testAmountOfBoxes [
	self assert: aBoard amountOfBoxes equals: 7.
	
]

{ #category : #tests }
BoardTest >> testCreateABoardWithAnAmountOfBoxes [
	| listOfBoxes |
	listOfBoxes := BoardCreator with: boxes size: 15.
	listOfBoxes createBoard.
	self assert: listOfBoxes amountOfBoxes equals: 15.
]
