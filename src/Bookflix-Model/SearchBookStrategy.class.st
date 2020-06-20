Class {
	#name : #SearchBookStrategy,
	#superclass : #Object,
	#category : #'Bookflix-Model'
}

{ #category : #accessing }
SearchBookStrategy >> finder: aName [
	^ self subclassResponsibility
]
