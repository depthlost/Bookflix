Class {
	#name : #SearchBookStrategy,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Bookflix-Model'
}

{ #category : #singleton }
SearchBookStrategy class >> clearInstance [
	instance := nil
]

{ #category : #accessing }
SearchBookStrategy class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #converting }
SearchBookStrategy >> asString [
	^ 'SearchBookStrategy'
]

{ #category : #accessing }
SearchBookStrategy >> finder: aName [
	^ self subclassResponsibility
]
