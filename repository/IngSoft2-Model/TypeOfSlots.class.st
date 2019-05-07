"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Each boardslot has an affect when the player falls there""
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
	#name : #TypeOfSlots,
	#superclass : #Object,
	#instVars : [
		'probability',
		'slotNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
TypeOfSlots class >> withProbability [
	^ self new
		initializeWithProbability;
		yourself
]

{ #category : #action }
TypeOfSlots >> effect:  aPlayerOrPlayers [

	^ self subclassResponsibility
]

{ #category : #initialization }
TypeOfSlots >> initializeWithProbability [

	probability := 0
]

{ #category : #accessing }
TypeOfSlots >> probability [

	^ probability 
]
