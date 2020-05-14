Class {
	#name : #UserSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
UserSession >> updateCard [
"actualiza los datos de la tarjeta del usuario cargado en la base de datos"
]

{ #category : #'as yet unclassified' }
UserSession >> updateUser [
"actualiza los datos de un usuario en la base de datos"
]

{ #category : #accessing }
UserSession >> user [
	^ user
]

{ #category : #accessing }
UserSession >> user: anUser [
	user := anUser
]
