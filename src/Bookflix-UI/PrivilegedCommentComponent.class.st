Class {
	#name : #PrivilegedCommentComponent,
	#superclass : #CommentComponent,
	#category : #'Bookflix-UI-comments'
}

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
	html
		render:
			(ModalButtonComponent
				modal: (RemoveCommentModalComponent with: comment)
				class: 'btn btn-sm btn-outline-danger'
				with: [ html span
						class: 'oi oi-trash';
						with: '' ])
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
