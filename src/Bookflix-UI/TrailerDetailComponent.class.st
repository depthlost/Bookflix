Class {
	#name : #TrailerDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'trailer',
		'informationComponent',
		'simpleViewComponent'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #construction }
TrailerDetailComponent class >> with: aTrailer [
	^ self new with: aTrailer
]

{ #category : #rendering }
TrailerDetailComponent >> renderContentOn: html [
	html div
		class: 'container my-4';
		with: [ self renderRowOn: html ]
]

{ #category : #rendering }
TrailerDetailComponent >> renderRowOn: html [
	html div
		class: 'row';
		with: [ html div
				class: 'col-md-4 h-100 d-flex justify-content-center mb-4';
				with: [ html render: simpleViewComponent ].
			html div
				class: 'col-md-8 h-100 mb-4';
				with: [ html render: informationComponent ] ]
]

{ #category : #seaside }
TrailerDetailComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - ' , trailer title
]

{ #category : #initialization }
TrailerDetailComponent >> with: aTrailer [
	trailer := aTrailer.
	informationComponent := TrailerInformationComponent
		with: trailer.
	simpleViewComponent := SimpleViewTrailerComponent
		with: trailer
		in: self
]
