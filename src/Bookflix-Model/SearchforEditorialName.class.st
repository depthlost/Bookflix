Class {
	#name : #SearchforEditorialName,
	#superclass : #SearchBookStrategy,
	#category : #'Bookflix-Model'
}

{ #category : #accessing }
SearchforEditorialName >> finder: aName [
	^ (Bookflix instance getAllEditorials
		select: [ :editorial | editorial name includesSubstring: aName ])
		flatCollect: [ :editorial | editorial books ]
]
