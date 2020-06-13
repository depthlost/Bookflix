Class {
	#name : #SimpleBookComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book',
		'parentComponent'
	],
	#category : #'Bookflix-UI-books'
}

{ #category : #construction }
SimpleBookComponent class >> with: aBook in: aComponent [
	^ self new with: aBook in: aComponent
]

{ #category : #rendering }
SimpleBookComponent >> renderBodyOn: html [
	html div
		class: 'card-body';
		with: [ self renderReadButtonOn: html ]
]

{ #category : #rendering }
SimpleBookComponent >> renderContentOn: html [
	html div
		class: 'card';
		style: 'max-width: 16rem';
		with: [ self
				renderImageOn: html;
				renderBodyOn: html ]
]

{ #category : #rendering }
SimpleBookComponent >> renderImageOn: html [
	html image
		style: 'max-height: 18rem';
		class: 'card-img-top book-cover-image';
		url: book imageURL
]

{ #category : #rendering }
SimpleBookComponent >> renderReadButtonOn: html [
	html button
		class: 'btn btn-success px-4';
		with: 'Leer'
]

{ #category : #initialization }
SimpleBookComponent >> with: aBook in: aComponent [
	book := aBook.
	parentComponent := aComponent
]
