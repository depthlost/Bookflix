Class {
	#name : #UserProfileManagementComponent,
	#superclass : #UserProfileComponent,
	#category : #'Bookflix-UI-user_profiles'
}

{ #category : #callbacks }
UserProfileManagementComponent >> removeProfile [
	self session user
		removeProfile: profile;
		save
]

{ #category : #rendering }
UserProfileManagementComponent >> renderCardContentOn: html [
	super renderCardContentOn: html.
	self renderFooterOn: html
]

{ #category : #rendering }
UserProfileManagementComponent >> renderFooterOn: html [
	html div
		class: 'card-footer';
		with: [ self renderRemoveButtonOn: html ]
]

{ #category : #rendering }
UserProfileManagementComponent >> renderRemoveButtonOn: html [
	html anchor
		class: 'btn btn-sm btn-outline-danger';
		callback: [ self removeProfile ];
		with: [ html span class: 'oi oi-trash' ]
]
