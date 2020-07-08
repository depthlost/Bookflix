Class {
	#name : #SimpleViewBookComponent,
	#superclass : #SimpleViewReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #callbacks }
SimpleViewBookComponent >> readBook [
	self session profile addReadableForHistorial: readable.
	self session user save
]

{ #category : #rendering }
SimpleViewBookComponent >> renderBodyOn: html [
	html div
		class: 'card-body';
		with: [ self
				renderTopBodyOn: html;
				renderBottomBodyOn: html ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderBottomBodyOn: html [
	html div
		class: 'mt-3 d-flex';
		with: [ self
				renderStateOn: html;
				renderEndButtonOn: html ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderEndButtonOn: html [
	html div
		class: 'd-inline w-100 d-flex justify-content-end';
		with: [ html anchor
				class: 'btn btn-sm btn-outline-dark';
				callback: [  ];
				with: 'Terminar' ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderHeadOn: html [
	html image
		style: 'max-height: 18rem';
		class: 'card-img-top book-cover-image';
		url: readable imageURL
]

{ #category : #rendering }
SimpleViewBookComponent >> renderReadButtonOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleViewBookComponent >> renderStateOn: html [
	html div
		class: 'd-inline';
		with: [ html small
				class: 'text-muted';
				with: 'Leyendo' ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderTopBodyOn: html [
	html div
		class: 'btn-group w-100';
		with: [ self
				renderTrailerButtonOn: html;
				renderReadButtonOn: html ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderTrailerButtonOn: html [
	readable advance
		ifNil: [ html anchor
				class: 'btn btn-primary w-100 disabled';
				with: 'Trailer' ]
		ifNotNil: [ html anchor
				class: 'btn btn-primary w-100';
				callback: [ parentComponent
						call: (TrailerDetailComponent with: readable advance) ];
				with: 'Trailer' ]
]
