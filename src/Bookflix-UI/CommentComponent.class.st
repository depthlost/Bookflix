Class {
	#name : #CommentComponent,
	#superclass : #WAComponent,
	#instVars : [
		'comment'
	],
	#category : #'Bookflix-UI-comments'
}

{ #category : #'instance creation' }
CommentComponent class >> with: aComment [
	^ self new with: aComment
]

{ #category : #rendering }
CommentComponent >> renderBodyOn: html [
	self renderDescriptionOn: html
]

{ #category : #rendering }
CommentComponent >> renderContentOn: html [
	self
		renderHeaderOn: html;
		renderBodyOn: html
]

{ #category : #rendering }
CommentComponent >> renderDateOn: html [
	html small
		class: 'text-muted';
		with: comment date asDate ddmmyyyy
]

{ #category : #rendering }
CommentComponent >> renderDescriptionOn: html [
	html paragraph
		class: 'mb-1';
		with: comment description
]

{ #category : #rendering }
CommentComponent >> renderHeaderOn: html [
	html div
		class: 'd-flex w-100 justify-content-between';
		with: [ self
				renderUserNameOn: html;
				renderDateOn: html ]
]

{ #category : #rendering }
CommentComponent >> renderUserNameOn: html [
	html small
		class: 'text-muted';
		with: comment author name
]

{ #category : #initialization }
CommentComponent >> with: aComment [
	comment := aComment
]
