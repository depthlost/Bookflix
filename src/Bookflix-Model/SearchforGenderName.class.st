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
		select:
			[ :gender | (gender name indexOfSubCollection: aName startingAt: 0) ~= 0 ])
		flatCollect: [ :gender | gender books ]
]
