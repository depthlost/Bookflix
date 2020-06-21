Class {
	#name : #SearchforAuthorName,
	#superclass : #SearchBookStrategy,
	#category : #'Bookflix-Model'
}

{ #category : #accessing }
SearchforAuthorName >> finder: aName [
	^ (Bookflix instance getAllAuthors
		select: [ :author | author name includesSubstring: aName ])
		flatCollect: [ :author | author books ]
]
