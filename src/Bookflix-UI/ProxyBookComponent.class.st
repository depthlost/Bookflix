Class {
	#name : #ProxyBookComponent,
	#superclass : #WAComponent,
	#instVars : [
		'bookComponent'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
ProxyBookComponent class >> book: aBook [
	^ self new book: aBook
]

{ #category : #accessing }
ProxyBookComponent >> book: aBook [
	bookComponent := self session user isAdmin
		ifFalse: [ BookComponent book: aBook ]
		ifTrue: [ AdminBookComponent book: aBook ]
]

{ #category : #rendering }
ProxyBookComponent >> renderContentOn: html [
	bookComponent renderContentOn: html
]

{ #category : #seaside }
ProxyBookComponent >> states [
	^ bookComponent states
]

{ #category : #seaside }
ProxyBookComponent >> updateRoot: anHtmlRoot [
	bookComponent updateRoot: anHtmlRoot
]
