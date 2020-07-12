Class {
	#name : #UserProfilesViewComponent,
	#superclass : #UserProfilesComponent,
	#category : #'Bookflix-UI-user_profiles'
}

{ #category : #getting }
UserProfilesViewComponent >> getUserProfileComponents [
	^ self session user profiles
		collect: [ :each | UserProfileComponent with: each in: self ]
]

{ #category : #callbacks }
UserProfilesViewComponent >> onPressingManageProfile [
	| managementComponent |
	managementComponent := UserProfilesManagementComponent new.
	self
		call: managementComponent
		onAnswer: [ :answer | 
			answer ~~ managementComponent
				ifTrue: [ self answer ] ]
]

{ #category : #rendering }
UserProfilesViewComponent >> renderProfileManagementButtonOn: html [
	html anchor
		class: 'btn btn-outline-dark px-3';
		callback: [ self onPressingManageProfile ];
		with: 'Administrar Perfiles'
]

{ #category : #rendering }
UserProfilesViewComponent >> renderProfilesSectionOn: html [
	self session user profiles
		ifNotEmpty: [ super renderProfilesSectionOn: html ]
		ifEmpty: [ html text: 'No existen perfiles creados.' ]
]
