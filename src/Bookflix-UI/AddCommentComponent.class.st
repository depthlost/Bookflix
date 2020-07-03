Class {
	#name : #AddCommentComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book',
		'descriptionInput'
	],
	#category : #'Bookflix-UI-comments'
}

{ #category : #'instance creation' }
AddCommentComponent class >> book: aBook [
	^ self new book: aBook
]

{ #category : #initialization }
AddCommentComponent >> book: aBook [
	book := aBook
]

{ #category : #callbacks }
AddCommentComponent >> publish: hasSpoiler [
	book
		addComment:
			(MockComment
				book: book
				author: self session user
				description: descriptionInput
				hasSpoiler: hasSpoiler)
]

{ #category : #rendering }
AddCommentComponent >> renderContentOn: html [
	html form
		class: 'form-group mb-1';
		with: [ self
				renderDescriptionInputOn: html;
				renderPublishSectionOn: html ]
]

{ #category : #rendering }
AddCommentComponent >> renderDescriptionInputOn: html [
	html textArea
		class: 'form-control mb-2';
		style: 'resize: none';
		rows: 3;
		placeholder: 'Escribe un comentario...';
		required;
		callback: [ :input | descriptionInput := input ]
]

{ #category : #rendering }
AddCommentComponent >> renderDropdownItem: aTitle withCallback: aCallback on: html [
	html button
		type: 'submit';
		class: 'btn dropdown-item';
		callback: aCallback;
		with: aTitle
]

{ #category : #rendering }
AddCommentComponent >> renderPublishButtonDropdownOn: html [
	html div
		class: 'dropdown-menu';
		with: [ self
				renderDropdownItem: 'Con Spoiler'
					withCallback: [ self publish: true ]
					on: html;
				renderDropdownItem: 'Sin Spoiler'
					withCallback: [ self publish: false ]
					on: html ]
]

{ #category : #rendering }
AddCommentComponent >> renderPublishButtonOn: html [
	html button
		class: 'btn btn-sm btn-success dropup';
		attributeAt: 'data-toggle' put: 'dropdown';
		attributeAt: 'aria-haspopup' put: 'true';
		attributeAt: 'aria-expanded' put: 'false';
		with: 'Publicar'
]

{ #category : #rendering }
AddCommentComponent >> renderPublishSectionOn: html [
	html div
		class: 'd-flex justify-content-end';
		with: [ self
				renderPublishButtonOn: html;
				renderPublishButtonDropdownOn: html ]
]
