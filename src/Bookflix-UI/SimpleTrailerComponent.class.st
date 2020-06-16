Class {
	#name : #SimpleTrailerComponent,
	#superclass : #SimpleReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
SimpleTrailerComponent >> renderBodyOn: html [
	html div
		class: 'card-body';
		with: [ html div
				class: 'btn-group d-flex';
				with: [ self
						renderReadButtonOn: html;
						renderBookButtonOn: html ] ]
]

{ #category : #rendering }
SimpleTrailerComponent >> renderBookButtonOn: html [
	html anchor
		class: 'btn btn-primary';
		callback:
				[ parentComponent call: (BookDetailComponent with: readable book) ];
		with: 'Libro'
]

{ #category : #rendering }
SimpleTrailerComponent >> renderImageOn: html [
	html image
		style: 'max-height: 18rem';
		class: 'card-img-top book-cover-image';
		url: readable book imageURL
]

{ #category : #rendering }
SimpleTrailerComponent >> renderReadButtonOn: html [
	html anchor
		class: 'btn btn-success';
		callback: [  ];
		with: 'Leer'
]
