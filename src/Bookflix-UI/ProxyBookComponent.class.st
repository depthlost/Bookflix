Class {
	#name : #ProxyBookComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-books'
}

{ #category : #accessing }
ProxyBookComponent class >> book: aBook in: aComponent [
	^ self new book: aBook in: aComponent
]

{ #category : #initialization }
ProxyBookComponent >> initialize [
	super initialize.
	^ self session user isAdmin
		ifFalse: [ BookComponent new ]
		ifTrue: [ AdminBookComponent new ]
]
