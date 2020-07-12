Class {
	#name : #UserProfilesComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-user_profiles'
}

{ #category : #getting }
UserProfilesComponent >> getUserProfileComponents [
	self subclassResponsibility
]

{ #category : #rendering }
UserProfilesComponent >> renderContentOn: html [
	html div
		class: 'container pb-4';
		style: 'margin-top:2em';
		with: [ self
				renderProfilesSectionOn: html;
				renderProfileManagementOn: html ]
]

{ #category : #rendering }
UserProfilesComponent >> renderProfileManagementButtonOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
UserProfilesComponent >> renderProfileManagementOn: html [
	html div
		class: 'd-flex justify-content-center mt-4';
		with: [ self renderProfileManagementButtonOn: html ]
]

{ #category : #rendering }
UserProfilesComponent >> renderProfilesOn: html [
	self getUserProfileComponents do: [ :each | html render: each ]
]

{ #category : #rendering }
UserProfilesComponent >> renderProfilesSectionOn: html [
	html div
		class: 'd-flex justify-content-center';
		with: [ html div
				class: 'card-columns custom-columns';
				with: [ self renderProfilesOn: html ] ]
]

{ #category : #hooks }
UserProfilesComponent >> states [
	^ Array with: self
]

{ #category : #seaside }
UserProfilesComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Perfiles'.
	anHtmlRoot stylesheet url: '/css/user_profiles.css'
]
