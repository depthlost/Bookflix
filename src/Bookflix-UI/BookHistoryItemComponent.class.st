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
	callComponent call: (BookDetailComponent with: element book)
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
				with: [ self renderInformationOn: html ] ]
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
				with: [ self renderStateOn: html ] ]
]

{ #category : #rendering }
BookHistoryItemComponent >> renderStateOn: html [
	html small
		class: 'text-muted';
		with: 'sin terminar'
]

{ #category : #rendering }
BookHistoryItemComponent >> renderTitleOn: html [
	html paragraph
		class: 'mb-0';
		with: element book title
]
