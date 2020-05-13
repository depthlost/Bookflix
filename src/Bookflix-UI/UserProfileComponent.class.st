"
| application |
application := WAAdmin register: UserProfileComponent asApplicationAt: '/bookflix'.
application sessionClass: UserSession.
"
Class {
	#name : #UserProfileComponent,
	#superclass : #WABootstrapComponent,
	#instVars : [
		'name'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
UserProfileComponent >> initialize [
	self session user: User selectAll first.
	name := self session user name
]

{ #category : #accessing }
UserProfileComponent >> name [
	^ name
]

{ #category : #accessing }
UserProfileComponent >> name: aName [
	name := aName
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'max-width: 320px;';
		with: [ self renderFormTitleOn: html;
				renderFormUserName: html]
]

{ #category : #rendering }
UserProfileComponent >> renderFormTitleOn: html [
	^ html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: 'Perfil de usuario'
]

{ #category : #rendering }
UserProfileComponent >> renderFormUserName: html [
	html form
		class: 'form-inline';
		with: [ html label
				for: 'input_name';
				with: 'Nombre:'.	
			html textInput
				id: 'input_name';
				class: 'form-control';
				on: #name of: self ]
]
