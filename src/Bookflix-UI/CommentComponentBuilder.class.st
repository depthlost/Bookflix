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
	^ (aComment profile == self session profile
		ifTrue: [ OwnCommentComponent ]
		ifFalse: [ self session user isAdmin
				ifTrue: [ PrivilegedCommentComponent ]
				ifFalse: [ aComment isSpoiler
						ifFalse: [ CommentComponent ]
						ifTrue: [ SpoilerCommentComponent ] ] ]) with: aComment
]
