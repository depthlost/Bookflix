Class {
	#name : #SearchforBookName,
	#superclass : #SearchBookStrategy,
	#category : #'Bookflix-Model'
}

{ #category : #converting }
SearchforBookName >> asString [
	^ 'Titulo'
]

{ #category : #accessing }
SearchforBookName >> finder: aName [
	^ Bookflix instance getAllBooks
		select: [ :book | book name includesSubstring: aName ]
]
