Class {
	#name : #RemoveCommentModalComponent,
	#superclass : #RemoveModalComponent,
	#instVars : [
		'comment'
	],
	#category : #'Bookflix-UI-comments'
}

{ #category : #'instance creation' }
RemoveCommentModalComponent class >> with: aComment [
	^ self new with: aComment
]

{ #category : #private }
RemoveCommentModalComponent >> commentBook [
	^ Bookflix instance getAllBooks
		detect: [ :each | each getAllComments includes: comment ]
		ifNone: nil
]

{ #category : #callbacks }
RemoveCommentModalComponent >> onAccept [
	self commentBook
		ifNotNil: [ :book | 
			book removeComment: comment.
			Bookflix instance updateReadable: book ]
]

{ #category : #rendering }
RemoveCommentModalComponent >> renderBodyContentOn: html [
	html text: '¿Seguro que seas borrar el comentario?'
]

{ #category : #getting }
RemoveCommentModalComponent >> title [
	^ 'Borrar comentario'
]

{ #category : #initialization }
RemoveCommentModalComponent >> with: aComment [
	comment := aComment
]
