Class {
	#name : #SpoilerCommentComponent,
	#superclass : #CommentComponent,
	#category : #'Bookflix-UI-comments'
}

{ #category : #private }
SpoilerCommentComponent >> hiddenCommentId [
	^ 'hidden_comment_' , comment hash asString
]

{ #category : #rendering }
SpoilerCommentComponent >> renderBodyOn: html [
	html div
		class: 'mb-1';
		with: [ self
				renderHiddenCommentOn: html;
				renderVisibleCommentOn: html ]
]

{ #category : #rendering }
SpoilerCommentComponent >> renderHiddenCommentOn: html [
	html div
		id: self hiddenCommentId;
		with: [ html
				text: 'Este comentario posee spoiler.';
				space.
			html anchor
				url: 'javascript:{}';
				onClick:
					'$("#' , self visibleCommentId , '").removeClass("d-none");$("#'
						, self hiddenCommentId , '").addClass("d-none");';
				with: 'Ver comentario' ]
]

{ #category : #rendering }
SpoilerCommentComponent >> renderSpoilerMessageOn: html [
	html div
		class: 'd-flex justify-content-end';
		with: [ html small
				class: 'text-muted';
				with: 'spoiler' ]
]

{ #category : #rendering }
SpoilerCommentComponent >> renderVisibleCommentOn: html [
	html div
		id: self visibleCommentId;
		class: 'd-none';
		with: [ self
				renderDescriptionOn: html;
				renderSpoilerMessageOn: html ]
]

{ #category : #private }
SpoilerCommentComponent >> visibleCommentId [
	^ 'visible_comment_' , comment hash asString
]
