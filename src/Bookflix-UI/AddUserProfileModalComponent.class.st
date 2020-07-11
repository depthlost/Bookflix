Class {
	#name : #AddUserProfileModalComponent,
	#superclass : #FormModalComponent,
	#instVars : [
		'nameInput'
	],
	#category : #'Bookflix-UI-user_profiles'
}

{ #category : #callbacks }
AddUserProfileModalComponent >> onAccept [
	self session user
		addProfile: (Profile name: nameInput);
		save
]

{ #category : #rendering }
AddUserProfileModalComponent >> renderBodyContentOn: html [
	self renderNameInputOn: html
]

{ #category : #rendering }
AddUserProfileModalComponent >> renderNameInputFieldOn: html [
	html textInput
		class: 'form-control';
		placeholder: 'Nombre';
		attributeAt: 'aria-label' put: 'Nombre';
		attributeAt: 'aria-describedby' put: 'profile_name_input';
		attributeAt: 'minlength' put: '2';
		required;
		autofocus;
		callback: [ :input | nameInput := input ]
]

{ #category : #rendering }
AddUserProfileModalComponent >> renderNameInputLabelOn: html [
	html div
		class: 'input-group-prepend';
		with: [ html span
				id: 'profile_name_input';
				class: 'input-group-text';
				with: 'Nombre' ]
]

{ #category : #rendering }
AddUserProfileModalComponent >> renderNameInputOn: html [
	html div
		class: 'input-group';
		with: [ self
				renderNameInputLabelOn: html;
				renderNameInputFieldOn: html ]
]

{ #category : #getting }
AddUserProfileModalComponent >> title [
	^ 'Agregar Perfil'
]
