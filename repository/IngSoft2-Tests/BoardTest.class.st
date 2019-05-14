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
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testBoardDistributionOfBoxes [
	| aBoard atomicBomb vacio speedUp wormHole timeMachine moonWalk listOfEffects |
	atomicBomb := AtomicBomb withProbability: 2.
	vacio := Vacio withProbability: 55.
	speedUp := SpeedUp withProbability: 15.
	wormHole := WormHole withProbability: 15.
	timeMachine := TimeMachine withProbability: 8.
	moonWalk := Moonwalk withProbability: 5.
	listOfEffects := OrderedCollection with: atomicBomb with: vacio with: speedUp with: wormHole with: timeMachine with: moonWalk.
	aBoard := Board withSteps: 100 with: listOfEffects.
	
	
]
