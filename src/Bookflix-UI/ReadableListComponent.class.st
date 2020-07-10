Class {
	#name : #ReadableListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'readablesComponents'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #'instance creation' }
ReadableListComponent class >> with: someReadablesComponents [
	^ self new with: someReadablesComponents
]

{ #category : #rendering }
ReadableListComponent >> renderContentOn: html [
	readablesComponents
		ifNotEmpty: [ self renderReadablesOn: html ]
		ifEmpty: [ self renderNoContentMessageOn: html ]
]

{ #category : #rendering }
ReadableListComponent >> renderNoContentMessageOn: html [
	html paragraph
		class: 'mt-2';
		with: 'No se encontro contenido'
]

{ #category : #rendering }
ReadableListComponent >> renderReadablesOn: html [
	html div
		class: 'd-flex justify-content-center';
		with: [ html div
				class: 'card-columns custom-columns';
				with: [ readablesComponents do: [ :each | html render: each ] ] ]
]

{ #category : #seaside }
ReadableListComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: '/css/book_card.css'
]

{ #category : #initialization }
ReadableListComponent >> with: someReadablesComponents [
	readablesComponents := someReadablesComponents
]
