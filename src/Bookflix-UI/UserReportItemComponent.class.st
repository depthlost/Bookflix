Class {
	#name : #UserReportItemComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'Bookflix-UI-admin'
}

{ #category : #'instance creation' }
UserReportItemComponent class >> with: anUser [
	^ self new with: anUser
]

{ #category : #rendering }
UserReportItemComponent >> renderContentOn: html [
	html div
		class: 'row';
		with: [ html div
				class: 'col';
				with: [ html paragraph
						class: 'mb-0';
						with: user name , ' ' , user surname.
					html small
						class: 'text-muted';
						with: user email ].
			html div
				class: 'col-auto';
				with: [ html small
						class: 'text-muted';
						with: user registrationDate asDate ddmmyyyy ] ]
]

{ #category : #initialization }
UserReportItemComponent >> with: anUser [
	user := anUser
]
