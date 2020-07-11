Class {
	#name : #UserProfilesManagementComponent,
	#superclass : #UserProfilesComponent,
	#category : #'Bookflix-UI-user_profiles'
}

{ #category : #getting }
UserProfilesManagementComponent >> getUserProfileComponents [
	^ self session user profiles
		collect: [ :each | UserProfileManagementComponent with: each in: self ]
]

{ #category : #rendering }
UserProfilesManagementComponent >> renderAddProfileOn: html [
	html div
		class: 'card';
		with: [ html
				render:
					(ModalButtonComponent
						modal: (AddUserProfileModalComponent id: 'modal_add_profile')
						class: 'btn btn-block btn-outline-success'
						with: [ html div
								class: 'card-body';
								with: [ html span class: 'oi oi-plus' ] ]) ]
]

{ #category : #rendering }
UserProfilesManagementComponent >> renderProfileManagementButtonOn: html [
	html anchor
		class: 'btn btn-outline-dark px-3';
		callback: [ self answer ];
		with: 'Listo'
]

{ #category : #rendering }
UserProfilesManagementComponent >> renderProfilesOn: html [
	super renderProfilesOn: html.
	self session user canAddProfile
		ifTrue: [ self renderAddProfileOn: html ]
]
