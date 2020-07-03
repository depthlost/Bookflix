Class {
	#name : #CommentComponentBuilder,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-comments'
}

{ #category : #'instance creation' }
CommentComponentBuilder class >> with: aComment [
	^ self new with: aComment
]

{ #category : #initialization }
CommentComponentBuilder >> with: aComment [
	^ (aComment author == self session user
		ifTrue: [ OwnCommentComponent ]
		ifFalse: [ self session user isAdmin
				ifTrue: [ PrivilegedCommentComponent ]
				ifFalse: [ aComment hasSpoiler
						ifFalse: [ CommentComponent ]
						ifTrue: [ SpoilerCommentComponent ] ] ]) with: aComment
]
