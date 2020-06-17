Class {
	#name : #SimpleViewNoveltyComponent,
	#superclass : #SimpleViewReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderBodyOn: html [
	html div
		class: 'card-body';
		with: [ html div
				class: 'btn-group d-flex';
				with: [ self
						renderReadButtonOn: html;
						renderBookButtonOn: html ] ]
]

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderBookButtonOn: html [
	html anchor
		class: 'btn btn-primary';
		callback: [ parentComponent answer ];
		with: 'Libro'
]

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderImageOn: html [
	html image
		style: 'max-height: 18rem';
		class: 'card-img-top book-cover-image';
		url: readable book imageURL
]

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderReadButtonOn: html [
	html anchor
		class: 'btn btn-success';
		callback: [  ];
		with: 'Leer'
]
