Class {
	#name : #BookHistoryItemComponent,
	#superclass : #ActionItemComponent,
	#instVars : [
		'callComponent'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #'instance creation' }
BookHistoryItemComponent class >> with: anHistorialElement callComponent: aComponent [
	^ (self with: anHistorialElement) callComponent: aComponent
]

{ #category : #initialization }
BookHistoryItemComponent >> callComponent: aComponent [
	callComponent := aComponent
]

{ #category : #callbacks }
BookHistoryItemComponent >> onClick [
	element book isExpired
		ifFalse: [ callComponent call: (BookDetailComponent with: element book) ]
]

{ #category : #private }
BookHistoryItemComponent >> readStatusMessage [
	^ (self session profile finish: element book)
		ifFalse: [ 'Sin terminar' ]
		ifTrue: [ 'Terminado' ]
]

{ #category : #rendering }
BookHistoryItemComponent >> renderAuthorOn: html [
	html small
		class: 'text-muted ';
		with: element book author name
]

{ #category : #rendering }
BookHistoryItemComponent >> renderContentOn: html [
	html div
		class: 'row';
		with: [ html div
				class: 'col-auto';
				with: [ self renderImageOn: html ].
			html div
				class: 'col py-2';
				with: [ self renderInformationOn: html ].
			html div
				class: 'col-auto';
				with: [ html small
						class: 'text-muted';
						with:
							element moment asDate ddmmyyyy , ' '
								, element moment asTime printMinutes ] ]
]

{ #category : #rendering }
BookHistoryItemComponent >> renderImageOn: html [
	html image
		url: element book imageURL;
		style: 'width: 6rem; height: 8rem'
]

{ #category : #rendering }
BookHistoryItemComponent >> renderInformationOn: html [
	html div
		class: 'h-100 d-flex align-content-between flex-wrap';
		with: [ html div
				class: 'w-100';
				with: [ self
						renderTitleOn: html;
						renderAuthorOn: html ].
			html div
				class: 'w-100';
				with: [ self renderReadStatusOn: html ] ]
]

{ #category : #rendering }
BookHistoryItemComponent >> renderReadStatusOn: html [
	html small
		class: 'text-muted';
		with: self readStatusMessage
]

{ #category : #rendering }
BookHistoryItemComponent >> renderTitleOn: html [
	html paragraph
		class: 'mb-0';
		with: element book title
]
