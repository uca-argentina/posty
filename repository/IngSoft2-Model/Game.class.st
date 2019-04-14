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
		'stepsToWin',
		'numberOfStepsToWin',
		'listOfPlayers',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Game class >> WithStepsToWin: aNumberOfStepsToWin andPlayers: aNumberOfplayers [
	^ self new
		initializeWithStepsToWin: aNumberOfStepsToWin
			and: aNumberOfplayers;
		
		yourself
]

{ #category : #initialize }
Game >> initializeWithStepsToWin: aNumberOfStepsToWin and: aListOfPlayers [
	numberOfStepsToWin := aNumberOfStepsToWin .
	listOfPlayers := aListOfPlayers  .
	position := 0.
]

{ #category : #actions }
Game >> isOver [
	^ listOfPlayers contains: [ :p | ((p position) ) ==  numberOfStepsToWin ]
]

{ #category : #description }
Game >> players [
	^ listOfPlayers 
]

{ #category : #description }
Game >> stepsToWin [
	^ numberOfStepsToWin
]

{ #category : #actions }
Game >> winner [
	^ listOfPlayers detect:  [ :p | p position == numberOfStepsToWin ]
]
