Class {
	#name : #TrailerDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'trailer',
		'trailerInformationComponent',
		'simpleTrailerComponent'
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
				class: 'col-3';
				with: [ html render: simpleTrailerComponent ].
			html div
				class: 'col-9';
				with: [ html render: trailerInformationComponent ] ]
]

{ #category : #seaside }
TrailerDetailComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - ' , trailer title
]

{ #category : #initialization }
TrailerDetailComponent >> with: aTrailer [
	trailer := aTrailer.
	trailerInformationComponent := TrailerInformationComponent
		with: trailer.
	simpleTrailerComponent := SimpleTrailerComponent
		with: trailer
		in: self
]
