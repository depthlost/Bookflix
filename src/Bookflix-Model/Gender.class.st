Class {
	#name : #Gender,
	#superclass : #Searchable,
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Gender class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Gender class >> name: aString [
	^ self new name: aString
]

{ #category : #initialization }
Gender >> initialize [
	super initialize.
	name := 'ninguno'
]
