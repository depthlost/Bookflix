Class {
	#name : #PrivilegedCommentComponent,
	#superclass : #CommentComponent,
	#category : #'Bookflix-UI-comments'
}

{ #category : #private }
PrivilegedCommentComponent >> commentBook [
	^ Bookflix instance getAllBooks
		detect: [ :each | each getAllComments includes: comment ]
		ifNone: nil
]

{ #category : #callbacks }
PrivilegedCommentComponent >> removeComment [
	self commentBook
		ifNotNil: [ :book | 
			book removeComment: comment.
			Bookflix instance updateReadable: book ]
]

{ #category : #rendering }
PrivilegedCommentComponent >> renderBodyOn: html [
	html div
		class: 'mb-1';
		with: [ self
				renderDescriptionOn: html;
				renderSpoilerButtonOn: html.
			html space.
			self renderRemoveButtonOn: html ]
]

{ #category : #rendering }
PrivilegedCommentComponent >> renderDescriptionOn: html [
	html paragraph: comment content
]

{ #category : #rendering }
PrivilegedCommentComponent >> renderRemoveButtonOn: html [
	html anchor
		class: 'btn btn-sm btn-outline-danger';
		callback: [ self removeComment ];
		with: [ html span class: 'oi oi-trash' ]
]

{ #category : #rendering }
PrivilegedCommentComponent >> renderSpoilerButtonOn: html [
	html anchor
		class: self spoilerButtonClass;
		callback: [ comment isSpoiler: comment isSpoiler not ];
		with: 'spoiler'
]

{ #category : #private }
PrivilegedCommentComponent >> spoilerButtonClass [
	| class |
	class := 'btn btn-sm btn-outline-dark'.
	comment isSpoiler
		ifTrue: [ class := class , ' active' ].
	^ class
]
