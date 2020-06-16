Class {
	#name : #SimpleBookComponent,
	#superclass : #SimpleReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
SimpleBookComponent >> renderBodyOn: html [
	html div
		class: 'card-body';
		with: [ html div
				class: 'btn-group d-flex';
				with: [ self
						renderReadButtonOn: html;
						renderTrailerButtonOn: html ] ]
]

{ #category : #rendering }
SimpleBookComponent >> renderImageOn: html [
	html image
		style: 'max-height: 18rem';
		class: 'card-img-top book-cover-image';
		url: readable imageURL
]

{ #category : #rendering }
SimpleBookComponent >> renderReadButtonOn: html [
	html anchor
		class: 'btn btn-success';
		callback: [ self session user addReadableForHistorial: readable ];
		with: 'Leer'
]

{ #category : #rendering }
SimpleBookComponent >> renderTrailerButtonOn: html [
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
