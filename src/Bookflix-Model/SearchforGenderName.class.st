Class {
	#name : #SearchforGenderName,
	#superclass : #SearchBookStrategy,
	#category : #'Bookflix-Model'
}

{ #category : #converting }
SearchforGenderName >> asString [
	^ 'Genero'
]

{ #category : #accessing }
SearchforGenderName >> finder: aName [
	^ (Bookflix instance getAllGenders
		select: [ :gender | gender name includesSubstring: aName ])
		flatCollect: [ :gender | gender books ]
]
