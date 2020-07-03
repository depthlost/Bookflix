Class {
	#name : #CommentListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI-comments'
}

{ #category : #'instance creation' }
CommentListComponent class >> book: aBook [
	^ self new book: aBook
]

{ #category : #initialization }
CommentListComponent >> book: aBook [
	book := aBook
]

{ #category : #private }
CommentListComponent >> commentsComponents [
	^ book comments
		collect: [ :each | CommentComponentBuilder with: each ]
]

{ #category : #rendering }
CommentListComponent >> renderContentOn: html [
	html
		render:
			(ListComponent
				withTitle: 'Comentarios'
				components: self commentsComponents)
]
