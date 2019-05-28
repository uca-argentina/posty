"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".
""Testing card behaviour""
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
	#name : #CardTest,
	#superclass : #TestCase,
	#instVars : [
		'overload',
		'speed',
		'acceleration',
		'cancellation',
		'redo',
		'repeat',
		'cardOne',
		'cardTwo',
		'cardThree',
		'cardFour',
		'cardFive',
		'cardSix',
		'cardsEffects',
		'deckOfCards'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CardTest >> setUp [
	super setUp.
	overload := OverLoad new.
	speed := SpeedCard new.
	acceleration := Acceleration new.
	cancellation := Cancellation new.
	redo := Redo new.
	repeat := Repeat new.
	cardOne := BoxWithProbability effect: overload  withProbability: 0.166.
	cardTwo := BoxWithProbability effect: speed withProbability: 0.166.
	cardThree := BoxWithProbability effect: acceleration  withProbability: 0.166.
	cardFour := BoxWithProbability effect: cancellation  withProbability: 0.166.
	cardFive := BoxWithProbability effect: redo  withProbability: 0.166.
	cardSix := BoxWithProbability effect: repeat  withProbability: 0.17.
	cardsEffects := OrderedCollection with: cardOne with: cardTwo with: cardThree with: cardFour with: cardFive with: cardSix.
	deckOfCards := BoardCreator with: cardsEffects size: 50.
]
