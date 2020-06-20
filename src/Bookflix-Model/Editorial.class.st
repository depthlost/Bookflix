Class {
	#name : #Editorial,
	#superclass : #Searchable,
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Editorial class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Editorial class >> name: aString [
	^ self new name: aString
]

{ #category : #initialization }
Editorial >> initialize [
	super initialize.
	name := 'anonima'
]
