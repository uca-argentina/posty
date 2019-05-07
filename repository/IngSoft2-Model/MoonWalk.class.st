"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""The other players go back N slots""
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
	#name : #MoonWalk,
	#superclass : #TypeOfSlots,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
MoonWalk >> effect:  aListOfPlayers [

	|nSlotsToGoBack|
	nSlotsToGoBack:= (1 to: 5) atRandom.
	aListOfPlayers 
	do: [ :player | (player position = self position - nSlotsToGoBack) & (self playerCantReceiveAnotherEffect: player)]
]

{ #category : #initialization }
MoonWalk >> initializeWithProbability [

	probability := 62
]
