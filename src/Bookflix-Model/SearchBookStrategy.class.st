Class {
	#name : #SearchBookStrategy,
	#superclass : #Object,
	#category : #'Bookflix-Model'
}

{ #category : #converting }
SearchBookStrategy >> asString [
	^ 'SearchBookStrategy'
]

{ #category : #accessing }
SearchBookStrategy >> finder: aName [
	^ self subclassResponsibility
]
