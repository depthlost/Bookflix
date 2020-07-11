Class {
	#name : #RegisteredUsersBetweenDatesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'dateFromInput',
		'dateToInput',
		'users'
	],
	#category : #'Bookflix-UI-admin'
}

{ #category : #accessing }
RegisteredUsersBetweenDatesComponent >> dateFromInput [
	^ dateFromInput
]

{ #category : #accessing }
RegisteredUsersBetweenDatesComponent >> dateFromInput: anObject [
	dateFromInput := anObject
]

{ #category : #accessing }
RegisteredUsersBetweenDatesComponent >> dateToInput [
	^ dateToInput
]

{ #category : #accessing }
RegisteredUsersBetweenDatesComponent >> dateToInput: anObject [
	dateToInput := anObject
]

{ #category : #initialization }
RegisteredUsersBetweenDatesComponent >> initialize [
	super initialize.
	users := CommonUser selectAll
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderContentOn: html [
	html div
		class: 'container my-4';
		with: [ self
				renderDatesFormOn: html;
				renderUserSectionOn: html ]
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderDateFromInputOn: html [
	html dateInput5
		class: 'form-control';
		style: 'max-width: 11rem';
		autofocus;
		required;
		on: #dateFromInput of: self
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderDateToInputOn: html [
	html dateInput5
		class: 'form-control';
		style: 'max-width: 11rem';
		required;
		on: #dateToInput of: self
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderDatesFormOn: html [
	html form
		class: 'form-group mb-3';
		with: [ self renderFormInputGroupOn: html ]
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderFormInputGroupOn: html [
	html div
		class: 'input-group d-flex justify-content-center justify-content-md-end';
		with: [ self
				renderDateFromInputOn: html;
				renderDateToInputOn: html.
			html div
				class: 'input-group-append';
				with: [ self renderSearchButtonOn: html ] ]
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderSearchButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-outline-secondary';
		callback: [ self searchUsers ];
		with: 'Buscar'
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderUserListOn: html [
	html
		render: (ListComponent withTitle: 'Usuarios' components: self userItems)
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderUserSectionOn: html [
	users
		ifEmpty: [ self renderUsersNotFoundMessageOn: html ]
		ifNotEmpty: [ self renderUserListOn: html ]
]

{ #category : #rendering }
RegisteredUsersBetweenDatesComponent >> renderUsersNotFoundMessageOn: html [
	html paragraph
		class: 'mt-4';
		with: 'No se encontraron usuarios.'
]

{ #category : #callbacks }
RegisteredUsersBetweenDatesComponent >> searchUsers [
	"enlazar con el modelo"

	users := OrderedCollection empty
]

{ #category : #seaside }
RegisteredUsersBetweenDatesComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Reporte de Usuarios'
]

{ #category : #private }
RegisteredUsersBetweenDatesComponent >> userItems [
	^ users collect: [ :each | UserReportItemComponent with: each ]
]
