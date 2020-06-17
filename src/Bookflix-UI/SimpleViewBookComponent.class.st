Class {
	#name : #SimpleViewBookComponent,
	#superclass : #SimpleViewReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
SimpleViewBookComponent >> renderBodyOn: html [
	html div
		class: 'card-body';
		with: [ html div
				class: 'btn-group d-flex';
				with: [ self
						renderReadButtonOn: html;
						renderTrailerButtonOn: html ] ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderImageOn: html [
	html image
		style: 'max-height: 18rem';
		class: 'card-img-top book-cover-image';
		url: readable imageURL
]

{ #category : #rendering }
SimpleViewBookComponent >> renderReadButtonOn: html [
	html anchor
		class: 'btn btn-success';
		callback: [ self session user addReadableForHistorial: readable ];
		with: 'Leer'
]

{ #category : #rendering }
SimpleViewBookComponent >> renderTrailerButtonOn: html [
	readable advance
		ifNil: [ html anchor
				class: 'btn btn-primary disabled';
				with: 'Trailer' ]
		ifNotNil: [ html anchor
				class: 'btn btn-primary';
				callback: [ parentComponent
						call: (TrailerDetailComponent with: readable advance) ];
				with: 'Trailer' ]
]
