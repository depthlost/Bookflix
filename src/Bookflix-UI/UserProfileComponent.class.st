Class {
	#name : #UserProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parentComponent',
		'profile'
	],
	#category : #'Bookflix-UI-user_profiles'
}

{ #category : #'instance creation' }
UserProfileComponent class >> with: aProfile in: aComponent [
	^ self new with: aProfile in: aComponent
]

{ #category : #rendering }
UserProfileComponent >> renderBodyOn: html [
	html anchor
		class: 'btn btn-block btn-dark';
		callback: [ self toAccess ];
		with: [ html div
				class: 'card-body';
				with: [ self renderProfileNameOn: html ] ]
]

{ #category : #rendering }
UserProfileComponent >> renderCardContentOn: html [
	self renderBodyOn: html
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: html [
	html div
		class: 'card';
		with: [ self renderCardContentOn: html ]
]

{ #category : #rendering }
UserProfileComponent >> renderProfileNameOn: html [
	html header level5
		class: 'card-title';
		with: profile name
]

{ #category : #callbacks }
UserProfileComponent >> toAccess [
	
]

{ #category : #initialization }
UserProfileComponent >> with: aProfile in: aComponent [
	profile := aProfile.
	parentComponent := aComponent
]
