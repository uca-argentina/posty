"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

""Im the board game""
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
	numberOfPlayers:		<Object>
	numberOfStepsToWin:		<Object>
	position:		<Object>
	stepsToWin:		<Object>


    Implementation Points
"
Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'numberOfStepsToWin',
		'listOfPlayers',
		'turn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Game class >> WithStepsToWin: aNumberOfStepsToWin withPlayers: aNumberOfplayers [
	^ self new
		initializeWithStepsToWin: aNumberOfStepsToWin
			with: aNumberOfplayers;
		yourself
]

{ #category : #description }
Game >> actualTurn [
	^ turn 
]

{ #category : #initialize }
Game >> initializeWithStepsToWin: aNumberOfStepsToWin with: aListOfPlayers [
	numberOfStepsToWin := aNumberOfStepsToWin .
	listOfPlayers := aListOfPlayers  .
	turn := 1.
	self start.
]

{ #category : #actions }
Game >> isOver [
	^ listOfPlayers anySatisfy: [ :player | player position =  numberOfStepsToWin ]
]

{ #category : #actions }
Game >> nextTurn: aNumber [
	turn := aNumber.
]

{ #category : #description }
Game >> numberOfPlayers [
	^ listOfPlayers size .
]

{ #category : #description }
Game >> players [
	^ listOfPlayers 
]

{ #category : #accessing }
Game >> start [ 
	| turns |
	turns := 1 to: (listOfPlayers size).
	listOfPlayers with: turns do: [ :player :number | player assignTurn: number ]
]

{ #category : #description }
Game >> stepsToWin [
	^ numberOfStepsToWin
]

{ #category : #actions }
Game >> winner [
	^ listOfPlayers detect:  [ :player | player position = numberOfStepsToWin ]
]
