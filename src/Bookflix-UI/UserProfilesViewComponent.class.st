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

{ #category : #getting }
UserProfilesViewComponent >> renderProfileManagementButtonOn: html [
	html anchor
		class: 'btn btn-outline-dark px-3';
		callback: [  ];
		with: 'Administrar Perfiles'
]

{ #category : #rendering }
UserProfilesViewComponent >> renderProfilesSectionOn: html [
	self session user profiles
		ifNotEmpty: [ super renderProfilesSectionOn: html ]
		ifEmpty: [ html text: 'No existen perfiles creados.' ]
]
