Class {
	#name : #CommonUserProfileComponent,
	#superclass : #UserProfileComponent,
	#instVars : [
		'card'
	],
	#category : #'Bookflix-UI'
}

{ #category : #rendering }
CommonUserProfileComponent >> renderContentOn: html [
	super renderContentOn: html.
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self
				renderUserDatesOn: html;
				renderUserCardDates: html ]
]

{ #category : #rendering }
CommonUserProfileComponent >> renderFormTitleCardOn: html [
	^ html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Datos de Tarjeta'
]

{ #category : #rendering }
CommonUserProfileComponent >> renderUserCardDates: html [
	html form with: [ self renderFormTitleCardOn: html ]
]
