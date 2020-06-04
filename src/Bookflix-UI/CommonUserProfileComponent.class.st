Class {
	#name : #CommonUserProfileComponent,
	#superclass : #UserProfileComponent,
	#instVars : [
		'cardComponent'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #private }
CommonUserProfileComponent >> cardIsExpired [
	^ cardComponent inputCardExpirationDate <= Month current
]

{ #category : #private }
CommonUserProfileComponent >> checkData [
	cardComponent errorByExpiredCard: self cardIsExpired.
	^ super checkData & self cardIsExpired not
]

{ #category : #seaside }
CommonUserProfileComponent >> children [
	^ super children , (Array with: cardComponent)
]

{ #category : #initialization }
CommonUserProfileComponent >> initialize [
	super initialize.
	cardComponent := CardDataInputComponent with: self session user card
]

{ #category : #rendering }
CommonUserProfileComponent >> renderDataInputOn: html [
	super renderDataInputOn: html.
	html render: cardComponent
]

{ #category : #private }
CommonUserProfileComponent >> updateUserData [
	super updateUserData.
	cardComponent updateCard: self session user card
]
