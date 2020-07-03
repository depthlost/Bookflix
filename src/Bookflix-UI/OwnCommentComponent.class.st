Class {
	#name : #OwnCommentComponent,
	#superclass : #PrivilegedCommentComponent,
	#category : #'Bookflix-UI-comments'
}

{ #category : #rendering }
OwnCommentComponent >> renderUserNameOn: html [
	html small
		class: 'text-muted';
		with: 'Tu'
]
