Class {
	#name : #Searchable,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Searchable class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Searchable class >> name: aName [
	^ self new name: aName
]

{ #category : #initialization }
Searchable >> initialize [
	name := ''
]

{ #category : #accessing }
Searchable >> name [
	^ name
]

{ #category : #accessing }
Searchable >> name: aString [
	name := aString
]
