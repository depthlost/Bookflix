Class {
	#name : #CommonUserAccountComponent,
	#superclass : #UserAccountComponent,
	#instVars : [
		'cardComponent'
	],
	#category : #'Bookflix-UI-users'
}

{ #category : #private }
CommonUserAccountComponent >> cardIsExpired [
	^ cardComponent inputCardExpirationDate <= Month current
]

{ #category : #private }
CommonUserAccountComponent >> checkData [
	cardComponent errorByExpiredCard: self cardIsExpired.
	^ super checkData & self cardIsExpired not
]

{ #category : #seaside }
CommonUserAccountComponent >> children [
	^ super children , (Array with: cardComponent)
]

{ #category : #initialization }
CommonUserAccountComponent >> initialize [
	super initialize.
	cardComponent := CardDataInputComponent with: self session user card
]

{ #category : #rendering }
CommonUserAccountComponent >> renderDataInputOn: html [
	super renderDataInputOn: html.
	html render: cardComponent
]

{ #category : #private }
CommonUserAccountComponent >> updateUserData [
	super updateUserData.
	cardComponent updateCard: self session user card
]
