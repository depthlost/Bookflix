Class {
	#name : #BookComponent,
	#superclass : #ReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #private }
BookComponent >> getGendersSeparatedByCommas [
	^ (readable genders asOrderedCollection
		collect: [ :each | each name ]) joinUsing: ', '
]

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

{ #category : #rendering }
BookComponent >> renderSubtitleOn: html [
	html small
		class: 'mb-2 text-muted';
		with: self getGendersSeparatedByCommas
]
