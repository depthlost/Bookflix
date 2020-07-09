Class {
	#name : #SimpleViewBookComponent,
	#superclass : #SimpleViewReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #private }
SimpleViewBookComponent >> favoriteButtonClass [
	| class |
	class := 'btn btn-sm btn-outline-primary'.
	(self session profile isInFavorites: readable)
		ifTrue: [ class := class , ' active' ].
	^ class
]

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
SimpleViewBookComponent >> renderBookSectionOn: html [
	html div
		class: 'card';
		with: [ self
				renderHeadOn: html;
				renderBodyOn: html ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderBottomBodyOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleViewBookComponent >> renderContentOn: html [
	html div
		style: 'max-width: 16rem';
		with: [ self renderBookSectionOn: html.
			html render: (BookScoreComponent with: readable) ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderDislikeButtonOn: html [
	html anchor
		class: 'btn btn-sm btn-outline-danger';
		callback: [  ];
		with: [ html span class: 'oi oi-thumb-down' ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderEndButtonOn: html [
	html anchor
		class: 'btn btn-sm btn-outline-dark';
		callback: [  ];
		with: 'Terminar'
]

{ #category : #rendering }
SimpleViewBookComponent >> renderFavoriteButtonOn: html [
	html div
		style: 'margin-top: auto; margin-bottom: auto';
		with: [ html anchor
				class: self favoriteButtonClass;
				callback: [ self toggleFavorite ];
				with: [ html span class: 'oi oi-heart' ] ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderHeadOn: html [
	html image
		style: 'max-height: 18rem';
		class: 'card-img-top book-cover-image';
		url: readable imageURL
]

{ #category : #rendering }
SimpleViewBookComponent >> renderLikeButtonOn: html [
	html anchor
		class: 'btn btn-sm btn-outline-primary';
		callback: [  ];
		with: [ html span class: 'oi oi-thumb-up' ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderReadButtonOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleViewBookComponent >> renderScoreButtonsOn: html [
	html
		div: [ self renderLikeButtonOn: html.
			html space.
			self renderDislikeButtonOn: html ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderScoreStateOn: html [
	true
		ifTrue: [ self renderScoreButtonsOn: html ]
		ifFalse: [ false
				ifTrue: [ self renderEndButtonOn: html ] ]
]

{ #category : #rendering }
SimpleViewBookComponent >> renderTopBodyOn: html [
	html div
		class: 'btn-toolbar d-flex justify-content-between';
		with: [ html div
				class: 'btn-group w-75';
				with: [ self
						renderTrailerButtonOn: html;
						renderReadButtonOn: html ].
			self renderFavoriteButtonOn: html ]
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

{ #category : #callbacks }
SimpleViewBookComponent >> toggleFavorite [
	(self session profile isInFavorites: readable)
		ifTrue: [ self session profile removeFavorite: readable ]
		ifFalse: [ self session profile addFavorite: readable ].
	self session user save
]
