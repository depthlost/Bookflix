Class {
	#name : #ProxyBookComponent,
	#superclass : #WAComponent,
	#instVars : [
		'bookComponent'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
ProxyBookComponent class >> book: aBook andParentComponent: aComponent [
	^ self new book: aBook andParentComponent: aComponent
]

{ #category : #accessing }
ProxyBookComponent >> book [
	^ bookComponent book
]

{ #category : #accessing }
ProxyBookComponent >> book: aBook andParentComponent: aComponent [
	bookComponent := self session user isAdmin
		ifFalse: [ BookComponent book: aBook andParentComponent: aComponent ]
		ifTrue: [ AdminBookComponent book: aBook andParentComponent: aComponent ]
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
