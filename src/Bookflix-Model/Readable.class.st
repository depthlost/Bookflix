Class {
	#name : #Readable,
	#superclass : #Object,
	#instVars : [
		'title',
		'description',
		'date',
		'expirationDate'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Readable class >> title: aTitle description: aDescription [
	^ self new title: aTitle description: aDescription
]

{ #category : #'as yet unclassified' }
Readable class >> title: aTitle description: aDescription expirationDate: aDate [
	^ self new
		title: aTitle
		description: aDescription
		expirationDate: aDate
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
	title := 'sin titulo'.
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
	^ title
]

{ #category : #accessing }
Readable >> title [
	^ title
]

{ #category : #initialization }
Readable >> title: aTitle [
	title := aTitle
]

{ #category : #initialization }
Readable >> title: aTitle description: aDescription [
	title := aTitle.
	description := aDescription
]

{ #category : #initialization }
Readable >> title: aTitle description: aDescription expirationDate: aDate [
	self title: aTitle.
	self description: aDescription.
	self expirationDate: aDate
]
