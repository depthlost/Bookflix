Class {
	#name : #ModifyCompleteBookComponent,
	#superclass : #CompleteBookFormulariComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'instance creation' }
ModifyCompleteBookComponent class >> newWith: aBook [
	^ self new book: aBook
]

{ #category : #accessing }
ModifyCompleteBookComponent >> book: aBook [
	book := aBook
]

{ #category : #rendering }
ModifyCompleteBookComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self
				renderTextOn: html;
				renderBookFormulariOn: html ]
]

{ #category : #rendering }
ModifyCompleteBookComponent >> renderTextOn: html [
	^ html text
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Datos de libro completo'
]

{ #category : #accessing }
ModifyCompleteBookComponent >> title [
	^ book title
]

{ #category : #accessing }
ModifyCompleteBookComponent >> title: aTitle [
	book title: aTitle
]
