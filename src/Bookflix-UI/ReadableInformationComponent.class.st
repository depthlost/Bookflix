Class {
	#name : #ReadableInformationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'readable'
	],
	#category : #'Bookflix-UI-books'
}

{ #category : #constructor }
ReadableInformationComponent class >> with: aReadable [
	^ self new with: aReadable
]

{ #category : #builder }
ReadableInformationComponent >> informationList [
	^ ListComponent
		withTitle: 'Información'
		blocks: self informationListItems
]

{ #category : #builder }
ReadableInformationComponent >> informationListInternalItems [
	self subclassResponsibility
]

{ #category : #builder }
ReadableInformationComponent >> informationListItems [
	^ ({(self listItemName: 'Titulo' with: readable title).
	(self listItemName: 'Descripcion' with: readable description)}
		, self informationListInternalItems
		,
			{(self
				listItemName: 'Vencimiento'
				with: self readableExpirationDateDescription).
			(self listFooterWith: 'Subido el ' , readable date asDate ddmmyyyy)})
		asOrderedCollection
]

{ #category : #builder }
ReadableInformationComponent >> listFooterWith: aDescription [
	^ [ :html | 
	html small
		class: 'text-muted';
		with: aDescription ]
]

{ #category : #builder }
ReadableInformationComponent >> listItemName: aName with: aDescription [
	^ [ :html | 
	html div
		class: 'row px-3';
		with: [ html div
				style: 'width: 100px';
				with: aName.
			html div
				class: 'col';
				with: aDescription ] ]
]

{ #category : #private }
ReadableInformationComponent >> readableExpirationDateDescription [
	^ readable expirationDate
		ifNotNil: [ :date | date asDate ddmmyyyy ]
		ifNil: [ 'Sin Vencimiento' ]
]

{ #category : #rendering }
ReadableInformationComponent >> renderContentOn: html [
	html render: self informationList
]

{ #category : #initialization }
ReadableInformationComponent >> with: aReadable [
	readable := aReadable
]
