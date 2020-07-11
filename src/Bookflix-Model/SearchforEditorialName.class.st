Class {
	#name : #SearchforEditorialName,
	#superclass : #SearchBookStrategy,
	#category : #'Bookflix-Model'
}

{ #category : #converting }
SearchforEditorialName >> asString [
	^ 'Editorial'
]

{ #category : #accessing }
SearchforEditorialName >> finder: aName [
	^ (Bookflix instance getAllEditorials
		select: [ :editorial | editorial name includesSubstring: aName ])
		flatCollect: [ :editorial | editorial books ]
]
