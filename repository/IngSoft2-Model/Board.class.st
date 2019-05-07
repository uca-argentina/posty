"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Set of slots with effects, where players play""
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
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'numberOfSlots',
		'typeOfSlots'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Board class >> initializeWithNumberOfSlots: aNumberOfSlotsPerBoard withTypeOfSlots: aListOfSlots [
	^ self new
			initializeWithNumberOfSlots: aNumberOfSlotsPerBoard 
			withTypeOfSlots: aListOfSlots;
		yourself
]

{ #category : #initialization }
Board >> initializeWithNumberOfSlots: aNumberOfSlotsPerBoard withTypeOfSlots: aListOfSlots [

	1 to: aNumberOfSlotsPerBoard do: [ :x | x + 1 ]
]
