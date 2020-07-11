Class {
	#name : #Readable,
	#superclass : #Searchable,
	#instVars : [
		'description',
		'date',
		'expirationDate'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Readable class >> title: aTitle description: aDescription [
	^ (self name: aTitle) description: aDescription
]

{ #category : #'as yet unclassified' }
Readable class >> title: aTitle description: aDescription expirationDate: aDate [
	^ (self name: aTitle) description: aDescription expirationDate: aDate
]

{ #category : #accessing }
Readable >> date [
	^ date
]

{ #category : #accessing }
Readable >> date: aDateAndTime [
	date := aDateAndTime
]

{ #category : #accessing }
Readable >> description [
	^ description
]

{ #category : #accessing }
Readable >> description: aDescription [
	description := aDescription
]

{ #category : #initialization }
Readable >> description: aDescription expirationDate: aDate [
	self description: aDescription.
	self expirationDate: aDate
]

{ #category : #accessing }
Readable >> expirationDate [
	^ expirationDate
]

{ #category : #accessing }
Readable >> expirationDate: aDate [
	expirationDate := aDate
]

{ #category : #'as yet unclassified' }
Readable >> initialize [
	date := Date today.
	name := 'sin titulo'.
	description := 'sin descripcion'.
	expirationDate := nil
]

{ #category : #testing }
Readable >> isExpired [
	expirationDate
		ifNil: [ ^ false ]
		ifNotNil: [ ^ expirationDate < Date today ]
]

{ #category : #'as yet unclassified' }
Readable >> managementCriteria [
	^ name
]

{ #category : #accessing }
Readable >> title [
	^ self name
]

{ #category : #initialization }
Readable >> title: aName [
	self name: aName
]
