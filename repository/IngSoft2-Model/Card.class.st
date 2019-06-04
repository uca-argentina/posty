Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Card >> effectOn: aGame [ 
	aGame addCardToPlayer: (aGame currentPlayer)
]
