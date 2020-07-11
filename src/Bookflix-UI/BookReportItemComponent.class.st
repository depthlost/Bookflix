Class {
	#name : #BookReportItemComponent,
	#superclass : #ActionItemComponent,
	#instVars : [
		'callComponent'
	],
	#category : #'Bookflix-UI-admin'
}

{ #category : #'instance creation' }
BookReportItemComponent class >> with: aBook callComponent: aComponent [
	^ (self with: aBook) callComponent: aComponent
]

{ #category : #initialization }
BookReportItemComponent >> callComponent: aComponent [
	callComponent := aComponent
]

{ #category : #callbacks }
BookReportItemComponent >> onClick [
	callComponent call: (BookDetailComponent with: element)
]

{ #category : #rendering }
BookReportItemComponent >> renderAmountOfReadingsOn: html [
	html small
		class: 'text-muted';
		with: '2000 lecturas'
]

{ #category : #rendering }
BookReportItemComponent >> renderAuthorOn: html [
	html small
		class: 'text-muted ';
		with: element author name
]

{ #category : #rendering }
BookReportItemComponent >> renderContentOn: html [
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
BookReportItemComponent >> renderImageOn: html [
	html image
		url: element imageURL;
		style: 'width: 6rem;height: 8rem'
]

{ #category : #rendering }
BookReportItemComponent >> renderInformationOn: html [
	html div
		class: 'h-100 d-flex align-content-between flex-wrap';
		with: [ html div
				class: 'w-100';
				with: [ self
						renderTitleOn: html;
						renderAuthorOn: html ].
			html div
				class: 'w-100';
				with: [ self renderAmountOfReadingsOn: html ] ]
]

{ #category : #rendering }
BookReportItemComponent >> renderTitleOn: html [
	html paragraph
		class: 'mb-0';
		with: element title
]
