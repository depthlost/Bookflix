Class {
	#name : #NoveltyOperationComponent,
	#superclass : #ReadableOperationComponent,
	#instVars : [
		'contentUrlInput',
		'contentTypeInput'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #accessing }
NoveltyOperationComponent >> contentTypeInput [
	^ contentTypeInput
]

{ #category : #accessing }
NoveltyOperationComponent >> contentTypeInput: anObject [
	contentTypeInput := anObject
]

{ #category : #accessing }
NoveltyOperationComponent >> contentUrlInput [
	^ contentUrlInput
]

{ #category : #accessing }
NoveltyOperationComponent >> contentUrlInput: anObject [
	contentUrlInput := anObject
]

{ #category : #rendering }
NoveltyOperationComponent >> renderContentTypeOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'content_type_input';
				with: 'Tipo de Contenido'.
			html select
				id: 'content_type_input';
				class: 'form-control';
				list: #('Imagen' 'Video' 'Descripción');
				on: #contentTypeInput of: self;
				required ]
]

{ #category : #rendering }
NoveltyOperationComponent >> renderContentUrlOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'content_url_input';
				with: 'Link del Contenido'.
			html urlInput
				id: 'content_url_input';
				class: 'form-control';
				placeholder: 'Link del Contenido';
				required;
				value: contentUrlInput;
				callback: [ :input | contentUrlInput := input asString ] ]
]

{ #category : #rendering }
NoveltyOperationComponent >> renderDataInputOn: html [
	super renderDataInputOn: html.
	self
		renderContentTypeOn: html;
		renderContentUrlOn: html
]
