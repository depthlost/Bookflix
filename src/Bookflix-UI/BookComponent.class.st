Class {
	#name : #BookComponent,
	#superclass : #ReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
BookComponent >> renderHeadOn: html [
	html anchor
		callback: [ parentComponent call: (BookDetailComponent with: readable) ];
		with: [ self renderImageOn: html ]
]

{ #category : #rendering }
BookComponent >> renderImageOn: html [
	html image
		class: 'card-img-top book-cover-image';
		url: readable imageURL
]

{ #category : #rendering }
BookComponent >> renderInformationButtonOn: html [
	
]
